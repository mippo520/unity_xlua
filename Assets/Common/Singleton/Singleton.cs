using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assets.Common.Singleton
{
    public abstract class Singleton<T> where T : Singleton<T>, new()
    {
        private static T gInstance = null;

        public static T GetInstance()
        {
            if (null == gInstance)
            {
                gInstance = new T();
            }

            return gInstance;
        }

        public static void DelInstance()
        {
            if (null != gInstance)
            {
                gInstance._release();
                gInstance = null;
            }
        }

        protected virtual void _release()
        {
        }
    }
}
