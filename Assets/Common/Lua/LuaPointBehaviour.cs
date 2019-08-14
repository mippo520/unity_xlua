using Assets.Common.Log;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.EventSystems;
using XLua;

namespace Assets.Common.Lua
{
    public class LuaPointBehaviour : LuaBehaviour, IPointerClickHandler, IPointerDownHandler, IPointerUpHandler, IDragHandler
    {
        private LuaFunction pointerUpFunction;
        private LuaFunction pointerDownFunction;
        private LuaFunction pointerClickFunction;
        private LuaFunction dragFunction;

        protected new void Awake()
        {
            base.Awake();

            pointerUpFunction = luaBehaviour.Get<LuaFunction>("onPointerUp");
            pointerDownFunction = luaBehaviour.Get<LuaFunction>("onPointerDown");
            pointerClickFunction = luaBehaviour.Get<LuaFunction>("onPointerClick");
            dragFunction = luaBehaviour.Get<LuaFunction>("onDrag");
        }

        public void OnPointerClick(PointerEventData eventData)
        {
//             if (null != pointerClickFunction)
//             {
//                 var ret = pointerClickFunction.Call(luaBehaviour, eventData);
//                 Info.Debug("1  OnPointerClick! " + ret.ToString());
//             }
            Info.Debug("1  OnPointerClick! " + gameObject.name);
            PassEvent(eventData, ExecuteEvents.pointerClickHandler);
        }

        public void OnPointerDown(UnityEngine.EventSystems.PointerEventData eventData)
        {
            Info.Debug("2  OnPointerDown! " + gameObject.name);
            PassEvent(eventData, ExecuteEvents.pointerDownHandler);
        }

        public void OnPointerUp(UnityEngine.EventSystems.PointerEventData eventData)
        {
            Info.Debug("3  OnPointerUp! " + gameObject.name);
            PassEvent(eventData, ExecuteEvents.pointerUpHandler);
        }

        public void OnDrag(UnityEngine.EventSystems.PointerEventData eventData)
        {
            Info.Debug("4  OnDrag! " + gameObject.name);
            PassEvent(eventData, ExecuteEvents.dragHandler);
        }

        protected void PassEvent<T>(PointerEventData data, ExecuteEvents.EventFunction<T> function) where T : IEventSystemHandler
        {
            List<RaycastResult> results = new List<RaycastResult>();
            EventSystem.current.RaycastAll(data, results);
            bool bNext = false;
            for (int i = 0; i < results.Count; i++)
            {
                if (gameObject == results[i].gameObject)
                {
                    bNext = true;
                }
                else if (bNext)
                {
                    var eventObject = ExecuteEvents.GetEventHandler<T>(results[i].gameObject);
                    ExecuteEvents.Execute(eventObject, data, function);
                    break;
                }
            }
        }
    }
}
