
//          Copyright Michael D. Parker 2018.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.glfw.binddynamic;

version(BindGLFW_Static) {}
else version = BindGLFW_Dynamic;

version(BindGLFW_Dynamic):

import bindbc.loader;
import bindbc.glfw.types;

extern(C) @nogc nothrow {
    alias pglfwInit = int function();
    alias pglfwTerminate = void function();
    alias pglfwGetVersion = void function(int*,int*,int*);
    alias pglfwGetVersionString = const(char)* function();
    alias pglfwSetErrorCallback = GLFWerrorfun function(GLFWerrorfun);
    alias pglfwGetMonitors = GLFWmonitor** function(int*);
    alias pglfwGetPrimaryMonitor = GLFWmonitor* function();
    alias pglfwGetMonitorPos = void function(GLFWmonitor*,int*,int*);
    alias pglfwGetMonitorPhysicalSize = void function(GLFWmonitor*,int*,int*);
    alias pglfwGetMonitorName = const(char)* function(GLFWmonitor*);
    alias pglfwSetMonitorCallback = GLFWmonitorfun function(GLFWmonitorfun);
    alias pglfwGetVideoModes = const(GLFWvidmode)* function(GLFWmonitor*,int*);
    alias pglfwGetVideoMode = const(GLFWvidmode)* function(GLFWmonitor*);
    alias pglfwSetGamma = void function(GLFWmonitor*,float);
    alias pglfwGetGammaRamp = const(GLFWgammaramp*) function(GLFWmonitor*);
    alias pglfwSetGammaRamp = void function(GLFWmonitor*,const(GLFWgammaramp)*);
    alias pglfwDefaultWindowHints = void function();
    alias pglfwWindowHint = void function(int,int);
    alias pglfwCreateWindow = GLFWwindow* function(int,int,const(char)*,GLFWmonitor*,GLFWwindow*);
    alias pglfwDestroyWindow = void function(GLFWwindow*);
    alias pglfwWindowShouldClose = int function(GLFWwindow*);
    alias pglfwSetWindowShouldClose = void function(GLFWwindow*,int);
    alias pglfwSetWindowTitle = void function(GLFWwindow*,const(char)*);
    alias pglfwGetWindowPos = void function(GLFWwindow*,int*,int*);
    alias pglfwSetWindowPos = void function(GLFWwindow*,int,int);
    alias pglfwGetWindowSize = void function(GLFWwindow*,int*,int*);
    alias pglfwSetWindowSize = void function(GLFWwindow*,int,int);
    alias pglfwGetFramebufferSize = void function(GLFWwindow*,int*,int*);
    alias pglfwIconifyWindow = void function(GLFWwindow*);
    alias pglfwRestoreWindow = void function(GLFWwindow*);
    alias pglfwShowWindow = void function(GLFWwindow*);
    alias pglfwHideWindow = void function(GLFWwindow*);
    alias pglfwGetWindowMonitor = GLFWmonitor* function(GLFWwindow*);
    alias pglfwGetWindowAttrib = int function(GLFWwindow*,int);
    alias pglfwSetWindowUserPointer = void function(GLFWwindow*,void*);
    alias pglfwGetWindowUserPointer = void* function(GLFWwindow*);
    alias pglfwSetWindowPosCallback = GLFWwindowposfun function(GLFWwindow*,GLFWwindowposfun);
    alias pglfwSetWindowSizeCallback = GLFWwindowsizefun function(GLFWwindow*,GLFWwindowsizefun);
    alias pglfwSetWindowCloseCallback = GLFWwindowclosefun function(GLFWwindow*,GLFWwindowclosefun);
    alias pglfwSetWindowRefreshCallback = GLFWwindowrefreshfun function(GLFWwindow*,GLFWwindowrefreshfun);
    alias pglfwSetWindowFocusCallback = GLFWwindowfocusfun function(GLFWwindow*,GLFWwindowfocusfun);
    alias pglfwSetWindowIconifyCallback = GLFWwindowiconifyfun function(GLFWwindow*,GLFWwindowiconifyfun);
    alias pglfwSetFramebufferSizeCallback = GLFWframebuffersizefun function(GLFWwindow*,GLFWframebuffersizefun);
    alias pglfwPollEvents = void function();
    alias pglfwWaitEvents = void function();
    alias pglfwGetInputMode = int function(GLFWwindow*,int);
    alias pglfwSetInputMode = void function(GLFWwindow*,int,int);
    alias pglfwGetKey = int function(GLFWwindow*,int);
    alias pglfwGetMouseButton = int function(GLFWwindow*,int);
    alias pglfwGetCursorPos = void function(GLFWwindow*,double*,double*);
    alias pglfwSetCursorPos = void function(GLFWwindow*,double,double);
    alias pglfwSetKeyCallback = GLFWkeyfun function(GLFWwindow*,GLFWkeyfun);
    alias pglfwSetCharCallback = GLFWcharfun function(GLFWwindow*,GLFWcharfun);
    alias pglfwSetMouseButtonCallback = GLFWmousebuttonfun function(GLFWwindow*,GLFWmousebuttonfun);
    alias pglfwSetCursorPosCallback = GLFWcursorposfun function(GLFWwindow*,GLFWcursorposfun);
    alias pglfwSetCursorEnterCallback = GLFWcursorenterfun function(GLFWwindow*,GLFWcursorenterfun);
    alias pglfwSetScrollCallback = GLFWscrollfun function(GLFWwindow*,GLFWscrollfun);
    alias pglfwJoystickPresent = int function(int);
    alias pglfwGetJoystickAxes = float* function(int,int*);
    alias pglfwGetJoystickButtons = ubyte* function(int,int*);
    alias pglfwGetJoystickName = const(char)* function(int);
    alias pglfwSetClipboardString = void function(GLFWwindow*,const(char)*);
    alias pglfwGetClipboardString = const(char)* function(GLFWwindow*);
    alias pglfwGetTime = double function();
    alias pglfwSetTime = void function(double);
    alias pglfwMakeContextCurrent = void function(GLFWwindow*);
    alias pglfwGetCurrentContext = GLFWwindow* function();
    alias pglfwSwapBuffers = void function(GLFWwindow*);
    alias pglfwSwapInterval = void function(int);
    alias pglfwExtensionSupported = int function(const(char)*);
    alias pglfwGetProcAddress = GLFWglproc function(const(char)*);

    static if(glfwSupport >= GLFWSupport.glfw31) {
        alias pglfwGetWindowFrameSize = void function(GLFWwindow*,int*,int*,int*,int*);
        alias pglfwPostEmptyEvent = void function();
        alias pglfwCreateCursor = GLFWcursor* function(const(GLFWimage)*,int,int);
        alias pglfwCreateStandardCursor = GLFWcursor* function(int);
        alias pglfwDestroyCursor = void function(GLFWcursor*);
        alias pglfwSetCursor = void function(GLFWwindow*,GLFWcursor*);
        alias pglfwSetCharModsCallback = GLFWcharmodsfun function(GLFWwindow*,GLFWcharmodsfun);
        alias pglfwSetDropCallback = GLFWdropfun function(GLFWwindow*,GLFWdropfun);
    }

    static if(glfwSupport >= GLFWSupport.glfw32) {
        alias pglfwSetWindowIcon = void function(GLFWwindow*,int,const(GLFWimage)*);
        alias pglfwSetWindowSizeLimits = void function(GLFWwindow*,int,int,int,int);
        alias pglfwSetWindowAspectRatio = void function(GLFWwindow*,int,int);
        alias pglfwMaximizeWindow = void function(GLFWwindow*);
        alias pglfwFocusWindow = void function(GLFWwindow*);
        alias pglfwSetWindowMonitor = void function(GLFWwindow*,GLFWmonitor*,int,int,int,int,int);
        alias pglfwWaitEventsTimeout = void function(double);
        alias pglfwGetKeyName = const(char)* function(int,int);
        alias pglfwGetTimerValue = long function();
        alias pglfwGetTimerFrequency = long function();
        alias pglfwVulkanSupported = int function();
        alias pglfwSetJoystickCallback = GLFWjoystickfun function(GLFWjoystickfun);
    }

    static if(glfwSupport >= GLFWSupport.glfw33) {
        alias pglfwInitHint = void function(int,int);
        alias pglfwGetError = int function(const(char)**);
        alias pglfwGetMonitorWorkarea = void function(GLFWmonitor*,int*,int*,int*,int*);
        alias pglfwGetMonitorContentScale = void function(GLFWmonitor*,float*,float*);
        alias pglfwSetMonitorUserPointer = void function(GLFWmonitor*r,void*);
        alias pglfwGetMonitorUserPointer = void* function(GLFWmonitor*);
        alias pglfwWindowHintString = void function(int,const(char)*);
        alias pglfwGetWindowContentScale = void function(GLFWwindow*,float*,float*);
        alias pglfwGetWindowOpacity = float function(GLFWwindow*);
        alias pglfwSetWindowOpacity = void function(GLFWwindow*,float);
        alias pglfwRequestWindowAttention = void function(GLFWwindow*);
        alias pglfwSetWindowAttrib = void function(GLFWwindow*,int,int);
        alias pglfwSetWindowMaximizeCallback = GLFWwindowmaximizefun function(GLFWwindow*,GLFWwindowmaximizefun);
        alias pglfwSetWindowContentScaleCallback = GLFWwindowcontentscalefun function(GLFWwindow*,GLFWwindowcontentscalefun);
        alias pglfwGetKeyScancode = int function(int);
        alias pglfwGetJoystickHats = const(ubyte)* function(int,int*);
        alias pglfwGetJoystickGUID = const(char)* function(int);
        alias pglfwSetJoystickUserPointer = void function(int,void*);
        alias pglfwGetJoystickUserPointer = void* function(int);
        alias pglfwJoystickIsGamepad = int function(int);
        alias pglfwUpdateGamepadMappings = int function(const(char)*);
        alias pglfwGetGamepadName = const(char)* function(int);
        alias pglfwGetGamepadState = int function(int,GLFWgamepadstate*);
    }
}

 __gshared {
    pglfwInit glfwInit;
    pglfwTerminate glfwTerminate;
    pglfwGetVersion glfwGetVersion;
    pglfwGetVersionString glfwGetVersionString;
    pglfwSetErrorCallback glfwSetErrorCallback;
    pglfwGetMonitors glfwGetMonitors;
    pglfwGetPrimaryMonitor glfwGetPrimaryMonitor;
    pglfwGetMonitorPos glfwGetMonitorPos;
    pglfwGetMonitorPhysicalSize glfwGetMonitorPhysicalSize;
    pglfwGetMonitorName glfwGetMonitorName;
    pglfwSetMonitorCallback glfwSetMonitorCallback;
    pglfwGetVideoModes glfwGetVideoModes;
    pglfwGetVideoMode glfwGetVideoMode;
    pglfwSetGamma glfwSetGamma;
    pglfwGetGammaRamp glfwGetGammaRamp;
    pglfwSetGammaRamp glfwSetGammaRamp;
    pglfwDefaultWindowHints glfwDefaultWindowHints;
    pglfwWindowHint glfwWindowHint;
    pglfwCreateWindow glfwCreateWindow;
    pglfwDestroyWindow glfwDestroyWindow;
    pglfwWindowShouldClose glfwWindowShouldClose;
    pglfwSetWindowShouldClose glfwSetWindowShouldClose;
    pglfwSetWindowTitle glfwSetWindowTitle;
    pglfwGetWindowPos glfwGetWindowPos;
    pglfwSetWindowPos glfwSetWindowPos;
    pglfwGetWindowSize glfwGetWindowSize;
    pglfwSetWindowSize glfwSetWindowSize;
    pglfwGetFramebufferSize glfwGetFramebufferSize;
    pglfwIconifyWindow glfwIconifyWindow;
    pglfwRestoreWindow glfwRestoreWindow;
    pglfwShowWindow glfwShowWindow;
    pglfwHideWindow glfwHideWindow;
    pglfwGetWindowMonitor glfwGetWindowMonitor;
    pglfwGetWindowAttrib glfwGetWindowAttrib;
    pglfwSetWindowUserPointer glfwSetWindowUserPointer;
    pglfwGetWindowUserPointer glfwGetWindowUserPointer;
    pglfwSetWindowPosCallback glfwSetWindowPosCallback;
    pglfwSetWindowSizeCallback glfwSetWindowSizeCallback;
    pglfwSetWindowCloseCallback glfwSetWindowCloseCallback;
    pglfwSetWindowRefreshCallback glfwSetWindowRefreshCallback;
    pglfwSetWindowFocusCallback glfwSetWindowFocusCallback;
    pglfwSetWindowIconifyCallback glfwSetWindowIconifyCallback;
    pglfwSetFramebufferSizeCallback glfwSetFramebufferSizeCallback;
    pglfwPollEvents glfwPollEvents;
    pglfwWaitEvents glfwWaitEvents;
    pglfwGetInputMode glfwGetInputMode;
    pglfwSetInputMode glfwSetInputMode;
    pglfwGetKey glfwGetKey;
    pglfwGetMouseButton glfwGetMouseButton;
    pglfwGetCursorPos glfwGetCursorPos;
    pglfwSetCursorPos glfwSetCursorPos;
    pglfwSetKeyCallback glfwSetKeyCallback;
    pglfwSetCharCallback glfwSetCharCallback;
    pglfwSetMouseButtonCallback glfwSetMouseButtonCallback;
    pglfwSetCursorPosCallback glfwSetCursorPosCallback;
    pglfwSetCursorEnterCallback glfwSetCursorEnterCallback;
    pglfwSetScrollCallback glfwSetScrollCallback;
    pglfwJoystickPresent glfwJoystickPresent;
    pglfwGetJoystickAxes glfwGetJoystickAxes;
    pglfwGetJoystickButtons glfwGetJoystickButtons;
    pglfwGetJoystickName glfwGetJoystickName;
    pglfwSetClipboardString glfwSetClipboardString;
    pglfwGetClipboardString glfwGetClipboardString;
    pglfwGetTime glfwGetTime;
    pglfwSetTime glfwSetTime;
    pglfwMakeContextCurrent glfwMakeContextCurrent;
    pglfwGetCurrentContext glfwGetCurrentContext;
    pglfwSwapBuffers glfwSwapBuffers;
    pglfwSwapInterval glfwSwapInterval;
    pglfwExtensionSupported glfwExtensionSupported;
    pglfwGetProcAddress glfwGetProcAddress;

    static if(glfwSupport >= GLFWSupport.glfw31) {
        pglfwGetWindowFrameSize glfwGetWindowFrameSize;
        pglfwPostEmptyEvent glfwPostEmptyEvent;
        pglfwCreateCursor glfwCreateCursor;
        pglfwCreateStandardCursor glfwCreateStandardCursor;
        pglfwDestroyCursor glfwDestroyCursor;
        pglfwSetCursor glfwSetCursor;
        pglfwSetCharModsCallback glfwSetCharModsCallback;
        pglfwSetDropCallback glfwSetDropCallback;
    }

    static if(glfwSupport >= GLFWSupport.glfw32) {
        pglfwSetWindowIcon glfwSetWindowIcon;
        pglfwSetWindowSizeLimits glfwSetWindowSizeLimits;
        pglfwSetWindowAspectRatio glfwSetWindowAspectRatio;
        pglfwMaximizeWindow glfwMaximizeWindow;
        pglfwFocusWindow glfwFocusWindow;
        pglfwSetWindowMonitor glfwSetWindowMonitor;
        pglfwWaitEventsTimeout glfwWaitEventsTimeout;
        pglfwGetKeyName glfwGetKeyName;
        pglfwGetTimerValue glfwGetTimerValue;
        pglfwGetTimerFrequency glfwGetTimerFrequency;
        pglfwVulkanSupported glfwVulkanSupported;
        pglfwSetJoystickCallback glfwSetJoystickCallback;
    }

    static if(glfwSupport >= GLFWSupport.glfw33) {
        pglfwInitHint glfwInitHint;
        pglfwGetError glfwGetError;
        pglfwGetMonitorWorkarea glfwGetMonitorWorkarea;
        pglfwGetMonitorContentScale glfwGetMonitorContentScale;
        pglfwSetMonitorUserPointer glfwSetMonitorUserPointer;
        pglfwGetMonitorUserPointer glfwGetMonitorUserPointer;
        pglfwWindowHintString glfwWindowHintString;
        pglfwGetWindowContentScale glfwGetWindowContentScale;
        pglfwGetWindowOpacity glfwGetWindowOpacity;
        pglfwSetWindowOpacity glfwSetWindowOpacity;
        pglfwRequestWindowAttention glfwRequestWindowAttention;
        pglfwSetWindowAttrib glfwSetWindowAttrib;
        pglfwSetWindowMaximizeCallback glfwSetWindowMaximizeCallback;
        pglfwSetWindowContentScaleCallback glfwSetWindowContentScaleCallback;
        pglfwGetKeyScancode glfwGetKeyScancode;
        pglfwGetJoystickHats glfwGetJoystickHats;
        pglfwGetJoystickGUID glfwGetJoystickGUID;
        pglfwSetJoystickUserPointer glfwSetJoystickUserPointer;
        pglfwGetJoystickUserPointer glfwGetJoystickUserPointer;
        pglfwJoystickIsGamepad glfwJoystickIsGamepad;
        pglfwUpdateGamepadMappings glfwUpdateGamepadMappings;
        pglfwGetGamepadName glfwGetGamepadName;
        pglfwGetGamepadState glfwGetGamepadState;
    }
}

