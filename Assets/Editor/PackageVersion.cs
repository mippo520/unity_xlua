using Assets.Common.Log;
using Assets.Common.Resource;
using Assets.Common.Tools;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using UnityEditor;
using UnityEngine;

namespace Assets.Editor
{
    class PackageVersion : EditorWindow
    {
        private string m_Version = "0.0.0";
        private string m_Url = "http://";
        private string m_conetent = "";

        PackageVersion()
        {
            this.titleContent = new GUIContent("PackageVersion");
        }

        [MenuItem("Custom/CreateVersionFile")]
        static void showWindow()
        {
            EditorWindow.GetWindow(typeof(PackageVersion));
        }

        private void Awake()
        {
            try
            {
                var text = File.ReadAllText(Application.dataPath + "/Resources/" + ResourcesManager.s_VersionFileName);
                if ("" != text)
                {
                    var localData = JsonConvert.DeserializeObject<VersionFileData>(text);
                    m_Version = localData.version;
                    m_Url = localData.url;
                }
            }
            catch
            {
                Info.Log("version file not exist!");
            }
        }

        private void OnGUI()
        {
            GUILayout.BeginVertical();

            GUILayout.Space(10);
            m_Version = EditorGUILayout.TextField("Version:", m_Version);

            GUILayout.Space(10);
            m_Url = EditorGUILayout.TextField("url:", m_Url);


            GUILayout.Space(10);
            if (GUILayout.Button("Begin"))
            {
                createVersionFile();
            }
            GUILayout.Space(10);
            GUI.skin.label.fontSize = 24;
            GUI.skin.label.alignment = TextAnchor.MiddleCenter;
            GUILayout.Label(m_conetent);

            GUILayout.EndVertical();
        }

        private void createVersionFile()
        {
            if ("" == m_Url)
            {
                m_conetent = "please set url!";
                Repaint();
                return;
            }

            m_conetent = "begin ...";
            Repaint();

            CustomTools.textFile2Txt();
            AssetDatabase.Refresh();

            string str = Application.dataPath + "/StreamingAssets";
            DirectoryInfo dirInfo = new DirectoryInfo(str);
            if (!dirInfo.Exists)
            {
                dirInfo.Create();
            }
            foreach (FileSystemInfo fsInfo in dirInfo.GetFileSystemInfos())
            {
                if (fsInfo is DirectoryInfo)
                {
                    DirectoryInfo subDir = new DirectoryInfo(fsInfo.FullName);
                    subDir.Delete(true);
                }
                else
                {
                    File.Delete(fsInfo.FullName);
                }
            }

            if (RuntimePlatform.WindowsEditor == Application.platform)
            {
                //打包资源路径(参数1：资源保存路径   参数2：压缩格式    参数3：选择平台，各个平台间不能混用)
                BuildPipeline.BuildAssetBundles(str, BuildAssetBundleOptions.ChunkBasedCompression, BuildTarget.Android);
            }
            else if (RuntimePlatform.OSXEditor == Application.platform)
            {
                BuildPipeline.BuildAssetBundles(str, BuildAssetBundleOptions.ChunkBasedCompression, BuildTarget.iOS);
            }

            VersionFileData vfd = new VersionFileData();
            vfd.version = m_Version;
            vfd.url = m_Url;
            vfd.data = null;

            DirectoryInfo resDir = new DirectoryInfo(Application.dataPath + "/Resources");
            if (!resDir.Exists)
            {
                resDir.Create();
            }

            File.WriteAllBytes(Application.dataPath + "/Resources/" + ResourcesManager.s_VersionFileName, System.Text.Encoding.Default.GetBytes(JsonConvert.SerializeObject(vfd)));

            vfd.data = new Dictionary<string, FileData>();
            // 生成版本文件
            createVersionFileData(vfd.data, "");
            File.WriteAllBytes(Application.dataPath + "/Resources/file_data.txt", System.Text.Encoding.Default.GetBytes(JsonConvert.SerializeObject(vfd)));

            CustomTools.textFileRecover();
            AssetDatabase.Refresh();

            m_conetent = "complete!";
            m_Version = vfd.version;
            m_Url = vfd.url;
            Repaint();
        }

        static void createVersionFileData(Dictionary<string, FileData> dic, string path)
        {
            var curPath = Application.dataPath + "/StreamingAssets";
            if ("" != path)
            {
                curPath += "/" + path;
            }
            DirectoryInfo dirInfo = new DirectoryInfo(curPath);
            if (!dirInfo.Exists)
            {
                return;
            }
            foreach (FileSystemInfo fsInfo in dirInfo.GetFileSystemInfos())
            {
                var fileName = fsInfo.Name;
                if ("" != path)
                {
                    fileName = path + "/" + fileName;
                }
                if (fsInfo is DirectoryInfo)
                {
                    createVersionFileData(dic, fileName);
                }
                else
                {
                    if (fileName.EndsWith(".manifest") || fileName.IndexOf('.') < 0)
                    {
                        var content = File.ReadAllBytes(fsInfo.FullName);
                        var data = new FileData();
                        data.md5 = FileManager.md5(ref content);
                        var fInfo = fsInfo as FileInfo;
                        data.size = fInfo.Length;
                        data.local = true;
                        dic[fileName] = data;
                    }
                }
            }
        }
    }
}
