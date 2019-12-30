using Assets.Common.Log;
using Assets.Common.Net.PackageCreator;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace Assets.Common.Net
{
    public class UdpManager : NetManager<UdpManager>
    {
        private EndPoint m_EP = null;

        public bool Init(EndianType endian, string ip, Int32 port, IPackageCreator creator)
        {
            bool bSuccess = false;
            Close();
            m_EndType = endian;
            m_Port = port;
            m_IP = ip;
            bSuccess = _initSocket();
            if (bSuccess)
            {
                SetPackageCreator(creator);
            }
            return bSuccess;
        }

        private bool _initSocket()
        {
            if (null != m_Socket || null != m_EP)
            {
                Info.Warn("UdpManager initSocket Warning! socket or iep is already exist!");
                return false;
            }
            m_EP = new IPEndPoint(IPAddress.Parse(m_IP), m_Port);
            m_Socket = new Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);
            try
            {
                m_Socket.Bind(new IPEndPoint(IPAddress.Any, 0));
            }
            catch
            {
                Info.Warn("UdpManager init socket error!");
                Close();
                return false;
            }
            return true;
        }


        public override void SetPackageCreator(IPackageCreator creator)
        {
            if (null == creator) return;
            m_PackagetCreator = creator;
            m_PackagetCreator.endianType = m_EndType;
            m_PackagetCreator.manager = this;
            m_PackagetCreator.socket = m_Socket;
            ((UdpPackageCreator)m_PackagetCreator).endPoint = m_EP;
        }

        public override void ClearPackageCreator()
        {
            m_PackagetCreator.socket = null;
            ((UdpPackageCreator)m_PackagetCreator).endPoint = null;
            m_PackagetCreator = null;
        }

        public override void Close(bool isPassive = true)
        {
            m_EP = null;
            base.Close(isPassive);
        }
    }
}