private {
    SharedLib lib;
    GLFWSupport loadedVersion;
}

@nogc nothrow:

void unloadGLFW()
{
    if(lib != invalidHandle) {
        lib.unload();
    }
}

GLFWSupport loadedGLFWVersion() @safe
{
    return loadedVersion;
}

bool isGLFWLoaded() @safe
{
    return lib != invalidHandle;
}

GLFWSupport loadGLFW()
{
    version(Windows) {
        const(char)[][1] libNames = ["glfw3.dll"];
    }
    else version(OSX) {
        const(char)[][2] libNames = [
            "libglfw3.dylib",
            "libglfw.3.dylib"
        ];
    }
    else version(Posix) {
        const(char)[][4] libNames = [
            "libglfw3.so",
            "libglfw.so.3",
            "/usr/local/lib/libglfw3.so",
            "/usr/local/lib/libglfw.so.3"
        ];
    }
    else static assert(0, "bindbc-glfw is not yet supported on this platform.");

    GLFWSupport ret;
    foreach(name; libNames) {
        ret = loadGLFW(name.ptr);
        if(ret != GLFWSupport.noLibrary) break;
    }
    return ret;
}

GLFWSupport loadGLFW(const(char)* libName)
{
    lib = load(libName);
    if(lib == invalidHandle) {
        return GLFWSupport.noLibrary;
    }

    auto errCount = errorCount();
    loadedVersion = GLFWSupport.badLibrary;

    lib.bindSymbol(cast(void**)&glfwInit,"glfwInit");
    lib.bindSymbol(cast(void**)&glfwTerminate,"glfwTerminate");
    lib.bindSymbol(cast(void**)&glfwGetVersion,"glfwGetVersion");
    lib.bindSymbol(cast(void**)&glfwGetVersionString,"glfwGetVersionString");
    lib.bindSymbol(cast(void**)&glfwSetErrorCallback,"glfwSetErrorCallback");
    lib.bindSymbol(cast(void**)&glfwGetMonitors,"glfwGetMonitors");
    lib.bindSymbol(cast(void**)&glfwGetPrimaryMonitor,"glfwGetPrimaryMonitor");
    lib.bindSymbol(cast(void**)&glfwGetMonitorPos,"glfwGetMonitorPos");
    lib.bindSymbol(cast(void**)&glfwGetMonitorPhysicalSize,"glfwGetMonitorPhysicalSize");
    lib.bindSymbol(cast(void**)&glfwGetMonitorName,"glfwGetMonitorName");
    lib.bindSymbol(cast(void**)&glfwSetMonitorCallback,"glfwSetMonitorCallback");
    lib.bindSymbol(cast(void**)&glfwGetVideoModes,"glfwGetVideoModes");
    lib.bindSymbol(cast(void**)&glfwGetVideoMode,"glfwGetVideoMode");
    lib.bindSymbol(cast(void**)&glfwSetGamma,"glfwSetGamma");
    lib.bindSymbol(cast(void**)&glfwGetGammaRamp,"glfwGetGammaRamp");
    lib.bindSymbol(cast(void**)&glfwSetGammaRamp,"glfwSetGammaRamp");
    lib.bindSymbol(cast(void**)&glfwDefaultWindowHints,"glfwDefaultWindowHints");
    lib.bindSymbol(cast(void**)&glfwWindowHint,"glfwWindowHint");
    lib.bindSymbol(cast(void**)&glfwCreateWindow,"glfwCreateWindow");
    lib.bindSymbol(cast(void**)&glfwDestroyWindow,"glfwDestroyWindow");
    lib.bindSymbol(cast(void**)&glfwWindowShouldClose,"glfwWindowShouldClose");
    lib.bindSymbol(cast(void**)&glfwSetWindowShouldClose,"glfwSetWindowShouldClose");
    lib.bindSymbol(cast(void**)&glfwSetWindowTitle,"glfwSetWindowTitle");
    lib.bindSymbol(cast(void**)&glfwGetWindowPos,"glfwGetWindowPos");
    lib.bindSymbol(cast(void**)&glfwSetWindowPos,"glfwSetWindowPos");
    lib.bindSymbol(cast(void**)&glfwGetWindowSize,"glfwGetWindowSize");
    lib.bindSymbol(cast(void**)&glfwSetWindowSize,"glfwSetWindowSize");
    lib.bindSymbol(cast(void**)&glfwGetFramebufferSize,"glfwGetFramebufferSize");
    lib.bindSymbol(cast(void**)&glfwIconifyWindow,"glfwIconifyWindow");
    lib.bindSymbol(cast(void**)&glfwRestoreWindow,"glfwRestoreWindow");
    lib.bindSymbol(cast(void**)&glfwShowWindow,"glfwShowWindow");
    lib.bindSymbol(cast(void**)&glfwHideWindow,"glfwHideWindow");
    lib.bindSymbol(cast(void**)&glfwGetWindowMonitor,"glfwGetWindowMonitor");
    lib.bindSymbol(cast(void**)&glfwGetWindowAttrib,"glfwGetWindowAttrib");
    lib.bindSymbol(cast(void**)&glfwSetWindowUserPointer,"glfwSetWindowUserPointer");
    lib.bindSymbol(cast(void**)&glfwGetWindowUserPointer,"glfwGetWindowUserPointer");
    lib.bindSymbol(cast(void**)&glfwSetWindowPosCallback,"glfwSetWindowPosCallback");
    lib.bindSymbol(cast(void**)&glfwSetWindowSizeCallback,"glfwSetWindowSizeCallback");
    lib.bindSymbol(cast(void**)&glfwSetWindowCloseCallback,"glfwSetWindowCloseCallback");
    lib.bindSymbol(cast(void**)&glfwSetWindowRefreshCallback,"glfwSetWindowRefreshCallback");
    lib.bindSymbol(cast(void**)&glfwSetWindowFocusCallback,"glfwSetWindowFocusCallback");
    lib.bindSymbol(cast(void**)&glfwSetWindowIconifyCallback,"glfwSetWindowIconifyCallback");
    lib.bindSymbol(cast(void**)&glfwSetFramebufferSizeCallback,"glfwSetFramebufferSizeCallback");
    lib.bindSymbol(cast(void**)&glfwPollEvents,"glfwPollEvents");
    lib.bindSymbol(cast(void**)&glfwWaitEvents,"glfwWaitEvents");
    lib.bindSymbol(cast(void**)&glfwGetInputMode,"glfwGetInputMode");
    lib.bindSymbol(cast(void**)&glfwSetInputMode,"glfwSetInputMode");
    lib.bindSymbol(cast(void**)&glfwGetKey,"glfwGetKey");
    lib.bindSymbol(cast(void**)&glfwGetMouseButton,"glfwGetMouseButton");
    lib.bindSymbol(cast(void**)&glfwGetCursorPos,"glfwGetCursorPos");
    lib.bindSymbol(cast(void**)&glfwSetCursorPos,"glfwSetCursorPos");
    lib.bindSymbol(cast(void**)&glfwSetKeyCallback,"glfwSetKeyCallback");
    lib.bindSymbol(cast(void**)&glfwSetCharCallback,"glfwSetCharCallback");
    lib.bindSymbol(cast(void**)&glfwSetMouseButtonCallback,"glfwSetMouseButtonCallback");
    lib.bindSymbol(cast(void**)&glfwSetCursorPosCallback,"glfwSetCursorPosCallback");
    lib.bindSymbol(cast(void**)&glfwSetScrollCallback,"glfwSetScrollCallback");
    lib.bindSymbol(cast(void**)&glfwSetCursorEnterCallback,"glfwSetCursorEnterCallback");
    lib.bindSymbol(cast(void**)&glfwJoystickPresent,"glfwJoystickPresent");
    lib.bindSymbol(cast(void**)&glfwGetJoystickAxes,"glfwGetJoystickAxes");
    lib.bindSymbol(cast(void**)&glfwGetJoystickButtons,"glfwGetJoystickButtons");
    lib.bindSymbol(cast(void**)&glfwGetJoystickName,"glfwGetJoystickName");
    lib.bindSymbol(cast(void**)&glfwSetClipboardString,"glfwSetClipboardString");
    lib.bindSymbol(cast(void**)&glfwGetClipboardString,"glfwGetClipboardString");
    lib.bindSymbol(cast(void**)&glfwGetTime,"glfwGetTime");
    lib.bindSymbol(cast(void**)&glfwSetTime,"glfwSetTime");
    lib.bindSymbol(cast(void**)&glfwMakeContextCurrent,"glfwMakeContextCurrent");
    lib.bindSymbol(cast(void**)&glfwGetCurrentContext,"glfwGetCurrentContext");
    lib.bindSymbol(cast(void**)&glfwSwapBuffers,"glfwSwapBuffers");
    lib.bindSymbol(cast(void**)&glfwSwapInterval,"glfwSwapInterval");
    lib.bindSymbol(cast(void**)&glfwExtensionSupported,"glfwExtensionSupported");
    lib.bindSymbol(cast(void**)&glfwGetProcAddress,"glfwGetProcAddress");

    if(errorCount() != errCount) return GLFWSupport.badLibrary;
    else loadedVersion = GLFWSupport.glfw30;

    static if(glfwSupport >= GLFWSupport.glfw31) {
        lib.bindSymbol(cast(void**)&glfwGetWindowFrameSize,"glfwGetWindowFrameSize");
        lib.bindSymbol(cast(void**)&glfwPostEmptyEvent,"glfwPostEmptyEvent");
        lib.bindSymbol(cast(void**)&glfwCreateCursor,"glfwCreateCursor");
        lib.bindSymbol(cast(void**)&glfwCreateStandardCursor,"glfwCreateStandardCursor");
        lib.bindSymbol(cast(void**)&glfwDestroyCursor,"glfwDestroyCursor");
        lib.bindSymbol(cast(void**)&glfwSetCursor,"glfwSetCursor");
        lib.bindSymbol(cast(void**)&glfwSetCharModsCallback,"glfwSetCharModsCallback");
        lib.bindSymbol(cast(void**)&glfwSetDropCallback,"glfwSetDropCallback");

        if(errorCount() != errCount) return GLFWSupport.badLibrary;
        else loadedVersion = GLFWSupport.glfw31;
    }

    static if(glfwSupport >= GLFWSupport.glfw32) {
        lib.bindSymbol(cast(void**)&glfwSetWindowIcon, "glfwSetWindowIcon");
        lib.bindSymbol(cast(void**)&glfwSetWindowSizeLimits, "glfwSetWindowSizeLimits");
        lib.bindSymbol(cast(void**)&glfwSetWindowAspectRatio, "glfwSetWindowAspectRatio");
        lib.bindSymbol(cast(void**)&glfwMaximizeWindow, "glfwMaximizeWindow");
        lib.bindSymbol(cast(void**)&glfwFocusWindow, "glfwFocusWindow");
        lib.bindSymbol(cast(void**)&glfwSetWindowMonitor, "glfwSetWindowMonitor");
        lib.bindSymbol(cast(void**)&glfwWaitEventsTimeout, "glfwWaitEventsTimeout");
        lib.bindSymbol(cast(void**)&glfwGetKeyName, "glfwGetKeyName");
        lib.bindSymbol(cast(void**)&glfwGetTimerValue, "glfwGetTimerValue");
        lib.bindSymbol(cast(void**)&glfwGetTimerFrequency, "glfwGetTimerFrequency");
        lib.bindSymbol(cast(void**)&glfwVulkanSupported, "glfwVulkanSupported");
        lib.bindSymbol(cast(void**)&glfwSetJoystickCallback, "glfwSetJoystickCallback");

        if(errorCount() != errCount) return GLFWSupport.badLibrary;
        else loadedVersion = GLFWSupport.glfw32;
    }

    static if(glfwSupport == GLFWSupport.glfw33) {
        lib.bindSymbol(cast(void**)&glfwInitHint, "glfwInitHint");
        lib.bindSymbol(cast(void**)&glfwGetError, "glfwGetError");
        lib.bindSymbol(cast(void**)&glfwGetMonitorWorkarea, "glfwGetMonitorWorkarea");
        lib.bindSymbol(cast(void**)&glfwGetMonitorContentScale, "glfwGetMonitorContentScale");
        lib.bindSymbol(cast(void**)&glfwSetMonitorUserPointer, "glfwSetMonitorUserPointer");
        lib.bindSymbol(cast(void**)&glfwGetMonitorUserPointer, "glfwGetMonitorUserPointer");
        lib.bindSymbol(cast(void**)&glfwWindowHintString, "glfwWindowHintString");
        lib.bindSymbol(cast(void**)&glfwGetWindowContentScale, "glfwGetWindowContentScale");
        lib.bindSymbol(cast(void**)&glfwGetWindowOpacity, "glfwGetWindowOpacity");
        lib.bindSymbol(cast(void**)&glfwSetWindowOpacity, "glfwSetWindowOpacity");
        lib.bindSymbol(cast(void**)&glfwRequestWindowAttention, "glfwRequestWindowAttention");
        lib.bindSymbol(cast(void**)&glfwSetWindowAttrib, "glfwSetWindowAttrib");
        lib.bindSymbol(cast(void**)&glfwSetWindowMaximizeCallback, "glfwSetWindowMaximizeCallback");
        lib.bindSymbol(cast(void**)&glfwSetWindowContentScaleCallback, "glfwSetWindowContentScaleCallback");
        lib.bindSymbol(cast(void**)&glfwGetKeyScancode, "glfwGetKeyScancode");
        lib.bindSymbol(cast(void**)&glfwGetJoystickHats, "glfwGetJoystickHats");
        lib.bindSymbol(cast(void**)&glfwGetJoystickGUID, "glfwGetJoystickGUID");
        lib.bindSymbol(cast(void**)&glfwSetJoystickUserPointer, "glfwSetJoystickUserPointer");
        lib.bindSymbol(cast(void**)&glfwGetJoystickUserPointer, "glfwGetJoystickUserPointer");
        lib.bindSymbol(cast(void**)&glfwJoystickIsGamepad, "glfwJoystickIsGamepad");
        lib.bindSymbol(cast(void**)&glfwUpdateGamepadMappings, "glfwUpdateGamepadMappings");
        lib.bindSymbol(cast(void**)&glfwGetGamepadName, "glfwGetGamepadName");
        lib.bindSymbol(cast(void**)&glfwGetGamepadState, "glfwGetGamepadState");

        if(errorCount() != errCount) return GLFWSupport.badLibrary;
        else loadedVersion = GLFWSupport.glfw33;
    }

    return loadedVersion;
}

