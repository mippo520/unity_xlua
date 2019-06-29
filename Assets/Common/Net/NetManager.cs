using Assets.Common.Log;
using Assets.Common.Singleton;
using Assets.Common.Tools;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace Assets.Common.Net
{
    public enum NetState
    {
        Connected = 0,
        Disconnected,
        Closed
    }

    public enum EndianType
    {
        Big = 0,
        Little,
    }

    public class NetManager : Singleton<NetManager>
    {
        private Socket m_Socket = null;
        private Action<NetState> m_ConnectCallback = null;
        private Action<byte[], NetState> m_ReceiveCallback = null;
        private int m_PackageLenSize = 0;
        private EndianType m_EndType = EndianType.Big;
        private IPackageCreator m_PackagetCreator = null;
        private IPackageCreator m_OrignCreator = null;
        private string m_IP = "";
        private Int32 m_Port = 0;

        public NetManager()
        {

        }

        public void Init(EndianType endian, int packageLenthSize, IPackageCreator creator)
        {
            m_PackageLenSize = packageLenthSize;
            m_EndType = endian;
            m_OrignCreator = creator;
        }

        public void SetPackageCreator(IPackageCreator creator)
        {
            if (null == creator) return;
            m_PackagetCreator = creator;
            m_PackagetCreator.endianType = m_EndType;
            m_PackagetCreator.packageLenSize = m_PackageLenSize;
            m_PackagetCreator.manager = this;
            m_PackagetCreator.socket = m_Socket;
        }


        public void Connect(ref string ip, Int32 port, Action<NetState> callback)
        {
            if (null == callback) return;
            _initSocket();
            SetPackageCreator(m_OrignCreator);
            try
            {
                m_Socket.BeginConnect(ip, port, _onConnectCallback, this);
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
            m_Socket.BeginConnect(m_IP, m_Port, _onConnectCallback, this);
        }

        public void Receive(Action<byte[], NetState> callback)
        {
            if (null == callback) return;
            m_ReceiveCallback = callback;
            StartReceive();
        }

        public void Send(ref byte[] data)
        {
            if (null == m_PackagetCreator) return;
            m_PackagetCreator.Send(ref data);
        }

        public void Close(bool isPassive = true)
        {
            try
            {
                if (null != m_Socket)
                {
                    m_Socket.Shutdown(SocketShutdown.Both);
                    m_Socket.Close();
                    m_Socket = null;
                    if (null != m_ReceiveCallback)
                    {
                        if (isPassive)
                        {
                            m_ReceiveCallback(null, NetState.Disconnected);
                        }
                        else
                        {
                            m_ReceiveCallback(null, NetState.Closed);
                        }
                    }
                }
            }
            catch
            {
                m_Socket = null;
            }
        }

        public void StartReceive()
        {
            if (null != m_PackagetCreator)
            {
                m_PackagetCreator.Receive();
            }
            else
            {
                Close();
            }
        }

        public void ReceiveCallback(byte[] data)
        {
            if (null == m_ReceiveCallback) return;
            if (data.Length <= 0) return;
            m_ReceiveCallback(data, NetState.Connected);
        }

        private void _onConnectCallback(IAsyncResult ar)
        {
            if (null == m_ConnectCallback) return;
            try
            {
                m_Socket.EndConnect(ar);
                m_ConnectCallback(NetState.Connected);
            }
            catch
            {
                m_ConnectCallback(NetState.Disconnected);
                Close();
            }
        }

        private void _initSocket()
        {
            if (null != m_Socket) return;
            m_Socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            m_Socket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.KeepAlive, true);
        }

        private bool _isIdxEnd(int idx, ref string[] arrKey)
        {
            bool ret = true;

            foreach (string key in arrKey)
            {
                int len = key.Length;
                if ( 0 != (idx + 1) % len)
                {
                    ret = false;
                    break;
                }
            }

            return ret;
        }

        protected override void _release()
        {
            Close();
            m_ConnectCallback = null;
            m_ReceiveCallback = null;
        }
    }
}
