# bindbc-glfw
This project provides both static and dynamic bindings to the [GLFW library](http://www.glfw.org/index.html). They are `@nogc` and `nothrow` compatible can be compiled with compatibility with BetterC. This package is intended as a replacement of [DerelictGLFW3](https://github.com/DerelictOrg/DerelictGLFW3), which is not compatible with `@nogc`,  `nothrow`, or BetterC.

## Usage
By default, `bindbc-glfw` is configured to compile as a dynamic binding that is not BetterC compatible. The dynamic binding has no link-time dependency on the GLFW library, so the GLFW shared library must be manually loaded at runtime. When configured as a static binding, there is a link-time dependency on the GLFW library -- either the static library or the appropriate file for linking with shared libraries on your platform (see below).

When using DUB to manage your project, the static binding can be enabled via a DUB `subConfiguration` statement in your project's package file. BetterC compatibility is also enabled via subconfigurations.

To use GLFW, add `bindbc-glfw` as a dependency to your project's package config file. For example, the following is configured to GLFW as a dynamic binding that is not BetterC compatible:

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

To load the shared libary, you need to call the `loadGLFW` function.

```d
import bindbc.glfw;

/*
This version attempts to load the GLFW shared library using well-known variations
of the library name for the host system.
*/
if(!loadGLFW()) {
    // handle error;
}
/*
This version attempts to load the GLFW library using a user-supplied file name. 
Usually, the name and/or path used will be platform specific, as in this example
which attempts to load `glfw3.dll` from the `libs` subdirectory, relative
to the executable, only on Windows.
*/
// version(Windows) loadSDL("libs/glfw3.dll")
```

Note that `loadGLFW` will return `false` only if the shared library is not found. If any of the functions in the library fail to load, the function **will still return true**. It's possible for the binding to be compiled for a higher version of a shared library than the version on the user's system, in which case it's still safe to use the library if none of the missing functions are called. 

To determine if any of the symbols failed to load, which usually indicates a version mismatch, use the error handling functions from the [`bindbc-loader`](https://github.com/BindBC/bindbc-loader) package.

## The static binding
The static binding has a link-time dependency on either the shared or static libraries for GLFW. On Windows, you can link with the static library or, to use the shared library (`glfw3.dll`), with the import library. On other systems, you can link with either the static library or directly with the shared library. 

This requires the GLFW development package be installed on your system at compile time. When linking with the static library, there is no runtime dependency on GLFW. When linking with the shared library (or the import library on Windows), the runtime dependency is the same as the dynamic binding, the difference being that the shared library is no longer loaded manually -- loading is handled automatically by the system when the program is launched.

Enabling the static binding can be done in two ways.

### Via the compiler's `-version` switch or DUB's `versions` directive
Pass the `BindGLFW_Static` version to the compiler and link with the appropriate library. Note that `BindGLFW_Static` will also enable the static binding for any satellite libraries used.

When using the compiler command line or a build system that doesn't support DUB, this is the only option. The `-version=BindGLFW_Static` option should be passed to the compiler when building your program. All of the requried C libraries, as well as the `bindbc-glfw` and `bindbc-loader` static libraries must also be passed to the compiler on the command line or via your build system's configuration. 

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

## BetterC support

BetterC support is enabled via the `dynamicBC` and `staticBC` subconfigurations, for dynamic and static bindings respectively. To enable the static binding with BetterC support:

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

## The minimum required GLFW version
By default, the `bindbc-glfw` binding is configured to compile a binding to the lowest supported version of the C library. This ensures the widest level of compatibility at runtime. This behavior can be overridden via the `-version` compiler switch or the `versions` DUB directive. 

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

When you call `loadGLFW` with this example configuration, if GLFW 3.1 or later is installed on the user's system, the library will load without error. If only GLFW 3.0 is installed, `loadGLFW` will return true, but the error functions in `bindbc-loader` will indicate that some functions failed to load. This is why it is recommended to always specify the version you require if it is higher than the default. Then you can abort on error, e.g.:

```d
import loader = bindbc.loader;
import bindbc.glfw;
int main() {
    if(!loadGLFW() || loader.errorCount > 0) {
        // Either the installed version of GLFW is lower than
        // the program requires, or it's corrupt.
        return -1;
    }
}
```

Following are the supported versions of GLFW and the corresponding version IDs to pass to the compiler.

| Library & Version  | Version ID       |
|--------------------|------------------|
|GLFW 3.0            | Default          |
|GLFW 3.1            | GLFW_31          |
|GLFW 3.2            | GLFW_32          |