using Assets.Common.Log;
using Assets.Common.Singleton;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using UnityEditor;
using UnityEngine;

namespace Assets.Common.Resource
{
    public class ResourcesManager : GamObjSingleton<ResourcesManager>
    {
        private AssetBundleManifest m_Manifest = null;
        private string AssetBundlePath = Application.streamingAssetsPath + "/";

        private Dictionary<string, ResourcesCount> m_DicAssetBundlesCount = new Dictionary<string, ResourcesCount>();
        private Dictionary<string, UnityEngine.Object> m_DicAsset = new Dictionary<string, UnityEngine.Object>();
        private Coroutine m_CurCoroutine = null;
        private bool m_bInWaiting = false;

        public void Init(Action callback = null)
        {
            StartCoroutine(this._init(callback));
        }

        public void LoadAssetBundleAsync<T>(string[] arrPath, T t) where T : class
        {
            StartCoroutine(this._startAsyncMethod(this._loadAssetBundlesAsync(arrPath, t)));
        }

        public void LoadAssetBundleAsync(string[] arrPath, Action<string[]> callback = null)
        {
            StartCoroutine(this._startAsyncMethod(this._loadAssetBundlesAsync(arrPath, callback)));
        }

        public UnityEngine.Object LoadAsset(string path)
        {
#if UNITY_EDITOR
            return AssetDatabase.LoadAssetAtPath(path, typeof(UnityEngine.Object));
#else

            if (m_DicAsset.ContainsKey(path))
            {
                return m_DicAsset[path];
            }
            else
            {
                return null;
            }
#endif
        }


        public T LoadAsset<T>(string path) where T : UnityEngine.Object
        {
#if UNITY_EDITOR
            return AssetDatabase.LoadAssetAtPath<T>(path);
#else
            if (m_DicAsset.ContainsKey(path))
            {
                return m_DicAsset[path] as T;
            }
            else
            {
                return null;
            }
#endif
        }


        public void UnloadAssetBundle(string[] arrPath)
        {
#if !UNITY_EDITOR
            StartCoroutine(this._startMethod<Action<string[]>>(this._unloadAssetBundle, new object[] { arrPath }));
#endif
        }

        private IEnumerator _init(Action callback)
        {
#if UNITY_EDITOR
            yield return 0;
            if (null != callback)
            {
                callback();
            }
#else

            var request = AssetBundle.LoadFromFileAsync(this.AssetBundlePath + "StreamingAssets");
            yield return request;
            var manifestReq = request.assetBundle.LoadAssetAsync<AssetBundleManifest>("AssetBundleManifest");
            yield return manifestReq;
            m_Manifest = manifestReq.asset as AssetBundleManifest;
            request.assetBundle.Unload(false);
            foreach (string ab in m_Manifest.GetAllAssetBundles())
            {
                print(ab);
            }
            if (null != callback)
            {
                callback();
            }
            Resources.UnloadUnusedAssets();
#endif
        }

        private IEnumerator _startAsyncMethod(IEnumerator routine)
        {
            while (m_bInWaiting)
            {
                yield return 0;
            }
            while (null != m_CurCoroutine)
            {
                m_bInWaiting = true;
                yield return m_CurCoroutine;
                m_CurCoroutine = null;
                m_bInWaiting = false;
            }
            m_CurCoroutine = StartCoroutine(routine);
        }

        private IEnumerator _startMethod<T>(T t, object[] args = null)
        {
            while (m_bInWaiting)
            {
                yield return 0;
            }
            while (null != m_CurCoroutine)
            {
                m_bInWaiting = true;
                yield return m_CurCoroutine;
                m_CurCoroutine = null;
                m_bInWaiting = false;
            }
            t.GetType().GetMethod("Invoke").Invoke(t, args);
        }

