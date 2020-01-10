using Assets.Common.Log;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KBEngine
{
    class HelloEntity : HelloEntityBase
    {
        public override void onEnter()
        {
            Info.Debug("KBEngine onEnter!");
            this.cellEntityCall.say("Hello World!");
        }

        public override void onSay(string arg1)
        {
            Info.Debug("KBEngine onSay! content = " + arg1);
        }
    }
}
