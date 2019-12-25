using Assets.Common.Log;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace Assets.Common.Net.PackageCreator
{
    public class NormalPackageCreator : IPackageCreator
    {
        public override void Receive()
        {
            var data = new byte[packageLenSize];
            try
            {
                socket.BeginReceive(data, 0, packageLenSize, SocketFlags.None, new System.AsyncCallback(_onReceiveSizeCallback), data);
            }
            catch ( Exception )
            {
                Info.Error("NormalPackageCreator Receive error!");
                manager.Close();
            }

        }

        public override void Send(ref byte[] data)
        {
            if (null == socket) return;
            _encode(ref data);
            int len = data.Length;
            if (EndianType.Big == endianType)
            {
                len = IPAddress.NetworkToHostOrder(len);
            }
            var stream = new MemoryStream();
            stream.Write(BitConverter.GetBytes(len), 0, packageLenSize);
            stream.Write(data, 0, data.Length);
            var sendData = stream.ToArray();

            try
            {
                socket.BeginSend(sendData, 0, sendData.Length, SocketFlags.None, new System.AsyncCallback(_sendCallback), null);
            }
            catch
            {
                manager.Close();
            }
        }


        private void _sendCallback(IAsyncResult ar)
        {
            try
            {
                socket.EndSend(ar);
            }
            catch
            {
                manager.Close();
            }
        }

        private void _onReceiveSizeCallback(IAsyncResult ar)
        {
            int rEnd = 0;
            try
            {
                rEnd = socket.EndReceive(ar);

            }
            catch
            {
                manager.Close();
            }

            if (rEnd > 0)
            {
                var lenthData = ar.AsyncState as byte[];
                var length = _getPackageLenth(lenthData);
                if (length <= 0)
                {
                    manager.Close();
                }
                else if (length > 100000)
                {
                    Info.Error("Package too large to receive! size is " + length);
                    manager.Close();
                }
                else
                {
                    var data = new byte[length];
                    socket.BeginReceive(data, 0, length, SocketFlags.None, new System.AsyncCallback(_onReceivePackageCallback), data);
                }
            }
        }

        private void _onReceivePackageCallback(IAsyncResult ar)
        {
            int rEnd = 0;
            try
            {
                rEnd = socket.EndReceive(ar);
            }
            catch
            {
                manager.Close();
            }

            if (rEnd > 0)
            {
                var data = ar.AsyncState as byte[];
                _decode(ref data);
                manager.ReceiveCallback(data, rEnd);
                Receive();
            }
        }


        private void _decode(ref byte[] data)
        {
            for (int i = 0; i < data.Length; ++i)
            {
                data[i] ^= s_Key[s_RecvIndex];
                ++s_RecvIndex;
                if (s_RecvIndex >= s_Key.Length)
                {
                    s_RecvIndex = 0;
                }
            }
        }

        private void _encode(ref byte[] data)
        {
            for (int i = 0; i < data.Length; ++i)
            {
                var before = data[i];
                var key = s_Key[s_SendIndex];
                data[i] ^= s_Key[s_SendIndex];
                ++s_SendIndex;
                if (s_SendIndex >= s_Key.Length)
                {
                    s_SendIndex = 0;
                }
            }
        }

    }
}
