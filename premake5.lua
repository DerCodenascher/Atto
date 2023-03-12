workspace "Atto"
    startproject "Sandbox"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- inlcude dirs relatie to root folder (solution dir)
IncludeDir = {}
IncludeDir["GLFW"] = "Atto/vendor/GLFW/include"

include "Atto/vendor/GLFW"

project "Atto"
    location "Atto"
    kind "SharedLib"
    language "C++"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "attopch.h"
    pchsource "Atto/src/attopch.cpp"

    files 
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}"
    }
    
    links 
    {
        "GLFW",
        "opengl32.lib"
    }

    filter "system:windows"
        cppdialect "C++17"
        runtime "Debug"
        systemversion "latest"

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
        runtime "Debug"

    filter "configurations:Release"
        defines "ATTO_RELEASE"
        optimize "On"
        runtime "Release"

    filter "configurations:Dist"
        defines "ATTO_DIST"
        optimize "On"
        runtime "Release"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
    staticruntime "off"

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
        runtime "Debug"
        systemversion "latest"

        defines
        {
            "ATTO_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "ATTO_DEBUG"
        symbols "On"
        runtime "Debug"

    filter "configurations:Release"
        defines "ATTO_RELEASE"
        optimize "On"
        runtime "Release"

    filter "configurations:Dist"
        defines "ATTO_DIST"
        optimize "On"
        runtime "Release"
