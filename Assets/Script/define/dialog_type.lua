local dialog_type = {

    -- SpecialUITest = {
    --     Type = "SpecialUITest",
    --     AssetBundles = {"ui/test/special_ui"},
    --     Path = "Assets/Prefabs/ui/test/SpecialUITest.prefab"
    -- },
    -- ShaderTest = {
    --     Type = "ShaderTest",
    --     AssetBundles = {"ui/test/shader_test"},
    --     Path = "Assets/Prefabs/ui/test/ShaderTest.prefab"
    -- },

    FPS = {
        Type = "FPS",
        AssetBundles = {"ui/fps"},
        Path = "Assets/Prefabs/ui/fps.prefab"
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
    CreatePlayer = {
        Type = "CreatePlayer",
        AssetBundles = {"ui/create_player"},
        Path = "Assets/Prefabs/ui/CreatePlayer.prefab"
    },
    Tips = {
        Type = "Tips",
        AssetBundles = {"ui/common"},
        Path = "Assets/Prefabs/ui/common/Tips.prefab", 
        SortOrder = 9999
    },
    Preload = {
        Type = "Preload",
        AssetBundles = {"ui/common"},
        Path = "Assets/Prefabs/ui/common/Preload.prefab",
        SortOrder = 9998
    },
    GoaheadNotice = {
        Type = "GoaheadNotice",
        AssetBundles = {"ui/common"},
        Path = "Assets/Prefabs/ui/common/notice/Goahead.prefab",
        SortOrder = 9990    
    },
    BlinkNotice = {
        Type = "BlinkNotice",
        AssetBundles = {"ui/common"},
        Path = "Assets/Prefabs/ui/common/notice/Blink.prefab",
        SortOrder = 9990    
    },
    Hero = {
        Type = "Hero",
        AssetBundles = {"ui/hero"},
        Path = "Assets/Prefabs/ui/Hero.prefab"
    },
}

return dialog_type