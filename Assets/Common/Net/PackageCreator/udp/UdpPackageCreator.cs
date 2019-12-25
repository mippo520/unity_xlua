using Assets.Common.Log;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace Assets.Common.Net.PackageCreator
{
    class UdpPackageCreator : IPackageCreator
    {
        private static int s_PackageLenth = 1024 * 1024;
        private byte[] m_Data = new byte[s_PackageLenth];
        private EndPoint m_EndPoint = null;
       
        public EndPoint endPoint
        {
            get { return m_EndPoint; }
            set { m_EndPoint = value; }
        }


        public override void Receive()
        {
            try
            {
                if (null != socket)
                {
                    EndPoint point = new IPEndPoint(IPAddress.Any, 0);
                    socket.BeginReceiveFrom(m_Data, 0, s_PackageLenth, SocketFlags.None, ref point, new System.AsyncCallback(_onReceive), point);
                }
            }
            catch
            {
                Info.Error("UdpPackageCreator Receive error!");
            }
        }

        private void _onReceive(IAsyncResult ar)
        {
            int rEnd = 0;
            try
            {
                if (null != socket)
                {
                    rEnd = socket.EndReceiveFrom(ar, ref m_EndPoint);
                }
            }
            catch (Exception ex)
            {
                Info.Error(string.Format("UdpPackageCreator _onReceive error! rEnd = {0}, exc = {1}", rEnd, ex.Message));
            }

            if (rEnd > 0)
            {
                var ep = ar.AsyncState as EndPoint;
                Info.Debug("UdpPackageCreator received ep is " + ep.ToString() + " length is " + rEnd + " message is " + System.Text.Encoding.Default.GetString(m_Data, 0, rEnd));
                manager.ReceiveCallback(m_Data, rEnd);
            }
            Receive();
        }


        public override void Send(ref byte[] data)
        {
            if (null == socket) return;

            try
            {
                if (null != socket)
                {
                    socket.BeginSendTo(data, 0, data.Length, SocketFlags.None, m_EndPoint, new System.AsyncCallback(_sendCallback), null);
                }
            }
            catch (Exception ex)
            {
                Info.Error(string.Format("UdpPackageCreator Send error! exc = {0}", ex.Message));
            }
        }

        private void _sendCallback(IAsyncResult ar)
        {
            try
            {
                if (null != socket)
                {
                    socket.EndSendTo(ar);
                }
            }
            catch (Exception ex)
            {
                Info.Error(string.Format("UdpPackageCreator _sendCallback error! exc = {0}", ex.Message));
            }
        }
    }
}
