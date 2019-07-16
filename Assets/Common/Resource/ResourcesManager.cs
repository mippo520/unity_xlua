// #define DEBUG_ASSETBUNDLE

using Assets.Common.Log;
using Assets.Common.Singleton;
using Assets.Common.Tools;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using UnityEditor;
using UnityEngine;
using UnityEngine.Networking;

namespace Assets.Common.Resource
{
    public enum HotUpdateRes
    {
        Failed = 0,
        Complete,
        Begin,
    };

    public class ResourcesManager : GameObjSingleton<ResourcesManager>
    {
        private AssetBundleManifest m_Manifest = null;
        private string AssetBundlePath = Application.streamingAssetsPath + "/";

        private Dictionary<string, ResourcesCount> m_DicAssetBundlesCount = new Dictionary<string, ResourcesCount>();
        private Dictionary<string, UnityEngine.Object> m_DicAsset = new Dictionary<string, UnityEngine.Object>();
        private Coroutine m_CurCoroutine = null;
        private bool m_bInWaiting = false;
        private Dictionary<string, FileData> m_DicFileData = new Dictionary<string, FileData>();

        public const string s_VersionFile = "version";
        public const string s_VersionFileName = "version.txt";
        public const string s_FileData = "file_data";
        public const string s_FileDataFileName = s_FileData + ".txt";

        private static int compareVersion(string version1, string version2)
        {
            int n = 0;

            var arrV1 = version1.Split('.');
            var arrV2 = version2.Split('.');

            int idx = 0;
            foreach (string code in arrV1)
            {
                if (idx >= arrV2.Length)
                {
                    n = 1;
                    break;
                }

                int v1 = System.Convert.ToInt32(code);
                int v2 = System.Convert.ToInt32(arrV2[idx]);
                if (v1 > v2)
                {
                    n = 1;
                    break;
                }
                else if (v1 < v2)
                {
                    n = -1;
                    break;
                }
                ++idx;
            }

            if (0 == n && idx < arrV2.Length)
            {
                n = -1;
            }

            return n;
        }

        public void Hotupdate(Action<HotUpdateRes, Int64, string> resCallback, Action<Int64> processCallback)
        {
            StartCoroutine(this._hotUpdate(resCallback, processCallback));
        }

        public void Init(Action callback = null)
        {
            StartCoroutine(this._init(callback));
        }

        public void LoadAssetBundleAsync(string[] arrPath, Action<float> frameCallback, Action<string[]> completeCallback)
        {
            StartCoroutine(this._startAsyncMethod(this._loadAssetBundlesAsync(arrPath, frameCallback, completeCallback)));
        }

        public UnityEngine.Object LoadAsset(string path)
        {
#if UNITY_EDITOR && !DEBUG_ASSETBUNDLE
            return AssetDatabase.LoadAssetAtPath(path, typeof(UnityEngine.Object));
#else
            path = path.ToLower();
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
#if UNITY_EDITOR && !DEBUG_ASSETBUNDLE
            return AssetDatabase.LoadAssetAtPath<T>(path);
#else
            path = path.ToLower();
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
#if !UNITY_EDITOR || DEBUG_ASSETBUNDLE
            StartCoroutine(this._startMethod<Action<string[]>>(this._unloadAssetBundle, new object[] { arrPath }));
#endif
        }

