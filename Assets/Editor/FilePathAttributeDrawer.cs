using Assets.Common.Log;
using Assets.Common.Tools;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEditor;
using UnityEngine;

namespace Assets.Editor
{
    [CustomPropertyDrawer(typeof(FilePathAttribute))]
    class FilePathAttributeDrawer : PropertyDrawer
    {
        private static List<string> listPath = new List<string>();
        private static bool bInitData = false;

        static void InitData(FilePathAttribute attribute)
        {
            listPath.Clear();

            foreach (string path in attribute.arrPath)
            {
                DirectoryInfo dirInfo = new DirectoryInfo(Application.dataPath + "/" + path);
                foreach (string ext in attribute.arrExt)
                {
                    _loadFiles(dirInfo, path, ext, ref listPath);
                }
            }
        }

        public override void OnGUI(UnityEngine.Rect position, UnityEditor.SerializedProperty property, UnityEngine.GUIContent label)
        {
            var reference = (FilePathAttribute)attribute;
            if (!bInitData)
            {
                bInitData = true;
                InitData(reference);
            }

            var value = property.stringValue;
            int idx = 0;
            for(int i = 0; i < listPath.Count; ++i)
            {
                if (value == listPath[i])
                {
                    idx = i;
                    break;
                }
            }
            idx = EditorGUI.Popup(position, property.displayName, idx, listPath.ToArray());
            property.stringValue = listPath[idx];

            if (GUILayout.Button("refresh", GUILayout.Width(100)))
            {
                bInitData = false;
            }
            GUILayout.Space(5);
        }

        static void _loadFiles(DirectoryInfo dirInfo, string path, string ext, ref List<string> outList)
        {
            foreach (FileInfo file in dirInfo.GetFiles())
            {
                var idx = file.FullName.LastIndexOf(ext);
                if (idx >= file.FullName.Length - ext.Length)
                {
                    var begin = file.FullName.LastIndexOf(path) + path.Length + 1;
                    var str = file.FullName.Substring(begin);
                    outList.Add(str.Replace('\\', '/'));
                }
            }

            foreach (DirectoryInfo dir in dirInfo.GetDirectories())
            {
                _loadFiles(dir, path, ext, ref outList);
            }
        }

    }
}
