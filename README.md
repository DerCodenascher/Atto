# Atto
## Exercise 1 – Questions
### What is the difference between git and github?
Git is a version control system, whereas Github is a cloud-based hosting service that lets you manage (remote) repositories.
### Name 3 benefits of a version control system:
- Keep track of every change done to the code and revert if necessary
- Reduce code duplication and errors due to outdated code
- Facilitate simultaneous collaboration with other developers through branching and merging
### Name 3 alternatives to git:
- Subversion
- Mercurial
- Perfoce Helix Core
### Name 2 differences between git and other version control systems:
- While SVN is centralized, Git is a distributed version control system, i.e., each git installation can act as server and client. Each user also has a local copy of the repository with its full history.
- While SVN branches are based on a directory structure (a branch is created as directory), Git branches only reference specific commits
### Name known issues related to game engines (Unreal, Unity) and version control systems:
Binary files like images, videos, models or any other asset may together take up a lot of disk space and slow down operations like the cloning of a repository. Furthermore they can't be merged, which makes collaboration on an asset difficult.

## Exercise 2 - Questions
### Describe a logging system with your own words:
A logging system serves the purpose of providing the developer with a simplified way to output all kinds of information in the output console in a standardized way. The logged messages can be categorized as warnings, information, etc. and are used for troubleshooting and monitoring of the application.
### What is the difference between git submodules and git subtrees?
Submodules are a link to a commit of an other repository (good when you depend on a fixed version),
Subtrees copy the whole repository including the commit history. (Useful for component based development)
### What is a build system in C++? Name 3 build systems:
With a build system, the developer can specify configurations and build details (include directories, links, etc) in a build file that can then be executed to build the project. Build systems provide useful functions for system insights as well as other command line commands such as the copy command.
Examples: make, cmake, premake, ninja, nmake
### What is a package manager in C++? Name 3 package managers:
A package manager automates the installation of third party libraries and optionally handles the interaction with the build system.
Examples: conan, vcpkg, hunter