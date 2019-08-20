local dialog_type = {
    NetworkUI = {
        Type = "NetworkUI",
        AssetBundles = {"test_ui"},
        Path = "Assets/Prefabs/NetworkUI.prefab"
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
        Path = "Assets/Prefabs/ui/common/Tips.prefab"
    },
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
}

return dialog_type