        private IEnumerator _loadAssetBundlesAsync<T>(string[] arrPath, T t) where T : class
        {
            Info.Debug("Begin load assetBundle!");

            MethodInfo methodInfo = null;
#if UNITY_EDITOR
            yield return 0;
            if (null != t)
            {
                methodInfo = t.GetType().GetMethod("FrameCallback");
                if (null != methodInfo)
                {
                    methodInfo.Invoke(t, new object[] { 1.0f });
                }
            }
            yield return 0;
            if (null != t)
            {
                methodInfo = t.GetType().GetMethod("CompleteCallback");
                if (null != methodInfo)
                {
                    methodInfo.Invoke(t, new object[] { arrPath });
                }
                else
                {
                    methodInfo = t.GetType().GetMethod("Invoke");
                    if (null != methodInfo)
                    {
                        t.GetType().GetMethod("Invoke").Invoke(t, new object[] { arrPath });
                    }
                }
            }
#else

            float totalProgress = 0.0f;
            if (null != t)
            {
                methodInfo = t.GetType().GetMethod("FrameCallback");
            }
            Dictionary<string, AssetBundleCreateRequest> abDicReq = new Dictionary<string, AssetBundleCreateRequest>();
            Dictionary<string, AssetBundleRequest> assetDicReq = new Dictionary<string, AssetBundleRequest>();
            List<AssetBundle> listAssetBundle = new List<AssetBundle>();
            // 先计算依赖的ab
            HashSet<string> setPath = new HashSet<string>();
            this._getAllAssetBundles(arrPath, ref setPath);

            int nCount = setPath.Count;
            float oneResPercent = 1.0f / nCount;

            foreach (string path in setPath)
            {
                string pathTmp = AssetBundlePath + path;
                if (m_DicAssetBundlesCount.ContainsKey(pathTmp))
                {
                    ++m_DicAssetBundlesCount[pathTmp].Count;
                    totalProgress += oneResPercent;
                }
                else
                {  
                    var request = AssetBundle.LoadFromFileAsync(pathTmp);
                    abDicReq.Add(pathTmp, request);                    
                }
            }

            // 等待assetbundle加载完成
            int nAssetCount = 0;
            while (abDicReq.Count > 0)
            {
                List<string> listRemKey = new List<string>();
                float progressTmp = 0.0f;
                foreach (var pair in abDicReq)
                {
                    if (!pair.Value.isDone)
                    {
                        progressTmp += pair.Value.progress / nCount / 2;
                    }
                    else
                    {
                        totalProgress += oneResPercent / 2;
                        listRemKey.Add(pair.Key);
                        var arrAssetName = pair.Value.assetBundle.GetAllAssetNames();
                        m_DicAssetBundlesCount.Add(pair.Key, new ResourcesInfo<string[]>(1, arrAssetName));
                        listAssetBundle.Add(pair.Value.assetBundle);

                        foreach (string assetName in arrAssetName)
                        {
                            var request = pair.Value.assetBundle.LoadAssetAsync(assetName);
                            assetDicReq.Add(assetName, request);
                            ++nAssetCount;
                        }
                    }
                }
                // 移除加载完成的迭代器
                foreach (string key in listRemKey)
                {
                    abDicReq.Remove(key);
                }

                progressTmp += totalProgress;

                if (null != methodInfo)
                {
                    methodInfo.Invoke(t, new object[] { progressTmp });
                }
                yield return new WaitForEndOfFrame();
            }

            float onePercentAsset = 1.0f / nAssetCount;
            // 等待assetbundle中的资源加载完成
            while (assetDicReq.Count > 0)
            {
                List<string> listRemKey = new List<string>();
                float progressTmp = 0.0f;
                foreach (var pair in assetDicReq)
                {
                    if (!pair.Value.isDone)
                    {
                        progressTmp += pair.Value.progress / nAssetCount / 2;
                    }
                    else
                    {
                        totalProgress += onePercentAsset / 2;
                        listRemKey.Add(pair.Key);
                        m_DicAsset.Add(pair.Key, pair.Value.asset);
                    }
                }
                // 移除加载完成的迭代器
                foreach (string key in listRemKey)
                {
                    assetDicReq.Remove(key);
                }
                progressTmp += totalProgress;
                if (null != methodInfo)
                {
                    methodInfo.Invoke(t, new object[] { progressTmp });
                }
                yield return new WaitForEndOfFrame();
            }

            if (null != t)
            {
                methodInfo = t.GetType().GetMethod("CompleteCallback");
                if (null != methodInfo)
                {
                    methodInfo.Invoke(t, new object[] { arrPath });
                }
                else
                {
                    methodInfo = t.GetType().GetMethod("Invoke");
                    if (null != methodInfo)
                    {
                        t.GetType().GetMethod("Invoke").Invoke(t, new object[] { arrPath });
                    }
                }
            }

            // 释放assetbundle
            foreach (var ab in listAssetBundle)
            {
                ab.Unload(false);
            }
#endif

        }

        private void _unloadAssetBundle(string[] arrPath)
        {
            Info.Debug("Begin unload assetBundle!");

            // 先计算依赖的ab
            HashSet<string> setPath = new HashSet<string>();
            this._getAllAssetBundles(arrPath, ref setPath);

            foreach (string path in setPath)
            {
                string pathTmp = AssetBundlePath + path;
                if (m_DicAssetBundlesCount.ContainsKey(pathTmp))
                {
                    var resInfo = m_DicAssetBundlesCount[pathTmp] as ResourcesInfo<string[]>;
                    --resInfo.Count;
                    if (0 == resInfo.Count)
                    {
                        foreach (string assetName in resInfo.Object)
                        {
                            if (m_DicAsset.ContainsKey(assetName))
                            {
                                Info.Debug("unload asset name is " + assetName);
                                if (!assetName.EndsWith(".prefab"))
                                {
                                    Resources.UnloadAsset(m_DicAsset[assetName]);
                                }
                                m_DicAsset.Remove(assetName);
                            }
                            else
                            {
                                Info.Error(string.Format("unload asset {0} without loaded! ", assetName));
                            }
                        }
                        m_DicAssetBundlesCount.Remove(pathTmp);
                        Resources.UnloadUnusedAssets();
                    }
                }
                else
                {
                    Info.Error(string.Format("unload assetbundle {0} without loaded! ", path));
                }
            }

            Resources.UnloadUnusedAssets();
        }

        private void _getAllAssetBundles(string[] arrPath, ref HashSet<string> outSetPath)
        {
            foreach (string path in arrPath)
            {
                if (!outSetPath.Contains(path))
                {
                    outSetPath.Add(path);
                    this._getAllAssetBundles(m_Manifest.GetAllDependencies(path), ref outSetPath);
                }
            }
        }

        private string _getFullPath(string path)
        {
            return Application.dataPath + "/" + path;
        }
    }
}
