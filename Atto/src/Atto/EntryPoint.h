#pragma once

#ifdef ATTO_PLATFORM_WINDOWS

extern Atto::Application* Atto::CreateApplication();

int main(int argc, char** argv)
{
	printf("Atto Engine");
	auto app = Atto::CreateApplication();
	app->Run();
	delete app;
}

#endif
