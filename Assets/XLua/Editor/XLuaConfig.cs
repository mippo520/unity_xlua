using System.Collections.Generic;
using System;
using XLua;
using System.Reflection;
using System.Linq;

public static class XLuaConfig
{
    static List<string> exclude = new List<string> {
       "HideInInspector", "ExecuteInEditMode",
       "AddComponentMenu", "ContextMenu",
       "RequireComponent", "DisallowMultipleComponent",
       "SerializeField", "AssemblyIsEditorAssembly",
       "Attribute", "Types",
       "UnitySurrogateSelector", "TrackedReference",
       "TypeInferenceRules", "FFTWindow",
       "RPC", "Network", "MasterServer",
       "BitStream", "HostData",
       "ConnectionTesterStatus", "GUI", "EventType",
       "EventModifiers", "FontStyle", "TextAlignment",
       "TextEditor", "TextEditorDblClickSnapping",
       "TextGenerator", "TextClipping", "Gizmos",
       "ADBannerView", "ADInterstitialAd",
       "Android", "Tizen", "jvalue",
       "iPhone", "iOS", "Windows", "CalendarIdentifier",
       "CalendarUnit", "CalendarUnit",
       "ClusterInput", "FullScreenMovieControlMode",
       "FullScreenMovieScalingMode", "Handheld",
       "LocalNotification", "NotificationServices",
       "RemoteNotificationType", "RemoteNotification",
       "SamsungTV", "TextureCompressionQuality",
       "TouchScreenKeyboardType", "TouchScreenKeyboard",
       "MovieTexture", "UnityEngineInternal",
       "Terrain", "Tree", "SplatPrototype",
       "DetailPrototype", "DetailRenderMode",
       "MeshSubsetCombineUtility", "AOT", "Social", "Enumerator",
       "SendMouseEvents", "Cursor", "Flash", "ActionScript",
       "OnRequestRebuild", "Ping",
       "ShaderVariantCollection", "SimpleJson.Reflection",
       "CoroutineTween", "GraphicRebuildTracker",
       "Advertisements", "UnityEditor", "WSA",
       "EventProvider", "Apple",
       "ClusterInput", "Motion",
       "UnityEngine.UI.ReflectionMethodsCache", "NativeLeakDetection",
       "NativeLeakDetectionMode", "WWWAudioExtensions", "UnityEngine.Experimental",
    };

    static bool isExcluded(Type type)
    {
        var fullName = type.FullName;
        if (null != fullName)
        {
            for (int i = 0; i < exclude.Count; i++)
            {
                if (fullName.Contains(exclude[i]))
                {
                    return true;
                }
            }
        }
        return false;
    }

    [LuaCallCSharp]
    public static IEnumerable<Type> LuaCallCSharp
    {
        get
        {
            List<string> namespaces = new List<string>() // 在这里添加名字空间
            {
                "UnityEngine",
                "UnityEngine.UI",
                "UnityEngine.Events",
            };
            var unityTypes = (from assembly in AppDomain.CurrentDomain.GetAssemblies()
                                where !(assembly.ManifestModule is System.Reflection.Emit.ModuleBuilder)
                                from type in assembly.GetExportedTypes()
                                where type.Namespace != null && namespaces.Contains(type.Namespace) && !isExcluded(type)
                                        && type.BaseType != typeof(MulticastDelegate) && !type.IsInterface && !type.IsEnum
                                select type);

            string[] customAssemblys = new string[] {
                "Assembly-CSharp",
            };
            var customTypes = (from assembly in customAssemblys.Select(s => Assembly.Load(s))
                                from type in assembly.GetExportedTypes()
                                where type.Namespace == null || !type.Namespace.StartsWith("XLua")
                                        && type.BaseType != typeof(MulticastDelegate) && !type.IsInterface && !type.IsEnum
                                select type);
            return unityTypes.Concat(customTypes);
        }
    }

    [CSharpCallLua]
    public static List<Type> CSharpCallLua
    {
       get
       {
           var lua_call_csharp = LuaCallCSharp;
           var delegate_types = new List<Type>();
           var flag = BindingFlags.Public | BindingFlags.Instance
               | BindingFlags.Static | BindingFlags.IgnoreCase | BindingFlags.DeclaredOnly;
           foreach (var field in (from type in lua_call_csharp select type).SelectMany(type => type.GetFields(flag)))
           {
               if (typeof(Delegate).IsAssignableFrom(field.FieldType))
               {
                    if (!isExcluded(field.FieldType))
                    {
                        delegate_types.Add(field.FieldType);
                    }
                }
           }

           foreach (var method in (from type in lua_call_csharp select type).SelectMany(type => type.GetMethods(flag)))
           {
               if (typeof(Delegate).IsAssignableFrom(method.ReturnType))
               {
                    if (!isExcluded(method.ReturnType))
                    {
                        delegate_types.Add(method.ReturnType);
                    }
                }
                foreach (var param in method.GetParameters())
               {
                   var paramType = param.ParameterType.IsByRef ? param.ParameterType.GetElementType() : param.ParameterType;
                   if (typeof(Delegate).IsAssignableFrom(paramType))
                   {
                        if (!isExcluded(paramType))
                        {
                            delegate_types.Add(paramType);
                        }
                    }
                }
            }
            var list = delegate_types.Distinct().ToList();
            list.Add(typeof(System.Collections.IEnumerator));
            return list;
        }
    }

