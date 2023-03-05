#pragma once

#include<memory>

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"
#include "spdlog/sinks/stdout_color_sinks.h"

namespace Atto {

	class ATTO_API Log {
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};

}

// Core Log Macros
#define ATTO_CORE_TRACE(...)	::Atto::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define ATTO_CORE_INFO(...)		::Atto::Log::GetCoreLogger()->info(__VA_ARGS__)
#define ATTO_CORE_WARN(...)		::Atto::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define ATTO_CORE_ERROR(...)	::Atto::Log::GetCoreLogger()->error(__VA_ARGS__)
#define ATTO_CORE_FATAL(...)	::Atto::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Client Log Macros
#define ATTO_TRACE(...)		::Atto::Log::GetClientLogger()->trace(__VA_ARGS__)
#define ATTO_INFO(...)		::Atto::Log::GetClientLogger()->info(__VA_ARGS__)
#define ATTO_WARN(...)		::Atto::Log::GetClientLogger()->warn(__VA_ARGS__)
#define ATTO_ERROR(...)		::Atto::Log::GetClientLogger()->error(__VA_ARGS__)
#define ATTO_FATAL(...)		::Atto::Log::GetClientLogger()->fatal(__VA_ARGS__)