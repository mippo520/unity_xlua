
--[[
	dialog属性:
		SortOrder:	绘制层级,默认自动处于活动层的最高层
		OnlyOne:	是否唯一,默认不唯一
		FullScreen:	是否全屏,默认不全屏
]]

local dialog_type = {

	PackageTest = {
		Type = "PackageTest",
		AssetBundles = {"ui/test/package_test"},
		Path = "Assets/Prefabs/ui/test/PackageTest.prefab"
	},
	ScrollTest = {
		Type = "ScrollTest",
		AssetBundles = {"ui/test/scroll"},
		Path = "Assets/Prefabs/ui/test/ScrollTest.prefab"
	},
	RvoTest = {
		Type = "RvoTest",
		AssetBundles = {"ui/test/rvo_test"},
		Path = "Assets/Prefabs/ui/test/RvoTest.prefab"
	},
	ShaderTest = {
		Type = "ShaderTest",
		AssetBundles = {"ui/test/shader_test"},
		Path = "Assets/Prefabs/ui/test/ShaderTest.prefab"
	},
	TestMenu = {
		Type = "TestMenu",
		AssetBundles = {"ui/test/test_menu"},
		Path = "Assets/Prefabs/ui/test/TestMenu.prefab"
	},
	
	
    FPS = {
        Type = "FPS",
        AssetBundles = {"ui/fps"},
        Path = "Assets/Prefabs/ui/fps.prefab",
        SortOrder = 10000
    },

    Regist = {
        Type = "Regist",
        AssetBundles = {"ui/regist"},
        Path = "Assets/Prefabs/ui/Regist.prefab"
    },
    Login = {
        Type = "Login",
        AssetBundles = {"ui/login"},
        Path = "Assets/Prefabs/ui/Login.prefab"
    },

	Tips = {
		Type = "Tips",
		AssetBundles = {"ui/common"},
		Path = "Assets/Prefabs/ui/common/Tips.prefab",
		SortOrder = 9999				-- UI所在层级
	},
	UpdateTips = {
		Type = "UpdateTips",
		AssetBundles = {"ui/update"},
		Path = "Assets/Prefabs/ui/update/UpdateTips.prefab",
		SortOrder = 9999				-- UI所在层级
	},
	Toast = {
        Type = "Toast",
        AssetBundles = {"ui/common"},
        Path = "Assets/Prefabs/ui/common/Toast.prefab", 
        SortOrder = 9999
    },
    Preload = {
        Type = "Preload",
        AssetBundles = {"ui/common"},
        Path = "Assets/Prefabs/ui/common/Preload.prefab",
        SortOrder = 9998
    },


}

return dialog_type