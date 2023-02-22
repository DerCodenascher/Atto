#pragma once

#ifdef ATTO_PLATFORM_WINDOWS
	#ifdef ATTO_BUILD_DLL
		#define ATTO_API __declspec(dllexport)
	#else
		#define ATTO_API __declspec(dllimport)
	#endif
#else
	#error Atto only supports Windows!
#endif