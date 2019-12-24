using Assets.Common.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace Assets.Common.Singleton
{
    public abstract class GameObjSingleton<T> : MonoBehaviour where T : GameObjSingleton<T>
    {
        private static T gInstance = default(T);

        public static T GetInstance()
        {
            if (null == gInstance)
            {
                gInstance = GameObject.FindObjectOfType(typeof(T)) as T;
                if (null == gInstance)
                {
                    GameObject obj = new GameObject(typeof(T).Name);
                    gInstance = obj.AddComponent<T>();
                    if (null == EngineExt.s_DontDestroyParent)
                    {
                        EngineExt.s_DontDestroyParent = new GameObject("GlobalRoot");
                        GameObject.DontDestroyOnLoad(EngineExt.s_DontDestroyParent);
                    }
                    obj.transform.parent = EngineExt.s_DontDestroyParent.transform;
                }
            }
            return gInstance;
        }

        public static void DeleteInstance()
        {
            GameObject.Destroy(gInstance.gameObject);
            gInstance = null;
        }

        private void Awake()
        {
            _init();
        }

        protected virtual void _init()
        {
            print(string.Format("singleton {0} init !", typeof(T).Name));
        }

        private void OnDestroy()
        {
            _destroy();
        }

        protected virtual void _destroy()
        {
            print(string.Format("singleton {0} Destroy !", typeof(T).Name));
        }
    }
}
