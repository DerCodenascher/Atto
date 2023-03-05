#include "Application.h"

#include "Atto/Events/ApplicationEvent.h"
#include "Atto/Log.h"

namespace Atto {

	Application::Application() {}

	Application::~Application() {}

	void Application::Run() {
		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication)) {
			ATTO_TRACE(e);
		}
		if (e.IsInCategory(EventCategoryInput)) {
			ATTO_TRACE(e);
		}
		while (true);
	}

}