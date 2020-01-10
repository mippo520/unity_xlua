/*
	Generated by KBEngine!
	Please do not modify this file!
	
	tools = kbcmd
*/

namespace KBEngine
{
	using UnityEngine;
	using System;
	using System.Collections;
	using System.Collections.Generic;

	// defined in */scripts/entity_defs/HelloEntity.def
	public class EntityBaseEntityCall_HelloEntityBase : EntityCall
	{

		public EntityBaseEntityCall_HelloEntityBase(Int32 eid, string ename) : base(eid, ename)
		{
			type = ENTITYCALL_TYPE.ENTITYCALL_TYPE_BASE;
		}

	}

	public class EntityCellEntityCall_HelloEntityBase : EntityCall
	{

		public EntityCellEntityCall_HelloEntityBase(Int32 eid, string ename) : base(eid, ename)
		{
			type = ENTITYCALL_TYPE.ENTITYCALL_TYPE_CELL;
		}

		public void say(string arg1)
		{
			Bundle pBundle = newCall("say", 0);
			if(pBundle == null)
				return;

			bundle.writeUnicode(arg1);
			sendCall(null);
		}

	}
	}
