using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using XLua;

namespace Assets.Common.Lua
{
    class LuaMechineBehaviour : StateMachineBehaviour
    {
        public string luaScript = "";
        private Int64 m_Id = 0;

        private LuaFunction luaOnStateExit;
        private LuaFunction luaOnStateEnter;
        private LuaFunction luaOnStateIK;
        private LuaFunction luaOnStateMachineEnter;
        private LuaFunction luaOnStateMachineExit;
        private LuaFunction luaOnStateMove;
        private LuaFunction luaOnStateUpdate;
        private LuaTable luaBehaviour = null;

        public override void OnStateEnter(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
        {
            m_Id = LuaManager.GetInstance().GetId();
            var luaEnv = LuaManager.GetInstance().Env;
            var beginIndex = luaScript.LastIndexOf(".") + 1;
            var scriptName = luaScript;
            if (beginIndex >= 0 && beginIndex < luaScript.Length)
            {
                scriptName = scriptName.Substring(beginIndex);
            }

            LuaManager.GetInstance().CreateBehaviour(m_Id, luaScript);
            this.luaBehaviour = LuaManager.GetInstance().GetBehaviour(m_Id);
            luaOnStateExit = luaBehaviour.Get<LuaFunction>("onStateExit");
            luaOnStateEnter = luaBehaviour.Get<LuaFunction>("onStateEnter");
            luaOnStateIK = luaBehaviour.Get<LuaFunction>("onStateIK");
            luaOnStateMachineEnter = luaBehaviour.Get<LuaFunction>("onStateMachineEnter");
            luaOnStateMachineExit = luaBehaviour.Get<LuaFunction>("onStateMachineExit");
            luaOnStateMove = luaBehaviour.Get<LuaFunction>("onStateMove");
            luaOnStateUpdate = luaBehaviour.Get<LuaFunction>("onStateUpdate");
            luaBehaviour.Set("id", this.m_Id);

            if (null != luaOnStateEnter)
            {
                luaOnStateEnter.Call(this.luaBehaviour, animator, stateInfo, layerIndex);
            }
        }

        public override void OnStateExit(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
        {

            if (null != luaOnStateExit)
            {
                luaOnStateExit.Call(this.luaBehaviour, animator, stateInfo, layerIndex);
            }
        }

        public override void OnStateIK(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
        {

            if (null != luaOnStateIK)
            {
                luaOnStateIK.Call(this.luaBehaviour, animator, stateInfo, layerIndex);
            }
        }

        public override void OnStateMachineEnter(Animator animator, int stateMachinePathHash)
        {

            if (null != luaOnStateMachineEnter)
            {
                luaOnStateMachineEnter.Call(this.luaBehaviour, animator, stateMachinePathHash);
            }
        }

        public override void OnStateMachineExit(Animator animator, int stateMachinePathHash)
        {

            if (null != luaOnStateMachineExit)
            {
                luaOnStateMachineExit.Call(this.luaBehaviour, animator, stateMachinePathHash);
            }
        }

        public override void OnStateMove(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
        {

            if (null != luaOnStateMove)
            {
                luaOnStateMove.Call(this.luaBehaviour, animator, stateInfo, layerIndex);
            }
        }

        public override void OnStateUpdate(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
        {

            if (null != luaOnStateUpdate)
            {
                luaOnStateUpdate.Call(this.luaBehaviour, animator, stateInfo, layerIndex);
            }
        }
    }
}
