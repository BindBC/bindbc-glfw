# bindbc-glfw
This project provides both static and dynamic bindings to the [GLFW library](http://www.glfw.org/index.html). They are `@nogc` and `nothrow` compatible and can be compiled for compatibility with `-betterC`. This package is intended as a replacement of [DerelictGLFW3](https://github.com/DerelictOrg/DerelictGLFW3), which is not compatible with `@nogc`,  `nothrow`, or `-betterC`.

## Usage
By default, `bindbc-glfw` is configured to compile as a dynamic binding that is not `-betterC` compatible. The dynamic binding has no link-time dependency on the GLFW library, so the GLFW shared library must be manually loaded at runtime. When configured as a static binding, there is a link-time dependency on the GLFW library through either the static library or the appropriate file for linking with shared libraries on your platform (see below).

When using DUB to manage your project, the static binding can be enabled via a DUB `subConfiguration` statement in your project's package file. `-betterC` compatibility is also enabled via subconfigurations.

To use GLFW, add `bindbc-glfw` as a dependency to your project's package config file. For example, the following is configured to use GLFW as a dynamic binding that is not `-betterC` compatible:

__dub.json__
```
dependencies {
    "bindbc-glfw": "~>0.10.0",
}
```

__dub.sdl__
```
dependency "bindbc-glfw" version="~>0.10.0"
```

### The dynamic binding
The dynamic binding requires no special configuration when using DUB to manage your project. There is no link-time dependency. At runtime, the GLFW shared library is required to be on the shared library search path of the user's system. On Windows, this is typically handled by distributing the GLFW DLL with your program. On other systems, it usually means the user must install the GLFW runtime library through a package manager.

To load the shared library, you need to call the `loadGLFW` function. This returns a member of the `GLFWSupport` enumeration (See [the README for `bindbc.loader`](https://github.com/BindBC/bindbc-loader/blob/master/README.md) for the error handling API):

* `GLFWSupport.noLibrary` indicating that the library failed to load (it couldn't be found)
* `GLFWSupport.badLibrary` indicating that one or more symbols in the library failed to load
* a member of `GLFWSupport` indicating a version number that matches the version of GLFW that `bindbc-glfw` was configured at compile-time to load. By default, that is `GLFWSupport.glfw30`, but can be configured via a version identifier (see below). This value will match the global manifest constant, `glfwSupport`.

```d
import bindbc.glfw;

/*
This version attempts to load the GLFW shared library using well-known variations
of the library name for the host system.
*/
GLFWSupport ret = loadGLFW();
if(ret != glfwSupport) {

    // Handle error. For most use cases, its reasonable to use the the error handling API in
    // bindbc-loader to retrieve error messages for logging and then abort. If necessary, it's
    // possible to determine the root cause via the return value:

    if(ret == GLFWSupport.noLibrary) {
        // GLFW shared library failed to load
    }
    else if(GLFWSupport.badLibrary) {
        // One or more symbols failed to load. The likely cause is that the
        // shared library is for a lower version than bindbc-glfw was configured
        // to load (via GLFW_31, GLFW_32 etc.)
    }
}
/*
This version attempts to load the GLFW library using a user-supplied file name.
Usually, the name and/or path used will be platform specific, as in this example
which attempts to load `glfw3.dll` from the `libs` subdirectory, relative
to the executable, only on Windows.
*/
// version(Windows) loadGLFW("libs/glfw3.dll")
```
By default, the `bindbc-glfw` binding is configured to compile to load GLFW 3.0. This ensures the widest level of compatibility at runtime. This behavior can be overridden via the `-version` compiler switch or the `versions` DUB directive with the desired GLFW version number. It is recommended that you always select the minimum version you require _and no higher_. In this example, the GLFW dynamic binding is compiled to support GLFW 3.1:

__dub.json__
```
"dependencies": {
    "bindbc-glfw": "~>0.10.0"
},
"versions": ["GLFW_31"]
```

__dub.sdl__
```
dependency "bindbc-glfw" version="~>0.10.0"
versions "GLFW_31"
```

With this example configuration, `glfwSupport == GLFWSupport.glfw31`. If GLFW 3.1 or later is installed on the user's system, `loadGLFW` will return `GLFWSupport.glfw31`. If only GLFW 3.0 is installed, `loadGLFW` will return `GLFWSupport.badLibrary`. In this scenario, calling `loadedGLFWVersion()` will return a `GLFWSupport` member indicating which version of GLFW, if any, actually loaded. If a lower version was loaded, it's still possible to call functions from that version of GLFW, but any calls to functions from higher versions will result in a null pointer access. For this reason, it's recommended to always specify your required version of the GLFW library at compile time and abort when you receive a `GLFWSupport.badLibrary` return value from `loadGLFW`.

No matter which version was configured, the successfully loaded version can be obtained via a call to `loadedGLFWVersion`. It returns one of the following:

* `GLFWSupport.noLibrary` if `loadGLFW` returned `GLFWSupport.noLibrary`
* `GLFWSupport.badLibrary` if `loadGLFW` returned `GLFWSupport.badLibrary` and no version of GLFW successfully loaded
* a member of `GLFWSupport` indicating the version of GLFW that successfully loaded. When `loadGLFW` returns `GLFWSupport.badLibrary`, this will be a version number lower than that configured at compile time. Otherwise, it will be the same as the manifest constant `glfwSupport`.

The function `isGLFWLoaded` returns `true` if any version of GLFW was successfully loaded and `false` otherwise.

Following are the supported versions of GLFW, the corresponding version IDs to pass to the compiler, and the corresponding `GLFWSupport` members.

| Library & Version  | Version ID       | `GLFWSupport` Member |
|--------------------|------------------|----------------------|
|GLFW 3.0            | Default          | `GLFWSupport.glfw30` |
|GLFW 3.1            | GLFW_31          | `GLFWSupport.glfw31` |
|GLFW 3.2            | GLFW_32          | `GLFWSupport.glfw32` |
|GLFW 3.3            | GLFW_33          | `GLFWSupport.glfw33` |

## The static binding
The static binding has a link-time dependency on either the shared or the static GLFW library. On Windows, you can link with the static library or, to use the shared library (`glfw3.dll`), with the import library. On other systems, you can link with either the static library or directly with the shared library. This requires the GLFW development package be installed on your system at compile time, either by compiling the GLFW source yourself, downloading the GLFW precompiled binaries for Windows, or installing via a system package manager. [See the GLFW download page](https://www.glfw.org/download.html) for details.

When linking with the static library, there is no runtime dependency on GLFW. When linking with the shared library (or the import library on Windows), the runtime dependency is the same as the dynamic binding, the difference being that the shared library is no longer loaded manually---loading is handled automatically by the system when the program is launched.

Enabling the static binding can be done in two ways.

### Via the compiler's `-version` switch or DUB's `versions` directive
Pass the `BindGLFW_Static` version to the compiler and link with the appropriate library. Note that `BindGLFW_Static` will also enable the static binding for any satellite libraries used.

When using the compiler command line or a build system that doesn't support DUB, this is the only option. The `-version=BindGLFW_Static` option should be passed to the compiler when building your program. All of the required C libraries, as well as the `bindbc-glfw` and `bindbc-loader` static libraries must also be passed to the compiler on the command line or via your build system's configuration.

When using DUB, its `versions` directive is an option. For example, when using the static binding:

__dub.json__
```
"dependencies": {
    "bindbc-glfw": "~>0.10.0"
},
"versions": ["BindGLFW_Static"],
"libs": ["glfw3"]
```

__dub.sdl__
```
dependency "bindbc-glfw" version="~>0.10.0"
versions "BindGLFW_Static"
libs "glfw3"
```

### Via DUB subconfigurations
Instead of using DUB's `versions` directive, a `subConfiguration` can be used. Enable the `static` subconfiguration for the `bindbc-glfw` dependency:

__dub.json__
```
"dependencies": {
    "bindbc-glfw": "~>0.10.0"
},
"subConfigurations": {
    "bindbc-glfw": "static"
},
"libs": ["glfw3"]
```

__dub.sdl__
```
dependency "bindbc-glfw" version="~>0.10.0"
subConfiguration "bindbc-glfw" "static"
libs "glfw3"
```

This has the benefit that it completely excludes from the build any source modules related to the dynamic binding, i.e. they will never be passed to the compiler.

## `betterC` support
`betterC` support is enabled via the `dynamicBC` and `staticBC` subconfigurations, for dynamic and static bindings respectively. To enable the static binding with `-betterC` support:

__dub.json__
```
"dependencies": {
    "bindbc-glfw": "~>0.10.0"
},
"subConfigurations": {
    "bindbc-glfw": "staticBC"
},
"libs": ["glfw3"]
```

__dub.sdl__
```
dependency "bindbc-glfw" version="~>0.10.0"
subConfiguration "bindbc-glfw" "staticBC"
libs "glfw3"
```

When not using DUB to manage your project, first use DUB to compile the BindBC libraries with the `dynamicBC` or `staticBC` configuration, then pass `-betterC` to the compiler when building your project.

## Optional platform-specific functions
GLFW ships with some platform-specific functions that are useful for obtaining, e.g., native window handles, OpenGL context handles, etc. By default, these are not compiled into the binding. Doing so would require either importing specific platform bindings, or using private declarations for the platform-specific types. Both approaches would potentially conflict with user code that uses a different platform-specific binding. (Only the Windows API has bindings in a standard D distribution, but for consistency, it is not used internally either.)

To enable these functions, string constants are provided that can be mixed into to user code. Doing so will declare the relevant functions along with a loader function that must be called in addition to `loadGLFW`. This loader function returns `true` if the functions are successfully loaded and `false` otherwise.

The string constants are named with the previx `bindGLFW_`, followed by a platform-specific identifer. The load functions are use the prefix `loadGLFW_` followed by the same platform-specific identifier.

For example, to declare and load the Windows-specific functions:

```d
// Ideally, these functions should be mixed in where they are needed, or in a module
// that can be imported where they are needed, such as a project-specific platform module.
module myproject.platform;

version(Windows) {
    // Import the platform API bindings
    import core.sys.windows.windows;

    // Mixin the function declarations and loader
    mixin(bindGLFW_Windows);
}

// Then wherever you choose to load the shared libraries, say in `main`:
module myproject.app;

void main() {
    import myproject.platform : loadGLFW_Windows;

    if(loadGLFW() != glfwSupport) {
        // handle error
    }

    if(!loadGLFW_Windows()) {
        // handle error
    }
}
```

The platform-specific functions are divided categorized between UI-related APIs (for Window handles, etc.) and OpenGL-related APIs (for platform-specific OpenGL contexts). The following table shows the available constants and loaders. For details on the specifics of the plaform-specific functions, please see [the GLFW "Native access" documentation](https://www.glfw.org/docs/latest/group__native.html).


| Platform API       | Constant           | Loader               | Note                 |
|--------------------|--------------------|----------------------|----------------------|
| Windows UI (Win32) | `bindGLFW_Windows` | `loadGLFW_Windows`   |                      |
| Windows GL (WGL)   | `bindGLFW_WGL`     | `loadGLFW_WGL`       |                      |
| OSX UI (Cocoa)     | `bindGLFW_Cocoa`   | `loadGLFW_Cocoa`     |                      |
| OSX GL (NGL)       | `bindGLFW_NGL`     | `loadGLFW_NGL`       |                      |
| Linux/BSD UI (X11) | `bindGLFW_X11`     | `loadGLFW_X11`       |                      |
| Linux/BSD GL (GLX) | `bindGLFW_GLX`     | `loadGLFW_GLX`       |                      |
| Linux UI (Wayland) | `bindGLFW_Wayland` | `loadGLFW_Wayland`   |                      |
| Linux UI (Mir)     | `bindGLFW_Mir`     | `loadGLFW_Mir`       | GLFW 3.2 only        |
| Mobile UI/GL (EGL) | `bindGLFW_EGL`     | `loadGLFW_EGL`       |                      |
| All UI (Vulkan)    | `bindGLFW_Vulkan`  | `loadGLFW_Vulkan`    | GLFW 3.2 and higher  |
