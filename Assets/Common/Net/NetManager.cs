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
        Closed,
        Finished,
    }

    public enum EndianType
    {
        Big = 0,
        Little,
    }

    public abstract class NetManager<T> : Singleton<T>, INetInterface where T : Singleton<T>, new()
    {
        protected Action<NetState> m_ConnectCallback = null;
        private Action<byte[], int, NetState> m_ReceiveCallback = null;
        protected string m_IP = "";
        protected Int32 m_Port = 0;
        protected Socket m_Socket = null;
        protected IPackageCreator m_PackagetCreator = null;
        protected EndianType m_EndType = EndianType.Big;

        public NetManager()
        {

        }

        public void Receive(Action<byte[], int, NetState> callback)
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

        public virtual void Close(bool isPassive = true)
        {
            try
            {
                if (null != m_Socket)
                {
                    m_Socket.Shutdown(SocketShutdown.Both);
                    m_Socket.Close();
                    m_Socket = null;
                    ClearPackageCreator();
                }
            }
            catch
            {
                m_Socket = null;
            }

            if (null != m_ReceiveCallback)
            {
                if (isPassive)
                {
                    m_ReceiveCallback(null, 0, NetState.Disconnected);
                }
                else
                {
                    m_ReceiveCallback(null, 0, NetState.Closed);
                }
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

        public void ReceiveCallback(byte[] data, int lenth)
        {
            if (null == m_ReceiveCallback) return;
            if (data.Length <= 0) return;
            m_ReceiveCallback(data, lenth, NetState.Connected);
        }

        public void ConsultFinish()
        {
            m_ConnectCallback(NetState.Finished);
        }

        protected override void _release()
        {
            Close();
            m_ConnectCallback = null;
            m_ReceiveCallback = null;
        }

        public abstract void SetPackageCreator(IPackageCreator creator);
        public abstract void ClearPackageCreator();
    }
}