/*
    The following allow binding to Vulkan and native system functions using
    types declared in any Vulkan or system binding, e.g.:

    ```d
    module myglfw;
    public import bindbc.glfw;
    mixin(glfwVulkanBind);
    ===============
    module myapp;
    import myglfw;
    void load() {
        if(!loadGLFW()) {
            throw new Exception("Failed to load GLFW");
        }
        loadGLFW_Vulkan();
    }
   ```
*/
static if(glfwSupport >= GLFWSupport.glfw32) {
    enum bindGLFW_Vulkan = q{
        extern(C) @nogc nothrow {
            alias pglfwGetRequiredInstanceExtensions = const(char)** function(uint*);
            alias pglfwGetInstanceProcAddress = GLFWvkproc function(VkInstance,const(char)*);
            alias pglfwGetPhysicalDevicePresentationSupport = int function(VkInstance,VkPhysicalDevice,uint);
            alias pglfwCreateWindowSurface = VkResult function(VkInstance,GLFWwindow*,const(VkAllocationCallbacks)*,VkSurfaceKHR*);
        }

        __gshared {
            pglfwGetRequiredInstanceExtensions glfwGetRequiredInstanceExtensions;
            pglfwGetInstanceProcAddress glfwGetInstanceProcAddress;
            pglfwGetPhysicalDevicePresentationSupport glfwGetPhysicalDevicePresentationSupport;
            pglfwCreateWindowSurface glfwCreateWindowSurface;
        }

        bool loadGLFW_Vulkan()
        {
            assert(lib != invalidHandle, "loadGLFW must be successfully called before loadGLFW_Vulkan");

            auto errCount = errorCount();
            lib.bindSymbol(cast(void**)&glfwGetRequiredInstanceExtensions, "glfwGetRequiredInstanceExtensions");
            lib.bindSymbol(cast(void**)&glfwGetInstanceProcAddress, "glfwGetInstanceProcAddress");
            lib.bindSymbol(cast(void**)&glfwGetPhysicalDevicePresentationSupport, "glfwGetPhysicalDevicePresentationSupport");
            lib.bindSymbol(cast(void**)&glfwCreateWindowSurface, "glfwCreateWindowSurface");
            return errorCount() == errCount;
        }
    };
}

