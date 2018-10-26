# bindbc-glfw
This project provides both static and dynamic bindings to the [GLFW library](http://www.glfw.org/index.html). They are `@nogc` and `nothrow` compatible can be compiled with compatibility with `-betterC`. This package is intended as a replacement of [DerelictGLFW3](https://github.com/DerelictOrg/DerelictGLFW3), which is not compatible with `@nogc`,  `nothrow`, or `-betterC`.

## Usage
By default, `bindbc-glfw` is configured to compile as a dynamic binding that is not `-betterC` compatible. The dynamic binding has no link-time dependency on the GLFW library, so the GLFW shared library must be manually loaded at runtime. When configured as a static binding, there is a link-time dependency on the GLFW library -- either the static library or the appropriate file for linking with shared libraries on your platform (see below).

When using DUB to manage your project, the static binding can be enabled via a DUB `subConfiguration` statement in your project's package file. `-betterC` compatibility is also enabled via subconfigurations.

To use GLFW, add `bindbc-glfw` as a dependency to your project's package config file. For example, the following is configured to GLFW as a dynamic binding that is not `-betterC` compatible:

__dub.json__
```
dependencies {
    "bindbc-glfw": "~>0.1.0",
}
```

__dub.sdl__
```
dependency "bindbc-glfw" version="~>0.1.0"
```

### The dynamic binding
The dynamic binding requires no special configuration when using DUB to manage your project. There is no link-time dependency. At runtime, the GLFW shared library is required to be on the shared library search path of the user's system. On Windows, this is typically handled by distributing the GLFW DLL with your program. On other systems, it usually means installing the GLFW runtime library through a package manager.

To load the shared library, you need to call the `loadGLFW` function. This returns a member of the `GLFWSupport` enumeration indicating that the library failed to load (it couldn't be found), one or more symbols failed to load, or a version number that matches a global `enum` value based on the compile-time configuration. (See [the README for `bindbc.loader`](https://github.com/BindBC/bindbc-loader/blob/master/README.md) for the error handling API.)

```d
import bindbc.glfw;

/*
This version attempts to load the GLFW shared library using well-known variations
of the library name for the host system.
*/
GLFWSupport ret = loadGLFW();
if(ret != glfwSupport) {

    // Handle error. For most use cases, its reasonable to use the the error handling API in
    // bindbc-loader to retrieve error messages and then abort. If necessary, it's  possible
    // to determine the root cause via the return value:

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
By default, the `bindbc-glfw` binding is configured to compile a binding to GLFW 3.0. This ensures the widest level of compatibility at runtime. This behavior can be overridden via the `-version` compiler switch or the `versions` DUB directive.

It is recommended that you always select the minimum version you require _and no higher_. In this example, the GLFW dynamic binding is compiled to support GLFW 3.1.

__dub.json__
```
"dependencies": {
    "bindbc-glfw": "~>0.1.0"
},
"versions": ["GLFW_31"]
```

__dub.sdl__
```
dependency "bindbc-glfw" version="~>0.1.0"
versions "GLFW_31"
```

With this example configuration, `glfwSupport == GLFWSupport.glfw31`. If GLFW 3.1 or later is installed on the user's system, `loadGLFW` will return `GLFWSupport.glfw31`. If only GLFW 3.0 is installed, `loadGLFW` will return `GLFWSupport.badLibrary`, meaning only GLFW 3.0 was loaded. In this case, it's still possible to call GLFW 3.0 functions, but any calls to GLFW 3.1 functions will result in a null pointer access. For this reason, it's recommended to required the version of the library you configured at compile time.

No matter which version was configured, the successfully loaded version can be obtained via a call to `loadedGLFWVersion`. The function `isGLFWLoaded` returns `true` if any version of GLFW was successfully loaded and `false` otherwise.

Following are the supported versions of GLFW and the corresponding version IDs to pass to the compiler.

| Library & Version  | Version ID       |
|--------------------|------------------|
|GLFW 3.0            | Default          |
|GLFW 3.1            | GLFW_31          |
|GLFW 3.2            | GLFW_32          |

## The static binding
The static binding has a link-time dependency on either the shared or static libraries for GLFW. On Windows, you can link with the static library or, to use the shared library (`glfw3.dll`), with the import library. On other systems, you can link with either the static library or directly with the shared library.

This requires the GLFW development package be installed on your system at compile time. When linking with the static library, there is no runtime dependency on GLFW. When linking with the shared library (or the import library on Windows), the runtime dependency is the same as the dynamic binding, the difference being that the shared library is no longer loaded manually -- loading is handled automatically by the system when the program is launched.

Enabling the static binding can be done in two ways.

### Via the compiler's `-version` switch or DUB's `versions` directive
Pass the `BindGLFW_Static` version to the compiler and link with the appropriate library. Note that `BindGLFW_Static` will also enable the static binding for any satellite libraries used.

When using the compiler command line or a build system that doesn't support DUB, this is the only option. The `-version=BindGLFW_Static` option should be passed to the compiler when building your program. All of the required C libraries, as well as the `bindbc-glfw` and `bindbc-loader` static libraries must also be passed to the compiler on the command line or via your build system's configuration.

When using DUB, its `versions` directive is an option. For example, when using the static binding:

__dub.json__
```
"dependencies": {
    "bindbc-glfw": "~>0.1.0"
},
"versions": ["BindGLFW_Static"],
"libs": ["glfw3"]
```

__dub.sdl__
```
dependency "bindbc-glfw" version="~>0.1.0"
versions "BindGLFW_Static"
libs "glfw3"
```

### Via DUB subconfigurations
Instead of using DUB's `versions` directive, a `subConfiguration` can be used. Enable the `static` subconfiguration for the `bindbc-glfw` dependency:

__dub.json__
```
"dependencies": {
    "bindbc-glfw": "~>0.1.0"
},
"subConfigurations": {
    "bindbc-glfw": "static"
},
"libs": ["glfw3"]
```

__dub.sdl__
```
dependency "bindbc-glfw" version="~>0.1.0"
subConfiguration "bindbc-glfw" "static"
libs "glfw3"
```

This has the benefit that it completely excludes from the build any source modules related to the dynamic binding, i.e. they will never be passed to the compiler.

## `betterC` support

`betterC` support is enabled via the `dynamicBC` and `staticBC` subconfigurations, for dynamic and static bindings respectively. To enable the static binding with `-betterC` support:

__dub.json__
```
"dependencies": {
    "bindbc-glfw": "~>0.1.0"
},
"subConfigurations": {
    "bindbc-glfw": "staticBC"
},
"libs": ["glfw3"]
```

__dub.sdl__
```
dependency "bindbc-glfw" version="~>0.1.0"
subConfiguration "bindbc-glfw" "staticBC"
libs "glfw3"
```

When not using DUB to manage your project, first use DUB to compile the BindBC libraries with the `dynamicBC` or `staticBC` configuration, then pass `-betterC` to the compiler when building your project.