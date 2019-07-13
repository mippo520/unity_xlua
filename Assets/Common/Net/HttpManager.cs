using Assets.Common.Log;
using Assets.Common.Singleton;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine.Networking;

namespace Assets.Common.Net
{
    using HTTP_CALLBACK = Action<Int64, HttpState, string>;

    public enum HttpState
    {
        Failed = 0,
        Complete,
    }

    public class HttpManager : GameObjSingleton<HttpManager>
    {
        private Int64 m_Id = 0;

        public Int64 Get(string url, HTTP_CALLBACK callback)
        {
            var id = ++m_Id;
            StartCoroutine(this._get(id, url, callback));
            return id;
        }

        private IEnumerator _get(Int64 id, string url, HTTP_CALLBACK callback)
        {
            UnityWebRequest getData = UnityWebRequest.Get(url);
            yield return getData.SendWebRequest();
            if (getData.isHttpError || getData.isNetworkError)
            {
                Info.Error("HttpManager get error! " + url);
                callback(id, HttpState.Failed, getData.error);
            }
            else
            {
                callback(id, HttpState.Complete, getData.downloadHandler.text);
            }
        }
    }
}
