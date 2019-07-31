using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace Assets.Common.Tools
{
    [AttributeUsage(AttributeTargets.Field)]
    public sealed class FilePathAttribute : PropertyAttribute
    {
        public string[] arrExt { get; private set; }
        public List<string> arrPath { get; private set; }
        public FilePathAttribute(string[] arrPath, string[] arrExt)
        {
            this.arrExt = arrExt;
            this.arrPath = arrPath.ToList<string>();
            if (this.arrPath.Count <= 0)
            {
                this.arrPath.Add("");
            }
        }
        public FilePathAttribute(string path, string ext)
        {
            this.arrExt = new string[] { ext };
            this.arrPath = new List<string>();
            this.arrPath.Add(path);
        }

        public FilePathAttribute(string ext)
        {
            this.arrExt = new string[] { ext };
            this.arrPath = new List<string>();
            this.arrPath.Add("");
        }

        public FilePathAttribute(string[] arrExt)
        {
            this.arrExt = arrExt;
            this.arrPath = new List<string>();
            this.arrPath.Add("");
        }
    }
}
