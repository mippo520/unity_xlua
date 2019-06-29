using Assets.Common.Log;
using Assets.Common.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace Assets.Common.Net
{
    public abstract class IPackageCreator
    {
        protected static byte[] s_Key;
        protected static uint s_SendIndex = 0;
        protected static uint s_RecvIndex = 0;

        private EndianType m_EndType = EndianType.Big;
        private int m_PackageLenSize = 0;
        private Socket m_Socket = null;
        private NetManager m_Manager = null;

        protected static void SetKey(ref List<byte>[] arrKey)
        {
            if (arrKey.Length <= 0) return;
            int nKeyLen = arrKey[0].Count;
            for (int i = 1; i < arrKey.Length; ++i)
            {
                nKeyLen = MathFuc.MinMultiple(nKeyLen, arrKey[i].Count);
            }
            s_Key = new byte[nKeyLen];

            for (int i = 0; i < nKeyLen; ++i)
            {
                byte sz = 0;
                for (int j = 0; j < arrKey.Length; ++j)
                {
                    int nIdx = i % arrKey[j].Count;
                    if (0 == j)
                    {
                        sz = arrKey[j][nIdx];
                    }
                    else
                    {
                        sz ^= arrKey[j][nIdx];
                    }
                }
                s_Key[i] = sz;

            }
        }

        protected static int KeyIdx
        {
            set
            {
                s_SendIndex = ((uint)value) % ((uint)s_Key.Length);
                s_RecvIndex = s_SendIndex;
            }
        }

        public EndianType endianType
        {
            get { return m_EndType; }
            set { m_EndType = value; }
        }

        public int packageLenSize
        {
            get { return m_PackageLenSize; }
            set { m_PackageLenSize = value; }
        }

        public Socket socket
        {
            get { return m_Socket; }
            set { m_Socket = value; }
        }

        public NetManager manager
        {
            get { return m_Manager; }
            set { m_Manager = value; }
        }

        public abstract void Receive();
        public virtual void Send(ref byte[] data)
        {
            Info.Error("This creator can not send message!");
        }


        protected int _getPackageLenth(byte[] data)
        {
            if (2 == m_PackageLenSize)
            {
                var ret = BitConverter.ToInt16(data, 0);
                if (EndianType.Big == m_EndType)
                {
                    return IPAddress.NetworkToHostOrder(ret);
                }
                else
                {
                    return ret;
                }
            }
            else if (4 == m_PackageLenSize)
            {
                var ret = BitConverter.ToInt32(data, 0);
                if (EndianType.Big == m_EndType)
                {
                    return IPAddress.NetworkToHostOrder(ret);
                }
                else
                {
                    return ret;
                }
            }
            else
            {
                return 0;
            }
        }

    }
}
