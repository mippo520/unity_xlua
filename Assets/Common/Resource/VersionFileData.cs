using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assets.Common.Resource
{
    public class FileData
    {
        public Int64 size { set; get; }

        public string md5 { set; get; }
        public bool local { set; get; }

        public FileData()
        {

        }
    }

    public class VersionFileData
    {
        public string version { set; get; }
        public string url { set; get; }
        public Dictionary<string, FileData> data { set; get; }
    }
}
