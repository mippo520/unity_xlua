using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace Assets.Common.Net
{
    public class TcpManager : NetManager<TcpManager>
    {
        private int m_PackageLenSize = 0;
        private IPackageCreator m_OrignCreator = null;

        public virtual void Init(EndianType endian, int packageLenthSize, IPackageCreator creator)
        {
            m_PackageLenSize = packageLenthSize;
            m_EndType = endian;
            m_OrignCreator = creator;
        }

        private void _initSocket()
        {
            if (null != m_Socket) return;
            m_Socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            m_Socket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.KeepAlive, true);
        }

        public override void SetPackageCreator(IPackageCreator creator)
        {
            if (null == creator) return;
            m_PackagetCreator = creator;
            m_PackagetCreator.endianType = m_EndType;
            m_PackagetCreator.packageLenSize = m_PackageLenSize;
            m_PackagetCreator.manager = this;
            m_PackagetCreator.socket = m_Socket;
        }

        public override void ClearPackageCreator()
        {
            m_PackagetCreator.socket = null;
            m_PackagetCreator = null;
        }

        public void Connect(ref string ip, Int32 port, Action<NetState> callback)
        {
            if (null == callback) return;
            _initSocket();
            SetPackageCreator(m_OrignCreator);
            try
            {
                m_Socket.BeginConnect(ip, port, new System.AsyncCallback(_onConnectCallback), this);
                m_ConnectCallback = callback;
                m_IP = ip;
                m_Port = port;
            }
            catch
            {
                Close();
            }
        }

        public void Reconnect()
        {
            if (null != m_Socket) return;
            if (null == m_OrignCreator) return;
            _initSocket();
            SetPackageCreator(m_OrignCreator);
            m_Socket.BeginConnect(m_IP, m_Port, new System.AsyncCallback(_onConnectCallback), this);
        }

        private void _onConnectCallback(IAsyncResult ar)
        {
            if (null == m_ConnectCallback) return;
            try
            {
                m_Socket.EndConnect(ar);
            }
            catch
            {
                m_Socket = null;
            }

            if (null != m_Socket)
            {
                m_ConnectCallback(NetState.Connected);
            }
            else
            {
                m_ConnectCallback(NetState.Disconnected);
            }
        }
    }
}
