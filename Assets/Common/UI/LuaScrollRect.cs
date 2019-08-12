using Assets.Common.Log;
using Assets.Common.Lua;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using XLua;

namespace Assets.Common.UI
{
    public class LuaScrollRect : ScrollRect
    {
        private LuaBehaviour luaComponent = null;
        private LuaFunction beginDragFunction;
        private LuaFunction endDragFunction;
        private LuaFunction dragFunction;

        public override void OnBeginDrag(PointerEventData eventData)
        {
            base.OnBeginDrag(eventData);
            if (null != beginDragFunction)
            {
                beginDragFunction.Call(luaComponent.luaBehaviour, eventData);
            }
        }

        public override void OnDrag(PointerEventData eventData)
        {
            base.OnDrag(eventData);
            if (null != dragFunction)
            {
                dragFunction.Call(luaComponent.luaBehaviour, eventData);
            }
        }

        public override void OnEndDrag(PointerEventData eventData)
        {
            base.OnEndDrag(eventData);
            if (null != endDragFunction)
            {
                endDragFunction.Call(luaComponent.luaBehaviour, eventData);
            }
        }

        protected override void Start()
        {
            base.Start();
            if (Application.isPlaying)  // 只在运行时调用
            {
                luaComponent = this.gameObject.GetComponent<LuaBehaviour>();
                if (null != luaComponent && null != luaComponent.luaBehaviour)
                {
                    beginDragFunction = luaComponent.luaBehaviour.Get<LuaFunction>("onBeginDrag");
                    endDragFunction = luaComponent.luaBehaviour.Get<LuaFunction>("onEndDrag");
                    dragFunction = luaComponent.luaBehaviour.Get<LuaFunction>("onDrag");
                }
                else
                {
                    Info.Error("This GameObject dose not have a component which is LuaBehaviour!");
                }
            }
        }
    }
}
