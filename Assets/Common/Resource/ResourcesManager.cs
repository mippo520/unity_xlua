#define DEBUG_ASSETBUNDLE

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
    }

#if !UNITY_EDITOR || DEBUG_ASSETBUNDLE
    struct stWebRequestData
    {
        public UnityWebRequest req;
        public FileData fileData;
    }
#endif

    public class ResourcesManager : GameObjSingleton<ResourcesManager>
    {
        private AssetBundleManifest m_Manifest = null;
        private string AssetBundlePath = Application.streamingAssetsPath + "/";

        private Dictionary<string, ResourcesCount> m_DicAssetBundlesCount = new Dictionary<string, ResourcesCount>();
        private Dictionary<string, UnityEngine.Object> m_DicAsset = new Dictionary<string, UnityEngine.Object>();
        private Coroutine m_CurCoroutine = null;
        private bool m_bInWaiting = false;
        private Dictionary<string, FileData> m_DicFileData = new Dictionary<string, FileData>();
        // hot update
#if !UNITY_EDITOR || DEBUG_ASSETBUNDLE
        private Int64 m_UpdateTotalSize = 0;
        private string m_NetText = "";
        private VersionFileData m_CurData = null;
        private string m_NetFileDataText = "";
        private VersionFileData m_CurFileData = null;
        private Dictionary<string, FileData> m_DicUpdateFile = new Dictionary<string, FileData>();
#endif

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

        public void CompareUpdateFile(Action<HotUpdateRes, Int64, string> resCallback)
        {
            StartCoroutine(this._startAsyncMethod(this._compareUpdateFile(resCallback)));
        }

        public void Hotupdate(Action<HotUpdateRes, Int64, string> resCallback, Action<double> processCallback)
        {
            StartCoroutine(this._startAsyncMethod(this._hotUpdate(resCallback, processCallback)));
        }

        public void Init(Action callback = null)
        {
            StartCoroutine(this._startAsyncMethod(this._init(callback)));
        }

        public void LoadAssetBundleAsync(string[] arrPath, Action<float> frameCallback, Action<string[]> completeCallback)
        {
            StartCoroutine(this._startAsyncMethod(this._loadAssetBundlesAsync(arrPath, frameCallback, completeCallback)));
        }

        public UnityEngine.Object LoadAsset(string path)
        {
#if UNITY_EDITOR && !DEBUG_ASSETBUNDLE
            if (path.EndsWith(".png") || path.EndsWith(".jpg"))
            {
                return AssetDatabase.LoadAssetAtPath<Sprite>(path);
            }
            else
            {
                return AssetDatabase.LoadAssetAtPath(path, typeof(UnityEngine.Object));
            }
#else
            path = path.ToLower();
            if (m_DicAsset.ContainsKey(path))
            {
                var obj = m_DicAsset[path] as GameObject;
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

        public void UnloadAllAssetBundle()
        {
#if !UNITY_EDITOR || DEBUG_ASSETBUNDLE
            StartCoroutine(this._startMethod<Action>(this._unloadAllAssetBundle));
#endif
        }

        public void checkVersion()
        {
            var localText = Resources.Load<TextAsset>(s_VersionFile);
            var localData = JsonConvert.DeserializeObject<VersionFileData>(localText.text);
            if (!File.Exists(Application.persistentDataPath + "/" + s_VersionFileName))
            {
                // 写version文件
                File.WriteAllText(Application.persistentDataPath + "/" + s_VersionFileName, localText.text);
                // 写data文件
                var localFileDataText = Resources.Load<TextAsset>(s_FileData);
                File.WriteAllText(Application.persistentDataPath + "/" + s_FileDataFileName, localFileDataText.text);
            }
            else
            {
                var downloadText = File.ReadAllText(Application.persistentDataPath + "/" + s_VersionFileName);
                var downloadData = JsonConvert.DeserializeObject<VersionFileData>(downloadText);
                if (compareVersion(localData.version, downloadData.version) > 0)
                {
                    File.WriteAllText(Application.persistentDataPath + "/" + s_VersionFileName, localText.text);
                    // 写data文件
                    var localFileDataText = Resources.Load<TextAsset>(s_FileData);
                    File.WriteAllText(Application.persistentDataPath + "/" + s_FileDataFileName, localFileDataText.text);
                }
            }
        }

        private IEnumerator _compareUpdateFile(Action<HotUpdateRes, Int64, string> resCallback)
        {
#if UNITY_EDITOR && !DEBUG_ASSETBUNDLE
            yield return 0;
            resCallback(HotUpdateRes.Complete, 0, "0.0.1");
#else
            m_UpdateTotalSize = 0;
            m_DicUpdateFile.Clear();
            m_CurData = null;
            m_CurFileData = null;
            m_NetFileDataText = "";
            m_NetText = "";
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
                Info.Log("lastest version! " + curData.version);

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

                resCallback(HotUpdateRes.Complete, 0, curData.version);
                yield break;
            }

            m_NetText = getData.downloadHandler.text;
            curData = netVersion;
            getData = UnityWebRequest.Get(curData.url + "/" + s_FileDataFileName);
            yield return getData.SendWebRequest();
            if (getData.isHttpError || getData.isNetworkError)
            {
                Info.Error("download filedata file error! " + getData.error);
                resCallback(HotUpdateRes.Failed, 0, getData.error);
                yield break;
            }

            m_NetFileDataText = getData.downloadHandler.text;
            var netFileData = JsonConvert.DeserializeObject<VersionFileData>(m_NetFileDataText);
            if (!File.Exists(Application.persistentDataPath + "/" + s_FileDataFileName))
            {
                var localFileDataText = Resources.Load<TextAsset>(s_FileData);
                File.WriteAllText(Application.persistentDataPath + "/" + s_FileDataFileName, localFileDataText.text);
                m_CurFileData = JsonConvert.DeserializeObject<VersionFileData>(localFileDataText.text);
            }
            else
            {
                var downloadFileDataText = File.ReadAllText(Application.persistentDataPath + "/" + s_FileDataFileName);
                m_CurFileData = JsonConvert.DeserializeObject<VersionFileData>(downloadFileDataText);
            }

            foreach (KeyValuePair<string, FileData> pair in netFileData.data)
            {
                if (!m_CurFileData.data.ContainsKey(pair.Key) || m_CurFileData.data[pair.Key].md5 != pair.Value.md5)
                {
                    m_UpdateTotalSize += pair.Value.size;
                    m_DicUpdateFile.Add(pair.Key, pair.Value);
                }
            }
            m_CurData = curData;
            resCallback(HotUpdateRes.Begin, m_UpdateTotalSize, "");
#endif
        }

        private IEnumerator _hotUpdate(Action<HotUpdateRes, Int64, string> resCallback, Action<double> processCallback)
        {
#if UNITY_EDITOR && !DEBUG_ASSETBUNDLE
            yield return 0;
            resCallback(HotUpdateRes.Complete, 0, "0.0.1");
#else
            if (null == m_CurFileData)
            {
                yield return 0;
                resCallback(HotUpdateRes.Failed, 0, "current file data is null!");
                yield break;
            }
            double completePercent = 0.0f;
            double percentTmp = 0.0f;
            if (m_UpdateTotalSize > 0 && m_DicUpdateFile.Count() > 0 && null != m_CurData)
            {
                Dictionary<string, stWebRequestData> dicReq = new Dictionary<string, stWebRequestData>();
                while (dicReq.Count > 0 || m_DicUpdateFile.Count > 0)
                {
                    if (m_DicUpdateFile.Count > 0 && dicReq.Count < 5)
                    {
                        var firstPair = m_DicUpdateFile.First();

                        var getData = UnityWebRequest.Get(m_CurData.url + "/" + firstPair.Key);
                        var value = new stWebRequestData();
                        getData.SendWebRequest();
                        value.req = getData;
                        value.fileData = firstPair.Value;
                        dicReq[firstPair.Key] = value;

                        m_DicUpdateFile.Remove(firstPair.Key);
                    }

                    List<string> listKeys = new List<string>();
                    foreach (KeyValuePair<string, stWebRequestData> pair in dicReq)
                    {
                        var value = pair.Value;
                        if (value.req.isHttpError || value.req.isNetworkError)
                        {
                            var err = "download " + pair.Key + " error! " + value.req.error;
                            resCallback(HotUpdateRes.Failed, 0, err);
                            yield break;
                        }

                        if (value.req.isDone)
                        {
                            var data = value.req.downloadHandler.data;
                            if (FileManager.md5(ref data) != value.fileData.md5)
                            {
                                var err = pair.Key + " compare md5 error! ";
                                resCallback(HotUpdateRes.Failed, 0, err);
                                yield break;
                            }
                            var lastIdx = pair.Key.LastIndexOf('/');
                            if (lastIdx > 0)
                            {
                                var key = pair.Key.Substring(0, lastIdx);

                                var arrDir = key.Split('/');
                                var pathTmp = Application.persistentDataPath;
                                foreach (var dir in arrDir)
                                {
                                    pathTmp += "/" + dir;
                                    DirectoryInfo info = new DirectoryInfo(pathTmp);
                                    if (!info.Exists)
                                    {
                                        info.Create();
                                    }
                                }
                            }
                            File.WriteAllBytes(Application.persistentDataPath + "/" + pair.Key, value.req.downloadHandler.data);
                            completePercent += (double)value.fileData.size / (double)m_UpdateTotalSize;
                            value.fileData.local = false;
                            m_CurFileData.data[pair.Key] = value.fileData;
                            listKeys.Add(pair.Key);
                        }
                        else
                        {
                            percentTmp += value.req.downloadProgress * (double)value.fileData.size / (double)m_UpdateTotalSize;
                        }
                    }
                    processCallback(completePercent + percentTmp);
                    percentTmp = 0.0f;
                    if (listKeys.Count > 0)
                    {
                        foreach(var key in listKeys)
                        {
                            dicReq.Remove(key);
                        }
                        File.WriteAllText(Application.persistentDataPath + "/" + s_FileDataFileName, JsonConvert.SerializeObject(m_CurFileData));
                    }
                    yield return 0;
                }

                File.WriteAllText(Application.persistentDataPath + "/" + s_VersionFileName, m_NetText);
                m_DicFileData = m_CurFileData.data;
                resCallback(HotUpdateRes.Complete, m_UpdateTotalSize, m_CurFileData.version);
            }
            else
            {
                resCallback(HotUpdateRes.Failed, 0, "hot update error! nothing to download!");
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
            var downloadDataPath = Application.persistentDataPath + "/" + s_FileDataFileName;
            if (!File.Exists(downloadDataPath))
            {
                var localFileDataText = Resources.Load<TextAsset>(s_FileData);
                m_DicFileData = JsonConvert.DeserializeObject<VersionFileData>(localFileDataText.text).data;
            }
            else
            {
                var downloadFileDataText = File.ReadAllText(downloadDataPath);
                m_DicFileData = JsonConvert.DeserializeObject<VersionFileData>(downloadFileDataText).data;
            }

            UnloadAllAssetBundle();
            if (null != m_Manifest)
            {
                Resources.UnloadAsset(m_Manifest);
                m_Manifest = null;
                Resources.UnloadUnusedAssets();
            }

            var request = AssetBundle.LoadFromFileAsync(this._getFullPath("StreamingAssets"));
            yield return request;
            var manifestReq = request.assetBundle.LoadAssetAsync<AssetBundleManifest>("AssetBundleManifest");
            yield return manifestReq;
            m_Manifest = manifestReq.asset as AssetBundleManifest;
            request.assetBundle.Unload(false);
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
            // 先计算依赖的ab
            List<string> setPath = new List<string>();
            this._getAllAssetBundles(arrPath, ref setPath);

            int nCount = setPath.Count;
            float oneResPercent = 1.0f / nCount;
            var dirInLoading = new Dictionary<string, Int32>();

            foreach (string path in setPath)
            {
                string pathTmp = this._getFullPath(path);
                if (m_DicAssetBundlesCount.ContainsKey(pathTmp))
                {
                    ++m_DicAssetBundlesCount[pathTmp].Count;
                    totalProgress += oneResPercent;
                }
                else if (!dirInLoading.ContainsKey(pathTmp))
                {  
                    var request = AssetBundle.LoadFromFileAsync(pathTmp);
                    abDicReq.Add(pathTmp, request);
                    dirInLoading[pathTmp] = 0;
                }
                else
                {
                    ++dirInLoading[pathTmp];
                }
            }

            // 等待assetbundle加载完成
            while (abDicReq.Count > 0)
            {
                List<string> listRemKey = new List<string>();
                float progressTmp = 0.0f;
                foreach (var pair in abDicReq)
                {
                    if (!pair.Value.isDone)
                    {
                        if (pair.Value.progress > 0 && pair.Value.progress < 1)
                        {
                            progressTmp += pair.Value.progress * oneResPercent / 2;
                        }
                    }
                    else
                    {
                        totalProgress += oneResPercent / 2;
                        listRemKey.Add(pair.Key);
                        var arrAssetName = pair.Value.assetBundle.GetAllAssetNames();
                        m_DicAssetBundlesCount.Add(pair.Key, new ResourcesInfo<string[]>(1 + dirInLoading[pair.Key], arrAssetName, pair.Value.assetBundle));

                        foreach (string assetName in arrAssetName)
                        {
                            AssetBundleRequest request = null;
                            if (assetName.EndsWith(".png") || assetName.EndsWith(".jpg"))
                            {
                                request = pair.Value.assetBundle.LoadAssetAsync<Sprite>(assetName);
                            }
                            else
                            {
                                request = pair.Value.assetBundle.LoadAssetAsync(assetName);
                            }
                            assetDicReq.Add(assetName, request);
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

            var nAssetCount = assetDicReq.Count;
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
                        if (pair.Value.progress > 0 && pair.Value.progress < 1)
                        {
                            progressTmp += pair.Value.progress * onePercentAsset / 2;
                        }
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
#endif

        }

        private void _unloadAssetBundle(string[] arrPath)
        {
            // 先计算依赖的ab
            List<string> setPath = new List<string>();
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
//                                 Info.Log("unload asset name is " + assetName);
//                                 // prefab文件不能unload
//                                 if (!assetName.EndsWith(".prefab"))
//                                 {
//                                     Resources.UnloadAsset(m_DicAsset[assetName]);
//                                 }
                                m_DicAsset.Remove(assetName);
                            }
                            else
                            {
                                Info.Error(string.Format("unload asset {0} without loaded! ", assetName));
                            }
                        }
                        m_DicAssetBundlesCount.Remove(pathTmp);
                        resInfo.assetbundle.Unload(true);
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

        private void _unloadAllAssetBundle()
        {
            foreach (var pair in m_DicAssetBundlesCount)
            {
                var resInfo = pair.Value as ResourcesInfo<string[]>;
                resInfo.assetbundle.Unload(true);
            }
            m_DicAsset.Clear();
            m_DicAssetBundlesCount.Clear();
            Resources.UnloadUnusedAssets();
        }

        private void _getAllAssetBundles(string[] arrPath, ref List<string> outSetPath)
        {
            foreach (string path in arrPath)
            {
                outSetPath.Add(path);
                this._getAllAssetBundles(m_Manifest.GetAllDependencies(path), ref outSetPath);
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
