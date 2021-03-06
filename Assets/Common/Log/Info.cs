﻿using Assets.Common.Singleton;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace Assets.Common.Log
{
    public enum eLogLevel
    {
        Debug = 0,
        Log,
        Warn,
        Error,
    }

    public class Info
    {
        public static eLogLevel s_Level = eLogLevel.Debug;

        public static void Debug(string content)
        {
            if (s_Level <= eLogLevel.Debug)
            {
                UnityEngine.Debug.Log("Debug: " + content);
            }
        }

        public static void Log(string content)
        {
            if (s_Level <= eLogLevel.Log)
            {
                UnityEngine.Debug.Log("Log: " + content);
            }
        }

        public static void Warn(string content)
        {
            if (s_Level <= eLogLevel.Warn)
            {
                UnityEngine.Debug.LogWarning("Warn: " + content);
            }
        }

        public static void Error(string content)
        {
            if (s_Level <= eLogLevel.Error)
            {
                UnityEngine.Debug.LogError("Error: " + content);
            }
        }
    }
}
