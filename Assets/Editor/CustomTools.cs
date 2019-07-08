
using Assets.Common.Log;
using System;
using System.IO;
using UnityEditor;
using UnityEngine;

namespace Assets
{
    public class CustomTools
    {
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
        }
    }
}