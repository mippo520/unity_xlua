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
                socket.BeginReceive(data, 0, packageLenth, SocketFlags.None, new System.AsyncCallback(_onReceive), data);
            }
            catch
            {
                Info.Error("FirstPackageCreator Receive error!");
                manager.Close();
            }
        }

        private void _onReceive(IAsyncResult ar)
        {
            int rEnd = 0;
            try
            { 
                rEnd = socket.EndReceive(ar);
            }
            catch
            {
                Info.Error(string.Format("FirstPackageCreator _onReceive error! rEnd = {0}", rEnd));
                manager.Close();
            }

            if (rEnd > 0)
            {
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
                manager.ConsultFinish();
            }
        }
    }
}
