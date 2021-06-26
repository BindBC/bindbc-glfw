# bindbc-glfw
This project provides both static and dynamic bindings to [the GLFW library](http://www.glfw.org/index.html). They are `@nogc` and `nothrow` compatible and can be compiled for compatibility with `-betterC`. This package is intended as a replacement of [DerelictGLFW3](https://github.com/DerelictOrg/DerelictGLFW3), which is not compatible with `@nogc`,  `nothrow`, or `-betterC`.

## Usage
By default, bindbc-glfw is configured to compile as a dynamic binding that is not `-betterC` compatible. The dynamic binding has no link-time dependency on the GLFW library, so the GLFW shared library must be manually loaded at runtime. When configured as a static binding, there is a link-time dependency on the GLFW library through either the static library or the appropriate file for linking with shared libraries on your platform (see below).

When using DUB to manage your project, the static binding can be enabled via a DUB `subConfiguration` statement in your project's package file. `-betterC` compatibility is also enabled via subconfigurations.

To use GLFW, add bindbc-glfw as a dependency to your project's package config file. For example, the following is configured to use GLFW as a dynamic binding that is not `-betterC` compatible:

__dub.json__
```
dependencies {
    "bindbc-glfw": "~>1.0.0",
}
```

__dub.sdl__
```
dependency "bindbc-glfw" version="~>1.0.0"
```

### The dynamic binding
The dynamic binding requires no special configuration when using DUB to manage your project. There is no link-time dependency. At runtime, the GLFW shared library is required to be on the shared library search path of the user's system. On Windows, this is typically handled by distributing the GLFW DLL with your program. On other systems, it usually means the user must install the GLFW runtime library through a package manager.

To load the shared library, you need to call the `loadGLFW` function. This returns a member of the `GLFWSupport` enumeration (See [the bindbc.loader README](https://github.com/BindBC/bindbc-loader/blob/master/README.md) for the error handling API):

* `GLFWSupport.noLibrary` indicating that the library failed to load (it couldn't be found)
* `GLFWSupport.badLibrary` indicating that one or more symbols in the library failed to load
* a member of `GLFWSupport` indicating a version number that matches the version of GLFW that bindbc-glfw was configured at compile-time to load. By default, that is `GLFWSupport.glfw30`, but can be configured via a version identifier (see below). This value will match the global manifest constant, `glfwSupport`.

```d
import bindbc.glfw;

/*
 This version attempts to load the GLFW shared library using well-known variations of the library name for the host
 system.
*/
GLFWSupport ret = loadGLFW();
if(ret != glfwSupport) {

    /*
     Handle error. For most use cases, it's reasonable to use the the error handling API in bindbc-loader to retrieve
     error messages for logging and then abort. If necessary, it's possible to determine the root cause via the return
     value:
    */

    if(ret == GLFWSupport.noLibrary) {
        // The GLFW shared library failed to load
    }
    else if(GLFWSupport.badLibrary) {
        /*
         One or more symbols failed to load. The likely cause is that the shared library is for a lower version than bindbc-glfw was configured to load (via GLFW_31, GLFW_32 etc.)
        */
    }
}
/*
 This version attempts to load the GLFW library using a user-supplied file name. Usually, the name and/or path used
 will be platform specific, as in this example which attempts to load `glfw3.dll` from the `libs` subdirectory,
 relative to the executable, only on Windows.
*/
version(Windows) loadGLFW("libs/glfw3.dll")
```

[The error reporting API](https://github.com/BindBC/bindbc-loader#error-handling) in bindbc-loader can be used to log error messages.

```d
// Import the dependent package
import bindbc.glfw;

/*
 Import the sharedlib module for error handling. Assigning an alias ensures the function names do not conflict with
 other public APIs. This isn't strictly necessary, but the API names are common enough that they could appear in other
 packages.
*/
import loader = bindbc.loader.sharedlib;

bool loadLib() {
    /*
     Compare the return value of loadGLFW with the global `glfwSupport` constant to determine if the version of GLFW
     configured at compile time is the version that was loaded.
    */
    auto ret = loadGLFW();
    if(ret != glfwSupport) {
        // Log the error info
        foreach(info; loader.errors) {
            /*
             A hypothetical logging function. Note that `info.error` and `info.message` are `const(char)*`, not
             `string`.
            */
            logError(info.error, info.message);
        }

        // Optionally construct a user-friendly error message for the user
        string msg;
        if(ret == GLFWSupport.noLibrary) {
            msg = "This application requires the GLFW library.";
        } else {
            msg = "The version of the GLFW library on your system is too low. Please upgrade."
        }
        // A hypothetical message box function
        showMessageBox(msg);
        return false;
    }
    return true;
}
```

By default, the bindbc-glfw binding is configured to load GLFW 3.0. This ensures the widest level of compatibility at run time. This behavior can be overridden via the `-version` compiler switch or the `versions` DUB directive with the desired GLFW version number. It is recommended that you always select the minimum version you require _and no higher_. In this example, the GLFW dynamic binding is compiled to support GLFW 3.1:

__dub.json__
```
"dependencies": {
    "bindbc-glfw": "~>1.0.0"
},
"versions": ["GLFW_31"]
```

__dub.sdl__
```
dependency "bindbc-glfw" version="~>1.0.0"
versions "GLFW_31"
```

With this example configuration, `glfwSupport` is configured at compile time as `GLFWSupport.glfw31`. If GLFW 3.1 or later is installed on the user's system, `loadGLFW` will return `GLFWSupport.glfw31`. If only GLFW 3.0 is installed, `loadGLFW` will return `GLFWSupport.badLibrary`. In this scenario, calling `loadedGLFWVersion()` will return a `GLFWSupport` member indicating which version of GLFW, if any, actually loaded.

If a lower version is loaded, it's still possible to call functions from that version of GLFW, but any calls to functions from versions between that version and the one you configured will result in a null pointer access. For example, if you configured `GLFW 3.2` and loaded `GLFW 3.0`, then function pointers from both 3.1 and 3.2 will be `null`. For this reason, it's recommended to always specify your required version of the GLFW library at compile time and abort when you receive a `GLFWSupport.badLibrary` return value from `loadGLFW`.

No matter which version was configured, the successfully loaded version can be obtained via a call to `loadedGLFWVersion`. It returns one of the following:

* `GLFWSupport.noLibrary` if `loadGLFW` returned `GLFWSupport.noLibrary`
* `GLFWSupport.badLibrary` if `loadGLFW` returned `GLFWSupport.badLibrary` and no version of GLFW successfully loaded
* a member of `GLFWSupport` indicating the version of GLFW that successfully loaded. When `loadGLFW` returns `GLFWSupport.badLibrary`, this will be a version number lower than the one configured at compile time. Otherwise, it will be the same as the manifest constant `glfwSupport`.

The function `isGLFWLoaded` returns `true` if any version of GLFW was successfully loaded and `false` otherwise.

Following are the supported versions of GLFW, the corresponding version IDs to pass to the compiler, and the corresponding `GLFWSupport` members.

| Library & Version  | Version ID       | `GLFWSupport` Member |
|--------------------|------------------|----------------------|
|GLFW 3.0            | Default          | `GLFWSupport.glfw30` |
|GLFW 3.1            | GLFW_31          | `GLFWSupport.glfw31` |
|GLFW 3.2            | GLFW_32          | `GLFWSupport.glfw32` |
|GLFW 3.3            | GLFW_33          | `GLFWSupport.glfw33` |

## The static binding
First things first: the static _binding_ does not require static _linking_. It allows for both static and dynamic linking. The static binding has a link-time dependency on either the shared or the static GLFW library. On Windows, you can link with the static library or with the import library for dynamic linking, i.e., to use the shared library (`glfw3.dll`). On other systems, you can link with either the static library or directly with the shared library. This requires the GLFW development package be installed on your system at compile time, either by compiling the GLFW source yourself, downloading the GLFW precompiled binaries for Windows, or installing via a system package manager. [See the GLFW download page](https://www.glfw.org/download.html) for details.

When linking with the shared library (or the import library on Windows), the runtime dependency is the same as that of the dynamic binding. The difference is that the shared library is no longer loaded manually&mdash;loading is handled automatically by the system when the program is launched. Attempting to call `loadGLFW` with the static binding enabled will result in a compilation error.

When linking with the static library, there is no runtime dependency on GLFW. However, you will also need to link with [all of GLFW's dependencies](https://www.glfw.org/docs/latest/compile_guide.html) for your target platform.

Enabling the static binding can be done in two ways.

### Via the compiler's `-version` switch or DUB's `versions` directive
Pass the `BindGLFW_Static` version to the compiler and link with the appropriate library. Note that `BindGLFW_Static` will also enable the static binding for any satellite libraries used.

When using the compiler command line or a build system that doesn't support DUB, this is the only option. The `-version=BindGLFW_Static` option should be passed to the compiler when building your program. All of the required C libraries, as well as the bindbc-glfw and bindbc-loader static libraries must also be passed to the compiler on the command line or via your build system's configuration.

When using DUB, its `versions` directive is an option. For example, when using the static binding:

__dub.json__
```
"dependencies": {
    "bindbc-glfw": "~>1.0.0"
},
"versions": ["BindGLFW_Static"],
"libs": ["glfw3"]
```

__dub.sdl__
```
dependency "bindbc-glfw" version="~>1.0.0"
versions "BindGLFW_Static"
libs "glfw3"
```

### Via DUB subconfigurations
Instead of using DUB's `versions` directive, a `subConfiguration` can be used. Enable the `static` subconfiguration for the bindbc-glfw dependency:

__dub.json__
```
"dependencies": {
    "bindbc-glfw": "~>1.0.0"
},
"subConfigurations": {
    "bindbc-glfw": "static"
},
"libs": ["glfw3"]
```

__dub.sdl__
```
dependency "bindbc-glfw" version="~>1.0.0"
subConfiguration "bindbc-glfw" "static"
libs "glfw3"
```

This has the benefit that it completely excludes from the build any source modules related to the dynamic binding, i.e., they will never be passed to the compiler. Using the version approach, the related modules are still passed to the compiler, but their contents are versioned out.

## `betterC` support
`betterC` support is enabled via the `dynamicBC` and `staticBC` subconfigurations, for dynamic and static bindings respectively. To enable the static binding with `-betterC` support:

__dub.json__
```
"dependencies": {
    "bindbc-glfw": "~>1.0.0"
},
"subConfigurations": {
    "bindbc-glfw": "staticBC"
},
"libs": ["glfw3"]
```

__dub.sdl__
```
dependency "bindbc-glfw" version="~>1.0.0"
subConfiguration "bindbc-glfw" "staticBC"
libs "glfw3"
```

When not using DUB to manage your project, first use DUB to compile the BindBC libraries with the `dynamicBC` or `staticBC` configuration, then pass `-betterC` to the compiler when building your project (and `-version=BindGLFW_Static` if you used the `staticBC` configuration).

## Optional platform-specific functions
GLFW ships with some platform-specific "native" functions that are useful for obtaining native window handles, OpenGL context handles, etc. By default, these are not compiled into the binding. Doing so would require either importing specific platform bindings or using private declarations for the platform-specific types. Both approaches would potentially conflict with user code imports from a different platform-specific binding.

To enable these functions, string constants are provided that can be mixed into user code. Doing so will declare the relevant functions along with a loader function that must be called in addition to `loadGLFW`. This loader function returns `true` if the functions are successfully loaded and `false` otherwise.

The string constants are named with the prefix `bindGLFW_`, followed by a platform-specific identifer. The load functions are use the prefix `loadGLFW_` followed by the same platform-specific identifier.

For example, to declare and load the Windows-specific functions:

```d
/*
 Ideally, these functions should be mixed in where they are needed, or in a module that can be imported where they are
 needed, such as a project-specific platform module.
*/
module myproject.platform;

import bindbc.glfw;

version(Windows) {
    // Import the platform API bindings
    import core.sys.windows.windows;

    // Mixin the function declarations and loader
    mixin(bindGLFW_Windows);
}

// Then wherever you choose to load the shared libraries, say in the `main` funcion in a `myproject.app` module:
module myproject.app;

void main() {
    import myproject.platform : loadGLFW_Windows;

    // Load the GLFW library's core API
    if(loadGLFW() != glfwSupport) {
        // handle error
    }

    // Load the Windows-specific GLFW native API
    if(!loadGLFW_Windows()) {
        // handle error
    }
}
```

The platform-specific functions are categorized as UI-related APIs (for Window handles, etc.) and OpenGL-related APIs (for platform-specific OpenGL contexts). The following table shows the available constants and loaders. For details on the specifics of the plaform-specific functions, please see [the GLFW "Native access" documentation](https://www.glfw.org/docs/latest/group__native.html).


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

## `@nogc` callbacks
GLFW makes use of C-style callbacks for event handling. By default, these are aliased as `extern(C) nothrow` function pointers in bindbc-glfw. So any function you want to designate as a GLFW callback must not only match the function signature that GLFW expects, but also must be annotated as `extern(C) nothrow`.

`@nogc` is *not* applied to the callback aliases because it is perfectly reasonable to use the GC on the D side of a C callback. And since the callback will usually be called from GLFW and not from the D code, then the `@nogc` attribute is largely irrelevant here even in programs where it is used everywhere else.

However, it is not impossible that a function intended to serve as a GLFW callback may also be implemented with the intent that it can be called directly from D. In that situation, if the calling function is `@nogc`, then the callback should also be.

The binding supports `@nogc` callbacks via the `BindGLFW_NoGC_Callbacks` version. Add this to your dub recipe's `versions` directive or the compiler command line. Just remember that any function you want to designate as a GLFW callback will then need to be `extern(C) @nogc nothrow`.