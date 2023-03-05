#pragma once

#ifdef ATTO_PLATFORM_WINDOWS

extern Atto::Application* Atto::CreateApplication();

int main(int argc, char** argv) {
	Atto::Log::Init();
	ATTO_CORE_WARN("Initialized Log!");
	int a = 5;
	ATTO_INFO("Hello! Var={0}", a);

	printf("Atto Engine");
	auto app = Atto::CreateApplication();
	app->Run();
	delete app;
}

#endif
