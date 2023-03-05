#include <Atto.h>

class Sandbox : public Atto::Application {
public:
	Sandbox() {}
	~Sandbox() {}
};

Atto::Application* Atto::CreateApplication() {
	return new Sandbox();
}
