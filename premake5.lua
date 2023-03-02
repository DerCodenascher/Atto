workspace "Atto"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Atto"
    location "Atto"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files 
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/vendor/spdlog/include"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "10.0"

        defines
        {
            "ATTO_PLATFORM_WINDOWS",
            "ATTO_BUILD_DLL"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }

    filter "configurations:Debug"
        defines "ATTO_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "ATTO_RELEASE"
        symbols "On"

    filter "configurations:Dist"
        defines "ATTO_DIST"
        symbols "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"

    language "C++"
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files 
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "Atto/vendor/spdlog/include",
        "Atto/src"
    }

    links
    {
        "Atto"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "10.0"

        defines
        {
            "ATTO_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "ATTO_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "ATTO_RELEASE"
        symbols "On"

    filter "configurations:Dist"
        defines "ATTO_DIST"
        symbols "On"
