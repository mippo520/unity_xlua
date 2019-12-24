using Assets.Common.Log;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using UnityEngine.UIElements;
using XLua;

namespace Assets.Common.Lua
{
    public class LuaPointBehaviour : LuaBehaviour, IPointerClickHandler, IPointerDownHandler, IPointerUpHandler, IDragHandler, IBeginDragHandler, IEndDragHandler
    {
        private GameObject m_DragPassObj = null;
        private LuaFunction pointerUpFunction;
        private LuaFunction pointerDownFunction;
        private LuaFunction pointerClickFunction;
        private LuaFunction dragFunction;
        private LuaFunction beginDragFunction;
        private LuaFunction endDragFunction;

        protected new void Awake()
        {
            base.Awake();

            pointerUpFunction = luaBehaviour.Get<LuaFunction>("onPointerUp");
            pointerDownFunction = luaBehaviour.Get<LuaFunction>("onPointerDown");
            pointerClickFunction = luaBehaviour.Get<LuaFunction>("onPointerClick");
            dragFunction = luaBehaviour.Get<LuaFunction>("onDrag");
            beginDragFunction = luaBehaviour.Get<LuaFunction>("onBeginDrag");
            endDragFunction = luaBehaviour.Get<LuaFunction>("onEndDrag");
        }

        public void OnPointerClick(PointerEventData eventData)
        {
            if (null != pointerClickFunction)
            {
                var ret = pointerClickFunction.Call(luaBehaviour, eventData);
                if (null != ret && ret.Length > 0)
                {
                    if ((bool)ret[0])
                    {
                        PassEvent(eventData, ExecuteEvents.pointerClickHandler);
                    }
                }
            }
        }

        public void OnPointerDown(UnityEngine.EventSystems.PointerEventData eventData)
        {
            if (null != pointerDownFunction)
            {
                var ret = pointerDownFunction.Call(luaBehaviour, eventData);
                if (null != ret && ret.Length > 0)
                {
                    if ((bool)ret[0])
                    {
                        PassEvent(eventData, ExecuteEvents.pointerDownHandler);
                    }
                }
            }
        }

        public void OnPointerUp(UnityEngine.EventSystems.PointerEventData eventData)
        {
            if (null != pointerUpFunction)
            {
                var ret = pointerUpFunction.Call(luaBehaviour, eventData);
                if (null != ret && ret.Length > 0)
                {
                    if ((bool)ret[0])
                    {
                        PassEvent(eventData, ExecuteEvents.pointerUpHandler);
                    }
                }
            }
        }

        public void OnDrag(UnityEngine.EventSystems.PointerEventData eventData)
        {
            if (null != dragFunction)
            {
                var ret = dragFunction.Call(luaBehaviour, eventData);
                if (null != ret && ret.Length > 0)
                {
                    if ((bool)ret[0] && null != m_DragPassObj)
                    {
                        ExecuteEvents.Execute(m_DragPassObj, eventData, ExecuteEvents.dragHandler);
                    }
                }
            }
        }

        public void OnBeginDrag(UnityEngine.EventSystems.PointerEventData eventData)
        {
            if (null != beginDragFunction)
            {
                var ret = beginDragFunction.Call(luaBehaviour, eventData);
                if (null != ret && ret.Length > 0 && null == m_DragPassObj)
                {
                    if ((bool)ret[0])
                    {
                        m_DragPassObj = PassEvent(eventData, ExecuteEvents.beginDragHandler);
                    }
                }
            }
        }

        public void OnEndDrag(UnityEngine.EventSystems.PointerEventData eventData)
        {
            if (null != endDragFunction)
            {
                var ret = endDragFunction.Call(luaBehaviour, eventData);
                if (null != ret && ret.Length > 0)
                {
                    if ((bool)ret[0] && null != m_DragPassObj)
                    {
                        ExecuteEvents.Execute(m_DragPassObj, eventData, ExecuteEvents.endDragHandler);
                        m_DragPassObj = null;
                    }
                }
            }
        }

        protected GameObject PassEvent<T>(PointerEventData data, ExecuteEvents.EventFunction<T> function) where T : IEventSystemHandler
        {
            GameObject passObj = null;
            List<RaycastResult> results = new List<RaycastResult>();
            EventSystem.current.RaycastAll(data, results);
            bool bNext = false;
            for (int i = 0; i < results.Count; i++)
            {
                if (gameObject == results[i].gameObject)
                {
                    bNext = true;
                }
                else
                {
                    if (!bNext)
                    {
                        var eventObject = ExecuteEvents.GetEventHandler<T>(results[i].gameObject);
                        if (gameObject == eventObject)
                        {
                            bNext = true;
                        }
                    }
                    else
                    {
                        var eventObject = ExecuteEvents.GetEventHandler<T>(results[i].gameObject);
                        if (null == eventObject)
                        {
                            var g = results[i].gameObject.GetComponent<Graphic>();
                            if (null != g && g.raycastTarget)
                            {
                                break;
                            }
                        }
                        else if (gameObject != eventObject)
                        {
                            passObj = eventObject;
                            ExecuteEvents.Execute(eventObject, data, function);
                            break;
                        }
                    }
                }
            }

            if (!bNext && results.Count > 0)
            {
                for (int i = 0; i < results.Count; i++)
                {
                    var eventObject = ExecuteEvents.GetEventHandler<T>(results[i].gameObject);
                    if (null != eventObject && gameObject != eventObject)
                    {
                        passObj = eventObject;
                        ExecuteEvents.Execute(eventObject, data, function);
                        break;
                    }
                }
            }

            return passObj;
        }
    }
}
