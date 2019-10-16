using Assets.Common.Resource;
using Assets.Common.Singleton;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace Assets.Common.Tools
{
    public class FileManager : GameObjSingleton<FileManager>
    {
        public delegate void CallbackFunc(ref byte[] data);

        public void readAllBytesAsync(string packageName, string fileName, CallbackFunc callback)
        {
            StartCoroutine(this._readAllBytesAsync(packageName, fileName, callback));
        }

        public byte[] readAllBytes(string fileName)
        {
#if UNITY_EDITOR
            return File.ReadAllBytes(fileName);
#else

            int lastDot = fileName.LastIndexOf(".");
            fileName = fileName.Substring(0, lastDot) + ".txt";
            var text = ResourcesManager.GetInstance().LoadAsset<TextAsset>(fileName.ToLower());
            return Encoding.Default.GetBytes(text.text);
#endif
        }

        static public string md5(ref byte[] content)
        {
            string ret = "";

            MD5 md5 = MD5.Create();
            byte[] s = md5.ComputeHash(content);
            for (int i = 0; i < s.Length; ++i)
            {
                ret = ret + s[i].ToString("X2");
            }

            return ret;
        }

        private IEnumerator _readAllBytesAsync(string packageName, string fileName, CallbackFunc callback)
        {
#if UNITY_EDITOR
            yield return 0;
            var data = File.ReadAllBytes(fileName);
            callback(ref data);
#else
            ResourcesManager.GetInstance().LoadAssetBundleAsync(new string[] { packageName }, null, (string[] arrPath) =>
            {
                int lastDot = fileName.LastIndexOf(".");
                fileName = fileName.Substring(0, lastDot) + ".txt";
                var text = ResourcesManager.GetInstance().LoadAsset<TextAsset>(fileName.ToLower());
                var data = Encoding.Default.GetBytes(text.text);
                callback(ref data);
                ResourcesManager.GetInstance().UnloadAssetBundle(arrPath);
            });
            yield return 0;
#endif
        }
    }
}
