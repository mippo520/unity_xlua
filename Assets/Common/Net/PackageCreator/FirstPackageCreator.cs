using Assets.Common.Log;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace Assets.Common.Net
{
    public class FirstPackageCreator : IPackageCreator
    {
        public override void Receive()
        {
            int packageLenth = 36;
            var data = new byte[packageLenth];
            try
            {
                socket.BeginReceive(data, 0, packageLenth, SocketFlags.None, _onReceive, data);
            }
            catch
            {
                manager.Close();
            }
        }

        private void _onReceive(IAsyncResult ar)
        {
            try
            { 
                int rEnd = socket.EndReceive(ar);
                if (rEnd <= 0) manager.Close();
                var lenthData = ar.AsyncState as byte[];
                var arrKey = new List<byte>[2];
                arrKey[0] = lenthData.Skip(0).Take(13).ToList<byte>();
                arrKey[1] = lenthData.Skip(13).Take(19).ToList<byte>();
                SetKey(ref arrKey);

                var ret = BitConverter.ToInt32(lenthData, 32);
                if (EndianType.Big == endianType)
                {
                    ret = IPAddress.NetworkToHostOrder(ret);
                }
                KeyIdx = ret;
                manager.SetPackageCreator(new NormalPackageCreator());
                manager.StartReceive();
            }
            catch
            {
                manager.Close();
            }

        }
    }
}