enum bindGLFW_EGL= q{
    extern(C) @nogc nothrow {
        alias pglfwGetEGLDisplay = EGLDisplay function();
        alias pglfwGetEGLContext = EGLContext function(GLFWwindow*);
        alias pglfwGetEGLSurface = EGLSurface function(GLFWwindow*);
    }

    __gshared {
        pglfwGetEGLDisplay glfwGetEGLDisplay;
        pglfwGetEGLContext glfwGetEGLContext;
        pglfwGetEGLSurface glfwGetEGLSurface;
    }

    bool loadGLFW_EGL()
    {
        assert(lib != invalidHandle, "loadGLFW must be successfully called before loadGLFW_EGL");

        auto errCount = errorCount();
        lib.bindSymbol(cast(void**)&glfwGetEGLDisplay, "glfwGetEGLDisplay");
        lib.bindSymbol(cast(void**)&glfwGetEGLContext, "glfwGetEGLContext");
        lib.bindSymbol(cast(void**)&glfwGetEGLSurface,"glfwGetEGLSurface");
        return errorCount() == errCount;
    }
};

static if(bindWindows) {
    enum bindGLFW_WGL = q{
        extern(C) @nogc nothrow alias pglfwGetWGLContext = HGLRC function(GLFWwindow* window);
        __gshared pglfwGetWGLContext glfwGetWGLContext;
        void loadGLFW_NSGL() {
            assert(lib != invalidHandle, "loadGLFW must be successfully called before loadGLFW_WGL");
            lib.bindSymbol(cast(void**)&glfwGetWGLContext,"glfwGetWGLContext");
        }
    };
    static if(glfwSupport >= GLFWSupport.glfw31) {
        enum bindGLFW_Windows = q{
            extern(C) @nogc nothrow {
                alias pglfwGetWin32Adapter = const(char)* function(GLFWmonitor*);
                alias pglfwGetWin32Monitor = const(char)* function(GLFWmonitor*);
                alias pglfwGetWin32Window = HWND function(GLFWwindow* window);
            }

            __gshared {
                pglfwGetWin32Adapter glfwGetWin32Adapter;
                pglfwGetWin32Monitor glfwGetWin32Monitor;
                pglfwGetWin32Window glfwGetWin32Window;
            }

            bool loadGLFW_Windows()
            {
                assert(lib != invalidHandle, "loadGLFW must be successfully called before loadGLFW_Windows");

                auto errCount = errorCount();
                lib.bindSymbol(cast(void**)&glfwGetWin32Adapter, "glfwGetWin32Adapter");
                lib.bindSymbol(cast(void**)&glfwGetWin32Monitor, "glfwGetWin32Monitor");
                lib.bindSymbol(cast(void**)&glfwGetWin32Window,"glfwGetWin32Window");
                return errorCount() == errCount;
            }
        };
    }
    else {
        enum bindGLFW_Windows = q{
            extern(C) @nogc nothrow alias pglfwGetWin32Window = HWND function(GLFWwindow* window);
             __gshared pglfwGetWin32Window glfwGetWin32Window;
            bool loadGLFW_Windows() {
                assert(lib != invalidHandle, "loadGLFW must be successfully called before loadGLFW_Windows");

                auto errCount = errorCount();
                lib.bindSymbol(cast(void**)&glfwGetWin32Window,"glfwGetWin32Window");
                return errorCount() == errCount;
            }
        };
    }
}

