using Assets.Common.Log;
using Assets.Common.Resource;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace Assets.Common.Tools
{
    public class EngineExt
    {
        public static bool Raycast(Ray ray, out RaycastHit hitInfo)
        {
            return Physics.Raycast(ray, out hitInfo);
        }
    }
}
