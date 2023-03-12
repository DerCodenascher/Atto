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

#ifdef ATTO_ENABLE_ASSERTS
	#define ATTO_ASSERT(x, ...) { if(!(x)) { HZ_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define ATTO_CORE_ASSERT(x, ...) { if(!(x)) { HZ_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define ATTO_ASSERT(x, ...)
	#define ATTO_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)