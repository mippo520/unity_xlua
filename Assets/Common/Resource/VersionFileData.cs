using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assets.Common.Resource
{
    public class FileData
    {
//         private JObject m_obj = null;
        public Int64 size { set; get; }

        public string md5 { set; get; }
        public bool local { set; get; }

//         public FileData(JObject obj)
//         {
//             m_obj = obj;
//         }
    }

    public class VersionFileData
    {
//         private JObject m_obj = null;
        public string version
        {
            set;
            //             {
            //                 m_obj["version"] = value;
            //             }

            get;
//             {
//                 return m_obj["version"].Value<string>();
//             }
        }
        public string url
        {
            set;
            //             {
            //                 m_obj["url"] = value;
            //             }

            get;
//             {
                //                 return m_obj["url"].Value<string>();
//             }
        }

        public Dictionary<string, FileData> data
        {
            set;
//             {
//                 m_obj["data"] = value;
//             }

            get;
//             {
//                 return m_obj["url"].Value<JObject>();
//             }
        }
// 
// 
//         public VersionFileData(JObject obj)
//         {
//             m_obj = obj;
//             var jdata = m_obj["url"].Value<JObject>();
//             foreach (KeyValuePair<string, JToken> pair in jdata)
//             {
//                 data[pair.Key] = new FileData() pair.Value.Value<>
//             }
//         }

    }
}
