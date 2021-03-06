﻿using Assets.Common.Log;
using Assets.Common.Lua;
using Spine.Unity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TMPro;
using UnityEditor;
using UnityEngine;
using UnityEngine.UI;


[CustomEditor(typeof(LuaPointBehaviour))]
public class LuaPointBehaviourEditor : LuaBehaviourEditor
{ 
}

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

            if (GUILayout.Button("X", GUILayout.Width(17), GUILayout.Height(17)))
            {
                LuaBehaviour lua = target as LuaBehaviour;
                listObj.RemoveAt(i);
                --i;
            }

            po.name = EditorGUILayout.TextField("", po.name, GUILayout.Width(150));

            if (typeof(GameObject).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(GameObject), true);
            }
            else if (typeof(LuaBehaviour).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(LuaBehaviour), true);
            }
            else if (typeof(Text).Name == po.type)
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
            else if (typeof(Animator).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(Animator), true);
            }
            else if (typeof(Image).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(Image), true);
            }
            else if (typeof(SpriteRenderer).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(SpriteRenderer), true);
            }
            else if (typeof(MeshRenderer).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(MeshRenderer), true);
            }
            else if (typeof(CanvasGroup).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(CanvasGroup), true);
            }
            else if (typeof(Canvas).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(Canvas), true);
            }
            else if (typeof(Transform).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(Transform), true);
            }
            else if (typeof(RectTransform).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(RectTransform), true);
            }
            else if (typeof(ScrollRect).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(ScrollRect), true);
            }
            else if (typeof(SkeletonAnimation).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(SkeletonAnimation), true);
            }
            else if (typeof(SkeletonGraphic).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(SkeletonGraphic), true);
            }
            else if (typeof(Light).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(Light), true);
            }
            else if (typeof(TextMeshPro).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(TextMeshPro), true);
            }
            else if (typeof(SpriteMask).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(SpriteMask), true);
            }
            else if (typeof(Material).Name == po.type)
            {
                po.obj = EditorGUILayout.ObjectField("", po.obj as UnityEngine.Object, typeof(Material), true);
            }
            else
            {
                EditorGUILayout.LabelField("Type Error! error type is " + po.type);
            }
            GUILayout.EndHorizontal();
        }

        List<stStringObj> listString = (target as LuaBehaviour).listStrings;

        for (int i = 0; i < listString.Count; ++i)
        {
            var po = listString[i];
            GUILayout.BeginHorizontal();

            if (GUILayout.Button("X", GUILayout.Width(17), GUILayout.Height(17)))
            {
                LuaBehaviour lua = target as LuaBehaviour;
                listString.RemoveAt(i);
                --i;
            }

            po.name = EditorGUILayout.TextField("", po.name, GUILayout.Width(120));
            EditorGUILayout.LabelField(po.type, GUILayout.Width(60));
            if (typeof(int).Name == po.type)
            {
                po.obj = Convert.ToString(EditorGUILayout.IntField("", Convert.ToInt32(po.obj)));
            }
            else if (typeof(Double).Name == po.type)
            {
                po.obj = Convert.ToString(EditorGUILayout.DoubleField("", Convert.ToDouble(po.obj)));
            }
            else if (typeof(bool).Name == po.type)
            {
                po.obj = Convert.ToString(EditorGUILayout.Toggle("", Convert.ToBoolean(po.obj)));
            }
            else
            {
                po.obj = EditorGUILayout.TextField("", po.obj as string);
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
            AddParam<bool>();
            AddParam<GameObject>();
            AddParam<LuaBehaviour>();
            AddParam<Text>();
            AddParam<Slider>();
            AddParam<Button>();
            AddParam<InputField>();
            AddParam<Animator>();
            AddParam<Image>();
            AddParam<SpriteRenderer>();
            AddParam<MeshRenderer>();
            AddParam<CanvasGroup>();
            AddParam<Canvas>();
            AddParam<Transform>();
            AddParam<RectTransform>();
            AddParam<ScrollRect>();
            AddParam<SkeletonAnimation>();
            AddParam<SkeletonGraphic>();
            AddParam<Light>();
            AddParam<TextMeshPro>();
            AddParam<SpriteMask>();
            AddParam<Material>();

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
            if (typeof(int).Name == typeof(T).Name || typeof(Double).Name == typeof(T).Name || typeof(String).Name == typeof(T).Name || typeof(bool).Name == typeof(T).Name)
            {
                var so = new stStringObj();
                so.type = typeof(T).Name;
                so.name = "";
                if (typeof(int).Name == typeof(T).Name || typeof(Double).Name == typeof(T).Name)
                {
                    so.obj = "0";
                }
                else if(typeof(bool).Name == typeof(T).Name)
                {
                    so.obj = "true";
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
