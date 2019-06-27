using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace Assets.Common.Resource
{
    public class ResourcesCount
    {
        private int m_Count = 0;
        
        public ResourcesCount(int count)
        {
            m_Count = count;
        }

        public int Count
        {
            get
            {
                return m_Count;
            }

            set
            {
                m_Count = value;
            }
        }
    }

    public class ResourcesInfo<T> : ResourcesCount
    {
        private T m_Obj = default(T);

        public ResourcesInfo(int count, T obj)
            : base(count)
        {
            this.m_Obj = obj;
        }

        public T Object
        {
            get
            {
                return m_Obj;
            }

            set
            {
                m_Obj = value;
            }
        }
    }
}
