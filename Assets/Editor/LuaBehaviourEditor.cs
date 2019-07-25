using Assets.Common.Log;
using Assets.Common.Lua;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEditor;
using UnityEngine;
using UnityEngine.UI;


[CustomEditor(typeof(LuaBehaviour))]
public class LuaBehaviourEditor : UnityEditor.Editor
{
    Vector2 scrollPos = new Vector2();
    bool showAddMenu = false;
    string addButtonText = "Add Params";

    public override void OnInspectorGUI()
    {
        base.OnInspectorGUI();

        List<stParamObj> listObj = (target as LuaBehaviour).listParams;

        for (int i = 0; i < listObj.Count; ++i)
        {
            var po = listObj[i];
            GUILayout.BeginHorizontal();
            po.name = EditorGUILayout.TextField("", po.name, GUILayout.Width(150));

            if (typeof(Text).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(Text), true);
            }
            else if (typeof(Button).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(Button), true);
            }
            else if (typeof(InputField).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(InputField), true);
            }
            else if (typeof(Slider).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(Slider), true);
            }
            else
            {
                EditorGUILayout.LabelField("Type Error! error type is " + po.type);
            }

            if (GUILayout.Button("X", GUILayout.Width(15)))
            {
                LuaBehaviour lua = target as LuaBehaviour;
                listObj.RemoveAt(i);
                --i;
            }
            GUILayout.EndHorizontal();
        }

        List<stStringObj> listString = (target as LuaBehaviour).listStrings;

        for (int i = 0; i < listString.Count; ++i)
        {
            var po = listString[i];
            GUILayout.BeginHorizontal();
            po.name = EditorGUILayout.TextField("", po.name, GUILayout.Width(150));

            if (typeof(int).Name == po.type)
            {
                po.obj = Convert.ToString(EditorGUILayout.IntField("", Convert.ToInt32(po.obj)));
            }
            else if (typeof(Double).Name == po.type)
            {
                po.obj = Convert.ToString(EditorGUILayout.DoubleField("", Convert.ToDouble(po.obj)));
            }
            else
            {
                po.obj = EditorGUILayout.TextField("", po.obj as string);
            }

            if (GUILayout.Button("X", GUILayout.Width(15)))
            {
                LuaBehaviour lua = target as LuaBehaviour;
                listString.RemoveAt(i);
                --i;
            }
            GUILayout.EndHorizontal();
        }

        if (GUILayout.Button(addButtonText))
        {
            if (showAddMenu)
            {
                showAddMenu = false;
                addButtonText = "Add Params";
            }
            else
            {
                showAddMenu = true;
                addButtonText = "Close";
            }
        }

        if (showAddMenu)
        {
            GUILayout.Space(5);
            scrollPos = GUILayout.BeginScrollView(scrollPos, false, true, GUILayout.Height(100));
            AddParam<int>();
            AddParam<String>();
            AddParam<Double>();
            AddParam<Text>();
            AddParam<Slider>();
            AddParam<Button>();
            AddParam<InputField>();

            GUILayout.EndScrollView();
        }

        if (GUI.changed)
        {
            EditorUtility.SetDirty(target);
        }
    }

    private void AddParam<T>()
    {
        if (GUILayout.Button(string.Format("Add {0}", typeof(T).Name)))
        {

            LuaBehaviour lua = target as LuaBehaviour;
            if (typeof(int).Name == typeof(T).Name || typeof(Double).Name == typeof(T).Name || typeof(String).Name == typeof(T).Name)
            {
                var so = new stStringObj();
                so.type = typeof(T).Name;
                so.name = "";
                if (typeof(int).Name == typeof(T).Name || typeof(Double).Name == typeof(T).Name)
                {
                    so.obj = "0";
                }
                else
                {
                    so.obj = "";
                }

                lua.listStrings.Add(so);
            }
            else
            {
                var po = new stParamObj();
                po.type = typeof(T).Name;
                po.name = "";
                po.obj = null;
                lua.listParams.Add(po);
            }
            showAddMenu = false;
            addButtonText = "Add Params";
        }
        GUILayout.Space(2);
    }
}