    [BlackList]
    public static List<List<string>> BlackList = new List<List<string>>()  {
                new List<string>(){"System.Xml.XmlNodeList", "ItemOf"},
                new List<string>(){"UnityEngine.WWW", "movie"},
    #if UNITY_WEBGL
                new List<string>(){"UnityEngine.WWW", "threadPriority"},
    #endif
                new List<string>(){"UnityEngine.Texture2D", "alphaIsTransparency"},
                new List<string>(){"UnityEngine.Security", "GetChainOfTrustValue"},
                new List<string>(){"UnityEngine.CanvasRenderer", "onRequestRebuild"},
                new List<string>(){"UnityEngine.Light", "areaSize"},
                new List<string>(){"UnityEngine.Light", "lightmapBakeType"},
                new List<string>(){"UnityEngine.WWW", "MovieTexture"},
                new List<string>(){"UnityEngine.WWW", "GetMovieTexture"},
                new List<string>(){"UnityEngine.AnimatorOverrideController", "PerformOverrideClipListCleanup"},
    #if !UNITY_WEBPLAYER
                new List<string>(){"UnityEngine.Application", "ExternalEval"},
    #endif
                new List<string>(){"UnityEngine.GameObject", "networkView"}, //4.6.2 not support
                new List<string>(){"UnityEngine.Component", "networkView"},  //4.6.2 not support
                new List<string>(){"System.IO.FileInfo", "GetAccessControl", "System.Security.AccessControl.AccessControlSections"},
                new List<string>(){"System.IO.FileInfo", "SetAccessControl", "System.Security.AccessControl.FileSecurity"},
                new List<string>(){"System.IO.DirectoryInfo", "GetAccessControl", "System.Security.AccessControl.AccessControlSections"},
                new List<string>(){"System.IO.DirectoryInfo", "SetAccessControl", "System.Security.AccessControl.DirectorySecurity"},
                new List<string>(){"System.IO.DirectoryInfo", "CreateSubdirectory", "System.String", "System.Security.AccessControl.DirectorySecurity"},
                new List<string>(){"System.IO.DirectoryInfo", "Create", "System.Security.AccessControl.DirectorySecurity"},
                new List<string>(){"UnityEngine.MonoBehaviour", "runInEditMode"},
                new List<string>(){"UnityEngine.Caching", "ResetNoBackupFlag", "System.String", "System.Int32"},
                new List<string>(){"UnityEngine.Caching", "ResetNoBackupFlag", "System.String", "UnityEngine.Hash128"},
                new List<string>(){"UnityEngine.Caching", "ResetNoBackupFlag", "UnityEngine.CachedAssetBundle"},
                new List<string>(){"UnityEngine.Caching", "SetNoBackupFlag", "System.String", "System.Int32"},
                new List<string>(){"UnityEngine.Caching", "SetNoBackupFlag", "UnityEngine.CachedAssetBundle"},
                new List<string>(){"UnityEngine.Caching", "SetNoBackupFlag", "System.String", "UnityEngine.Hash128"},
                new List<string>(){"UnityEngine.AudioSettings", "GetSpatializerPluginNames"},
                new List<string>(){"UnityEngine.AudioSettings", "GetSpatializerPluginNames"},
                new List<string>(){"UnityEngine.AnimatorControllerParameter", "name"},
                new List<string>(){"UnityEngine.AudioSettings", "SetSpatializerPluginName", "System.String"},
                new List<string>(){"UnityEngine.DrivenRectTransformTracker", "StopRecordingUndo"},
                new List<string>(){"UnityEngine.DrivenRectTransformTracker", "StartRecordingUndo"},
                new List<string>(){"UnityEngine.Input", "IsJoystickPreconfigured", "System.String"},
                new List<string>(){"UnityEngine.LightProbeGroup", "dering"},
                new List<string>(){"UnityEngine.LightProbeGroup", "probePositions"},
                new List<string>(){"UnityEngine.Light", "SetLightDirty"},
                new List<string>(){"UnityEngine.Light", "shadowRadius"},
                new List<string>(){"UnityEngine.Light", "shadowAngle"},
                new List<string>(){"UnityEngine.Light", "shadowRadius"},
                new List<string>(){"UnityEngine.ParticleSystemForceField", "FindAll"},
                new List<string>(){"UnityEngine.QualitySettings", "streamingMipmapsRenderersPerFrame"},
                new List<string>(){"UnityEngine.Texture", "imageContentsHash"},
                new List<string>(){"UnityEngine.UI.Graphic", "OnRebuildRequested"},
                new List<string>(){"UnityEngine.UI.Text", "OnRebuildRequested"},
};
    
}
