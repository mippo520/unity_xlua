﻿
using Assets.Common.Log;
using System;
using System.IO;
using UnityEditor;
using UnityEngine;

namespace Assets
{
    public class CustomTools
    {
        [MenuItem("Custom/Build Asset Bundle")]
        static void buildAssetBundleAndroid()
        {
            string str = Application.dataPath + "/StreamingAssets";
            DirectoryInfo dirInfo = new DirectoryInfo(str);
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

            //打包资源路径(参数1：资源保存路径   参数2：压缩格式    参数3：选择平台，各个平台间不能混用)
            BuildPipeline.BuildAssetBundles(str, BuildAssetBundleOptions.UncompressedAssetBundle, BuildTarget.Android);
        }

        [MenuItem("Custom/textFile2Txt")]
        static void textFile2Txt()
        {
            DirectoryInfo dirInfo = new DirectoryInfo(Application.dataPath + "/Script");
            _changeFileExtension(dirInfo, ".lua", ".txt");
            dirInfo = new DirectoryInfo(Application.dataPath + "/Proto");
            _changeFileExtension(dirInfo, ".proto", ".txt");
        }

        [MenuItem("Custom/textFileRecover")]
        static void textFileRecover()
        {
            DirectoryInfo dirInfo = new DirectoryInfo(Application.dataPath + "/Script");
            _changeFileExtension(dirInfo, ".txt", ".lua");
            dirInfo = new DirectoryInfo(Application.dataPath + "/Proto");
            _changeFileExtension(dirInfo, ".txt", ".proto");
        }

        static void _changeFileExtension(DirectoryInfo dirInfo, string oldExt, string newExt)
        {
            foreach (FileInfo file in dirInfo.GetFiles())
            {
                Info.Debug(file.FullName);
                if (file.FullName.EndsWith(oldExt))
                {
                    string newName = file.FullName.Replace(oldExt, newExt);
                    Info.Debug(newName);
                    file.MoveTo(newName);
                }
            }

            foreach (DirectoryInfo dir in dirInfo.GetDirectories())
            {
                _changeFileExtension(dir, oldExt, newExt);
            }

            Info.Debug(string.Format("change {0} to {1} finish!", oldExt, newExt));
        }
    }
}