else static if(bindMac) {
    enum bindGLFW_NSGL = q{
        extern(C) @nogc nothrow alias pglfwGetNSGLContext = id function(GLFWwindow*);
        __gshared pglfwGetNSGLContext glfwGetNSGLContext;

        bool loadGLFW_NSGL() {
            assert(lib != invalidHandle, "loadGLFW must be successfully called before loadGLFW_NSGL");

            auto errCount = errorCount();
            lib.bindSymbol(cast(void**)&glfwGetNSGLContext, "glfwGetNSGLContext");
            return errorCount() == errCount;
        }
    };

    static if(glfwSupport >= GLFWSupport.glfw31) {
        enum glfwCocoaBind = q{
            extern(C) @nogc nothrow {
                alias pglfwGetCocoaMonitor = CGDirectDisplayID function(GLFWmonitor*);
                alias pglfwGetCocoaWindow = id function(GLFWwindow* window);
            }

            __gshared {
                pglfwGetCocoaMonitor glfwGetCocoaMonitor;
                pglfwGetCocoaWindow glfwGetCocoaWindow;
            }

            bool loadGLFW_Cocoa() {
                assert(lib != invalidHandle, "loadGLFW must be successfully called before loadGLFW_Cocoa");

                auto errCount = errorCount();
                lib.bindSymbol(cast(void**)&glfwGetCocoaMonitor, "glfwGetCocoaMonitor");
                lib.bindSymbol(cast(void**)&glfwGetCocoaWindow,"glfwGetCocoaWindow");
                return errorCount() == errCount;
            }
        };
    }
    else {
        enum bindGLFW_Cocoa = q{
            extern(C) @nogc nothrow alias pglfwGetCocoaWindow = id function(GLFWwindow* window);
            __gshared pglfwGetCocoaWindow glfwGetCocoaWindow;

            bool loadGLFW_Cocoa() {
                assert(lib != invalidHandle, "loadGLFW must be successfully called before loadGLFW_Cocoa");

                auto errCount = errorCount();
                lib.bindSymbol(cast(void**)&glfwGetCocoaWindow,"glfwGetCocoaWindow");
                return errorCount() == errCount;
            }
        };
    }
}
else static if(bindPosix && !bindAndroid) {
    static if(glfwSupport >= GLFWSupport.glfw32) {
        enum bindGLFW_GLX = q{
            extern(C) @nogc nothrow {
                alias pglfwGetGLXContext = GLXContext function(GLFWwindow*);
                alias pglfwGetGLXWindow = GLXWindow function(GLFWwindow*);
            }

            __gshared {
                pglfwGetGLXContext glfwGetGLXContext;
                pglfwGetGLXWindow glfwGetGLXWindow;
            }

            bool loadGLFW_GLX() {
                assert(lib != invalidHandle, "loadGLFW must be successfully called before loadGLFW_GLX");

                auto errCount = errorCount();
                lib.bindSymbol(cast(void**)&glfwGetGLXContext, "glfwGetGLXContext");
                lib.bindSymbol(cast(void**)&glfwGetGLXWindow, "glfwGetGLXWindow");
                return errorCount() == errCount;
            }
        };
    }
    else {
        enum bindGLFW_GLX = q{
            extern(C) @nogc nothrow alias pglfwGetGLXContext = GLXContext function(GLFWwindow*);
            __gshared pglfwGetGLXContext glfwGetGLXContext;

            bool loadGLFW_GLX() {
                assert(lib != invalidHandle, "loadGLFW must be successfully called before loadGLFW_GLX");

                auto errCount = errorCount();
                lib.bindSymbol(cast(void**)&glfwGetGLXContext, "glfwGetGLXContext");
                return errorCount() == errCount;
            }
        };
    }
    static if(glfwSupport >= GLFWSupport.glfw33) {
        enum bindGLFW_X11= q{
            extern(C) @nogc nothrow {
                alias pglfwGetX11Display = Display* function();
                alias pglfwGetX11Window = Window function(GLFWwindow*);
                alias pglfwGetX11Adapter = RRCrtc function(GLFWmonitor*);
                alias pglfwGetX11Monitor = RROutput function(GLFWmonitor*);
                alias pglfwSetX11SelectionString = void function(const(char)*);
                alias pglfwGetX11SelectionString = const(char)* function();
            }

            __gshared {
                pglfwGetX11Display glfwGetX11Display;
                pglfwGetX11Window glfwGetX11Window;
                pglfwGetX11Adapter glfwGetX11Adapter;
                pglfwGetX11Monitor glfwGetX11Monitor;
                pglfwSetX11SelectionString glfwSetX11SelectionString;
                pglfwGetX11SelectionString glfwGetX11SelectionString;
            }

            bool loadGLFW_X11() {
                assert(lib != invalidHandle, "loadGLFW must be successfully called before loadGLFW_X11");

                auto errCount = errorCount();
                lib.bindSymbol(cast(void**)&glfwGetX11Display, "glfwGetX11Display");
                lib.bindSymbol(cast(void**)&glfwGetX11Window,"glfwGetX11Window");
                lib.bindSymbol(cast(void**)&glfwGetX11Adapter, "glfwGetX11Adapter");
                lib.bindSymbol(cast(void**)&glfwGetX11Monitor,"glfwGetX11Monitor");
                lib.bindSymbol(cast(void**)&glfwSetX11SelectionString,"glfwSetX11SelectionString");
                lib.bindSymbol(cast(void**)&glfwGetX11SelectionString,"glfwGetX11SelectionString");
                return errorCount() == errCount;
            }
        };
    }
    else static if(glfwSupport >= GLFWSupport.glfw31) {
        enum bindGLFW_X11= q{
            extern(C) @nogc nothrow {
                alias pglfwGetX11Display = Display* function();
                alias pglfwGetX11Window = Window function(GLFWwindow*);
                alias pglfwGetX11Adapter = RRCrtc function(GLFWmonitor*);
                alias pglfwGetX11Monitor = RROutput function(GLFWmonitor*);
            }

            __gshared {
                pglfwGetX11Display glfwGetX11Display;
                pglfwGetX11Window glfwGetX11Window;
                pglfwGetX11Adapter glfwGetX11Adapter;
                pglfwGetX11Monitor glfwGetX11Monitor;
            }

            bool loadGLFW_X11() {
                assert(lib != invalidHandle, "loadGLFW must be successfully called before loadGLFW_X11");

                auto errCount = errorCount();
                lib.bindSymbol(cast(void**)&glfwGetX11Display, "glfwGetX11Display");
                lib.bindSymbol(cast(void**)&glfwGetX11Window,"glfwGetX11Window");
                lib.bindSymbol(cast(void**)&glfwGetX11Adapter, "glfwGetX11Adapter");
                lib.bindSymbol(cast(void**)&glfwGetX11Monitor,"glfwGetX11Monitor");
                return errorCount() == errCount;
            }
        };
    }
    else {
        enum bindGLFW_X11 = q{
            extern(C) @nogc nothrow {
                alias pglfwGetX11Display = Display* function();
                alias pglfwGetX11Window = Window function(GLFWwindow*);
            }

            __gshared {
                pglfwGetX11Display glfwGetX11Display;
                pglfwGetX11Window glfwGetX11Window;
            }

            bool loadGLFW_X11() {
                assert(lib != invalidHandle, "loadGLFW must be successfully called before loadGLFW_X11");

                auto errCount = errorCount();
                lib.bindSymbol(cast(void**)&glfwGetX11Display, "glfwGetX11Display");
                lib.bindSymbol(cast(void**)&glfwGetX11Window,"glfwGetX11Window");
                return errorCount() == errCount;
            }
        };
    }

    static if(glfwSupport >= GLFWSupport.glfw32) {
        enum gbindGLFW_Wayland = q{
            extern(C) @nogc nothrow {
                alias pglfwGetWaylandDisplay = wl_display* function();
                alias pglfwGetWaylandMonitor = wl_output* function(GLFWmonitor*);
                alias pglfwGetWaylandWindow = wl_surface* function(GLFWwindow*);
            }
            __gshared {
                pglfwGetWaylandDisplay glfwGetWaylandDisplay;
                pglfwGetWaylandMonitor glfwGetWaylandMonitor;
                pglfwGetWaylandWindow glfwGetWaylandWindow;
            }

            bool loadGLFW_Wayland() {
                assert(lib != invalidHandle, "loadGLFW must be successfully called before loadGLFW_Wayland");

                auto errCount = errorCount();
                lib.bindSymbol(cast(void**)&glfwGetWaylandDisplay, "glfwGetWaylandDisplay");
                lib.bindSymbol(cast(void**)&glfwGetWaylandMonitor, "glfwGetWaylandMonitor");
                lib.bindSymbol(cast(void**)&glfwGetWaylandWindow,"glfwGetWaylandWindow");
                return errorCount() == errCount;
            }
        };
    }

    // Support for Mir was removed in GLFW 3.3
    static if(glfwSupport == GLFWSupport.glfw32) {
        enum bindGLFW_Mir = q{
            extern(C) @nogc nothrow {
                alias pglfwGetMirDisplay = MirConnection* function();
                alias pglfwGetMirMonitor = int function(GLFWmonitor*);
                alias pglfwGetMirWindow = MirSurface* function(GLFWwindow*);
            }

            __gshared {
                pglfwGetMirDisplay glfwGetMirDisplay;
                pglfwGetMirMonitor glfwGetMirMonitor;
                pglfwGetMirWindow glfwGetMirWindow;
            }

            bool loadGLFW_Mir() {
                assert(lib != invalidHandle, "loadGLFW must be successfully called before loadGLFW_Mir");

                auto errCount = errorCount();
                lib.bindSymbol(cast(void**)&glfwGetMirDisplay, "glfwGetMirDisplay");
                lib.bindSymbol(cast(void**)&glfwGetMirMonitor, "glfwGetMirMonitor");
                lib.bindSymbol(cast(void**)&glfwGetMirWindow,"glfwGetMirWindow");
                return errorCount() == errCount;
            }
        };
    }
}