        private IEnumerator _hotUpdate(Action<HotUpdateRes, Int64, string> resCallback, Action<Int64> processCallback)
        {
#if UNITY_EDITOR && !DEBUG_ASSETBUNDLE
//             yield return 0;
//             resCallback(HotUpdateRes.Complete, 0, "");
// #else
            VersionFileData curData = null;
            var localText = Resources.Load<TextAsset>(s_VersionFile);
            var localData = JsonConvert.DeserializeObject<VersionFileData>(localText.text);
            if (!File.Exists(Application.persistentDataPath + "/" + s_VersionFileName))
            {
                curData = localData;
                File.WriteAllText(Application.persistentDataPath + "/" + s_VersionFileName, localText.text);
            }
            else
            {
                var downloadText = File.ReadAllText(Application.persistentDataPath + "/" + s_VersionFileName);
                curData = JsonConvert.DeserializeObject<VersionFileData>(downloadText);
                if (compareVersion(localData.version, curData.version) > 0)
                {
                    curData = localData;
                    File.WriteAllText(Application.persistentDataPath + "/" + s_VersionFileName, localText.text);
                }
            }


            UnityWebRequest getData = UnityWebRequest.Get(curData.url + "/" + s_VersionFileName);
            yield return getData.SendWebRequest();
            if (getData.isHttpError || getData.isNetworkError)
            {
                Info.Error("download version file from " + curData.url + "/" + s_VersionFileName + " error! " + getData.error);
                resCallback(HotUpdateRes.Failed, 0, getData.error);
                yield break;
            }

            var netVersion = JsonConvert.DeserializeObject<VersionFileData>(getData.downloadHandler.text);
            if (compareVersion(curData.version, netVersion.version) >= 0)
            {
                Info.Debug("lastest version! " + curData.version);

                if (!File.Exists(Application.persistentDataPath + "/" + s_FileDataFileName))
                {
                    var localFileDataText = Resources.Load<TextAsset>(s_FileData);
                    File.WriteAllText(Application.persistentDataPath + "/" + s_FileDataFileName, localFileDataText.text);
                    m_DicFileData = JsonConvert.DeserializeObject<VersionFileData>(localFileDataText.text).data;
                }
                else
                {
                    var downloadFileDataText = File.ReadAllText(Application.persistentDataPath + "/" + s_FileDataFileName);
                    m_DicFileData = JsonConvert.DeserializeObject<VersionFileData>(downloadFileDataText).data;
                }

                resCallback(HotUpdateRes.Complete, 0, "");
                yield break;
            }

            var netText = getData.downloadHandler.text;
            curData = netVersion;
            getData = UnityWebRequest.Get(curData.url + "/" + s_FileDataFileName);
            yield return getData.SendWebRequest();
            if (getData.isHttpError || getData.isNetworkError)
            {
                Info.Error("download filedata file error! " + getData.error);
                resCallback(HotUpdateRes.Failed, 0, getData.error);
                yield break;
            }

            var netFileDataText = getData.downloadHandler.text;
            var netFileData = JsonConvert.DeserializeObject<VersionFileData>(netFileDataText);
            VersionFileData curFileData = null;
            if (!File.Exists(Application.persistentDataPath + "/" + s_FileDataFileName))
            {
                var localFileDataText = Resources.Load<TextAsset>(s_FileData);
                File.WriteAllText(Application.persistentDataPath + "/" + s_FileDataFileName, localFileDataText.text);
                curFileData = JsonConvert.DeserializeObject<VersionFileData>(localFileDataText.text);
            }
            else
            { 
                var downloadFileDataText = File.ReadAllText(Application.persistentDataPath + "/" + s_FileDataFileName);
                curFileData = JsonConvert.DeserializeObject<VersionFileData>(downloadFileDataText);
            }

            Int64 totalSize = 0;
            Int64 completeSize = 0;
            Dictionary<string, FileData> dicUpdateFile = new Dictionary<string, FileData>();
            foreach (KeyValuePair<string, FileData> pair in netFileData.data)
            {
                if (!curFileData.data.ContainsKey(pair.Key) || curFileData.data[pair.Key].md5 != pair.Value.md5)
                {
                    totalSize += pair.Value.size;
                    dicUpdateFile.Add(pair.Key, pair.Value);
                }
            }

            if (totalSize > 0 && dicUpdateFile.Count() > 0)
            {
                resCallback(HotUpdateRes.Begin, totalSize, "");
                foreach (KeyValuePair<string, FileData> pair in dicUpdateFile)
                {
                    getData = UnityWebRequest.Get(curData.url + "/" + pair.Key);
                    yield return getData.SendWebRequest();
                    if (getData.isHttpError || getData.isNetworkError)
                    {
                        Info.Error("download " + pair.Key + " error! " + getData.error);
                        resCallback(HotUpdateRes.Failed, 0, getData.error);
                        yield break;
                    }
                    var data = getData.downloadHandler.data;
                    if (FileManager.md5(ref data) != pair.Value.md5)
                    {
                        Info.Error(pair.Key + " compare md5 error! ");
                        resCallback(HotUpdateRes.Failed, 0, getData.error);
                        yield break;
                    }
                    File.WriteAllBytes(Application.persistentDataPath + "/" + pair.Key, getData.downloadHandler.data);
                    completeSize += pair.Value.size;
                    processCallback(completeSize);

                    pair.Value.local = false;
                    curFileData.data[pair.Key] = pair.Value;
                    File.WriteAllText(Application.persistentDataPath + "/" + s_FileDataFileName, JsonConvert.SerializeObject(curFileData));
                }
                File.WriteAllText(Application.persistentDataPath + "/" + s_VersionFileName, netText);
                File.WriteAllText(Application.persistentDataPath + "/" + s_FileDataFileName, netFileDataText);
                m_DicFileData = curFileData.data;
                resCallback(HotUpdateRes.Complete, completeSize, "");
            }
            else
            {
                File.WriteAllText(Application.persistentDataPath + "/" + s_VersionFileName, netText);
                File.WriteAllText(Application.persistentDataPath + "/" + s_FileDataFileName, netFileDataText);
                m_DicFileData = curFileData.data;
                resCallback(HotUpdateRes.Complete, 0, "");
            }
#endif
        }

        private IEnumerator _init(Action callback)
        {

#if UNITY_EDITOR && !DEBUG_ASSETBUNDLE
            yield return 0;
            if (null != callback)
            {
                callback();
            }
#else
            var request = AssetBundle.LoadFromFileAsync(this._getFullPath("StreamingAssets"));
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

        private IEnumerator _loadAssetBundlesAsync(string[] arrPath, Action<float> frameCallback, Action<string[]> completeCallback)
        {

#if UNITY_EDITOR && !DEBUG_ASSETBUNDLE
            yield return 0;
            if (null != frameCallback)
            {
                frameCallback(1.0f);
            }
            yield return 0;
            if (null != completeCallback)
            {
                completeCallback(arrPath);
            }
#else

            float totalProgress = 0.0f;
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
                string pathTmp = this._getFullPath(path);
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
                if (null != frameCallback)
                {
                    frameCallback(progressTmp);
                }
                yield return 0;
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
                if (null != frameCallback)
                {
                    frameCallback(progressTmp);
                }

                yield return 0;
            }

            if (null != completeCallback)
            {
                completeCallback(arrPath);
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
                string pathTmp = this._getFullPath(path);
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
            if (m_DicFileData.ContainsKey(path) && !m_DicFileData[path].local)
            {
                return Application.persistentDataPath + "/" + path;
            }
            return AssetBundlePath + path;
        }
    }
}
