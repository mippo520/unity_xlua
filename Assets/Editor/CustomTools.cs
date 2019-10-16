
using Assets.Common.Log;
using System;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

namespace Assets.Editor
{
    public class CustomTools
    {
        public static void textFile2Txt()
        {
            DirectoryInfo dirInfo = new DirectoryInfo(Application.dataPath + "/Script");
            _changeFileExtension(dirInfo, ".lua", ".txt");
            dirInfo = new DirectoryInfo(Application.dataPath + "/Config/Design");
            _changeFileExtension(dirInfo, ".json", ".txt");
        }

        public static void textFileRecover()
        {
            DirectoryInfo dirInfo = new DirectoryInfo(Application.dataPath + "/Script");
            _changeFileExtension(dirInfo, ".txt", ".lua");
            dirInfo = new DirectoryInfo(Application.dataPath + "/Config/Design");
            _changeFileExtension(dirInfo, ".txt", ".json");
        }

        [MenuItem("Custom/mergeProto")]
        static void mergeProto()
        {
            string ns = "c_gs";
            string all = string.Format("syntax = \"proto3\";\npackage {0};\n", ns);
            var listPackage = new List<string>();
            var listMsg = new List<string>();
            _readProto(ref all, ref listPackage, ref listMsg, Application.dataPath + "/Proto");

            foreach (string package in listPackage)
            {
                while (all.IndexOf(package + ".") >= 0)
                {
                    all = all.Replace(package + ".", "");
                }
            }

            File.WriteAllText(Application.dataPath + "/Proto/pb.txt", all);

            string lua = string.Format("local {0} = {{\n", ns);
            foreach (string msg in listMsg)
            {
                lua += string.Format("    {0} = \"{1}.{0}\",\n", msg, ns);
            }
            lua += string.Format("}}\n return {0}", ns);

            DirectoryInfo dirInfo = new DirectoryInfo(Application.dataPath + "/Script/pb");
            if (!dirInfo.Exists)
            {
                dirInfo.Create();
            }

            File.WriteAllText(Application.dataPath + "/Script/pb/pb.lua", lua);

            // error code
            string errorCode = "local error_code = {\n";
            System.IO.StreamReader sr = new System.IO.StreamReader(Application.dataPath + "/Proto/err_code.go");
            string line = "";
            // 从文件读取并显示行，直到文件的末尾 
            while ((line = sr.ReadLine()) != null)
            {
                if (line.Contains("="))
                {
                    line += ",\n";
                    errorCode += line;
                }
            }
            errorCode += "} \nreturn error_code";
            sr.Close();
            File.WriteAllText(Application.dataPath + "/Script/define/err_code.lua", errorCode);
            Info.Debug("Create proto finish!");
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

        static void _readProto(ref string content, ref List<string> listPackage, ref List<string> listMsg, string filePath)
        {
            DirectoryInfo dirInfo = new DirectoryInfo(filePath);
            foreach (FileSystemInfo fsInfo in dirInfo.GetFileSystemInfos())
            {
                if (fsInfo is DirectoryInfo)
                {
                    _readProto(ref content, ref listPackage, ref listMsg, fsInfo.FullName);
                }
                else if (fsInfo.FullName.EndsWith(".proto"))
                {
                    System.IO.StreamReader sr = new System.IO.StreamReader(fsInfo.FullName);
                    string line = "";
                    // 从文件读取并显示行，直到文件的末尾 
                    while ((line = sr.ReadLine()) != null)
                    {
                        if (line.StartsWith("package"))
                        {
                            int begin = line.LastIndexOf(' ');
                            int end = line.LastIndexOf(';');
                            var package = line.Substring(begin + 1, end - begin - 1);
                            listPackage.Add(package);
                        }
                        else if (!line.StartsWith("syntax") && !line.StartsWith("import"))
                        {
                            content += line + "\n";

                            var begin = line.IndexOf("message");
                            if (begin >= 0)
                            {
                                var end = line.LastIndexOf("{");
                                var msg = line.Substring(begin + 8, end - begin - 9).Trim();
                                listMsg.Add(msg);
                                Info.Debug("msg = " + msg);
                            }
                        }
                    }
                    sr.Close();
                }
            }

        }
    }
}