#pragma once

#include "Core.h"

namespace Atto 
{

	class ATTO_API Application
	{
	public: 
		Application();
		virtual ~Application();

		void Run();
	};

	// To be defined in client
	Application* CreateApplication();

}


