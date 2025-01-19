/+
+            Copyright 2023 – 2025 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.glfw.binddynamic;

import bindbc.glfw.types;

static if(!staticBinding):

extern(C) @nogc nothrow{
	alias pglfwInit = int function();
	alias pglfwTerminate = void function();
	alias pglfwGetVersion = void function(int* major, int* minor, int* rev);
	alias pglfwGetVersionString = const(char)* function();
	alias pglfwSetErrorCallback = GLFWerrorfun function(GLFWerrorfun callback);
	alias pglfwGetMonitors = GLFWmonitor** function(int* count);
	alias pglfwGetPrimaryMonitor = GLFWmonitor* function();
	alias pglfwGetMonitorPos = void function(GLFWmonitor* monitor, int* xpos, int* ypos);
	alias pglfwGetMonitorPhysicalSize = void function(GLFWmonitor* monitor, int* widthMM, int* heightMM);
	alias pglfwGetMonitorName = const(char)* function(GLFWmonitor* monitor);
	alias pglfwSetMonitorCallback = GLFWmonitorfun function(GLFWmonitorfun callback);
	alias pglfwGetVideoModes = const(GLFWvidmode)* function(GLFWmonitor* monitor, int* count);
	alias pglfwGetVideoMode = const(GLFWvidmode)* function(GLFWmonitor* monitor);
	alias pglfwSetGamma = void function(GLFWmonitor* monitor, float gamma);
	alias pglfwGetGammaRamp = const(GLFWgammaramp*) function(GLFWmonitor* monitor);
	alias pglfwSetGammaRamp = void function(GLFWmonitor* monitor, const(GLFWgammaramp)* ramp);
	alias pglfwDefaultWindowHints = void function();
	alias pglfwWindowHint = void function(int hint, int value);
	alias pglfwCreateWindow = GLFWwindow* function(int width, int height, const(char)* title, GLFWmonitor* monitor, GLFWwindow* share);
	alias pglfwDestroyWindow = void function(GLFWwindow* window);
	alias pglfwWindowShouldClose = int function(GLFWwindow* window);
	alias pglfwSetWindowShouldClose = void function(GLFWwindow* window, int value);
	alias pglfwSetWindowTitle = void function(GLFWwindow* window, const(char)* title);
	alias pglfwGetWindowPos = void function(GLFWwindow* window, int* xpos, int* ypos);
	alias pglfwSetWindowPos = void function(GLFWwindow* window, int xpos, int ypos);
	alias pglfwGetWindowSize = void function(GLFWwindow* window, int* width, int* height);
	alias pglfwSetWindowSize = void function(GLFWwindow* window, int width, int height);
	alias pglfwGetFramebufferSize = void function(GLFWwindow* window, int* width, int* height);
	alias pglfwIconifyWindow = void function(GLFWwindow* window);
	alias pglfwRestoreWindow = void function(GLFWwindow* window);
	alias pglfwShowWindow = void function(GLFWwindow* window);
	alias pglfwHideWindow = void function(GLFWwindow* window);
	alias pglfwGetWindowMonitor = GLFWmonitor* function(GLFWwindow* window);
	alias pglfwGetWindowAttrib = int function(GLFWwindow* window, int attrib);
	alias pglfwSetWindowUserPointer = void function(GLFWwindow* window, void* pointer);
	alias pglfwGetWindowUserPointer = void* function(GLFWwindow* window);
	alias pglfwSetWindowPosCallback = GLFWwindowposfun function(GLFWwindow* window, GLFWwindowposfun callback);
	alias pglfwSetWindowSizeCallback = GLFWwindowsizefun function(GLFWwindow* window, GLFWwindowsizefun callback);
	alias pglfwSetWindowCloseCallback = GLFWwindowclosefun function(GLFWwindow* window, GLFWwindowclosefun callback);
	alias pglfwSetWindowRefreshCallback = GLFWwindowrefreshfun function(GLFWwindow* window, GLFWwindowrefreshfun callback);
	alias pglfwSetWindowFocusCallback = GLFWwindowfocusfun function(GLFWwindow* window, GLFWwindowfocusfun callback);
	alias pglfwSetWindowIconifyCallback = GLFWwindowiconifyfun function(GLFWwindow* window, GLFWwindowiconifyfun callback);
	alias pglfwSetFramebufferSizeCallback = GLFWframebuffersizefun function(GLFWwindow* window, GLFWframebuffersizefun callback);
	alias pglfwPollEvents = void function();
	alias pglfwWaitEvents = void function();
	alias pglfwGetInputMode = int function(GLFWwindow* window, int mode);
	alias pglfwSetInputMode = void function(GLFWwindow* window, int mode, int value);
	alias pglfwGetKey = int function(GLFWwindow* window, int key);
	alias pglfwGetMouseButton = int function(GLFWwindow* window, int button);
	alias pglfwGetCursorPos = void function(GLFWwindow* window, double* xpos, double* ypos);
	alias pglfwSetCursorPos = void function(GLFWwindow* window, double xpos, double ypos);
	alias pglfwSetKeyCallback = GLFWkeyfun function(GLFWwindow* window, GLFWkeyfun callback);
	alias pglfwSetCharCallback = GLFWcharfun function(GLFWwindow* window, GLFWcharfun callback);
	alias pglfwSetMouseButtonCallback = GLFWmousebuttonfun function(GLFWwindow* window, GLFWmousebuttonfun callback);
	alias pglfwSetCursorPosCallback = GLFWcursorposfun function(GLFWwindow* window, GLFWcursorposfun callback);
	alias pglfwSetCursorEnterCallback = GLFWcursorenterfun function(GLFWwindow* window, GLFWcursorenterfun callback);
	alias pglfwSetScrollCallback = GLFWscrollfun function(GLFWwindow* window, GLFWscrollfun callback);
	alias pglfwJoystickPresent = int function(int jid);
	alias pglfwGetJoystickAxes = float* function(int jid, int* count);
	alias pglfwGetJoystickButtons = ubyte* function(int jid, int* count);
	alias pglfwGetJoystickName = const(char)* function(int jid);
	alias pglfwSetClipboardString = void function(GLFWwindow*  window, const(char)* string_);
	alias pglfwGetClipboardString = const(char)* function(GLFWwindow* window);
	alias pglfwGetTime = double function();
	alias pglfwSetTime = void function(double time);
	alias pglfwMakeContextCurrent = void function(GLFWwindow* window);
	alias pglfwGetCurrentContext = GLFWwindow* function();
	alias pglfwSwapBuffers = void function(GLFWwindow* window);
	alias pglfwSwapInterval = void function(int interval);
	alias pglfwExtensionSupported = int function(const(char)* extension);
	alias pglfwGetProcAddress = GLFWglproc function(const(char)* procname);
	static if(glfwSupport >= GLFWSupport.glfw31){
		alias pglfwGetWindowFrameSize = void function(GLFWwindow* window, int* left, int* top, int* right, int* bottom);
		alias pglfwPostEmptyEvent = void function();
		alias pglfwCreateCursor = GLFWcursor* function(const(GLFWimage)* image, int xhot, int yhot);
		alias pglfwCreateStandardCursor = GLFWcursor* function(int shape);
		alias pglfwDestroyCursor = void function(GLFWcursor* cursor);
		alias pglfwSetCursor = void function(GLFWwindow* window, GLFWcursor* cursor);
		alias pglfwSetCharModsCallback = GLFWcharmodsfun function(GLFWwindow* window, GLFWcharmodsfun callback);
		alias pglfwSetDropCallback = GLFWdropfun function(GLFWwindow* window, GLFWdropfun callback);
	}
	static if(glfwSupport >= GLFWSupport.glfw32){
		alias pglfwSetWindowIcon = void function(GLFWwindow* window, int count, const(GLFWimage)* images);
		alias pglfwSetWindowSizeLimits = void function(GLFWwindow* window, int minwidth, int minheight, int maxwidth, int maxheight);
		alias pglfwSetWindowAspectRatio = void function(GLFWwindow* window, int numer, int denom);
		alias pglfwMaximizeWindow = void function(GLFWwindow* window);
		alias pglfwFocusWindow = void function(GLFWwindow* window);
		alias pglfwSetWindowMonitor = void function(GLFWwindow* window, GLFWmonitor* monitor, int xpos, int ypos, int width, int height, int refreshRate);
		alias pglfwWaitEventsTimeout = void function(double timeout);
		alias pglfwGetKeyName = const(char)* function(int key, int scancode);
		alias pglfwGetTimerValue = long function();
		alias pglfwGetTimerFrequency = long function();
		alias pglfwVulkanSupported = int function();
		alias pglfwSetJoystickCallback = GLFWjoystickfun function(GLFWjoystickfun callback);
	}
	static if(glfwSupport >= GLFWSupport.glfw33){
		alias pglfwInitHint = void function(int,int);
		alias pglfwGetError = int function(const(char)** description);
		alias pglfwGetMonitorWorkarea = void function(GLFWmonitor* monitor, int* xpos, int* ypos, int* width, int* height);
		alias pglfwGetMonitorContentScale = void function(GLFWmonitor* monitor, float* xscale, float* yscale);
		alias pglfwSetMonitorUserPointer = void function(GLFWmonitor* monitor, void* pointer);
		alias pglfwGetMonitorUserPointer = void* function(GLFWmonitor* monitor);
		alias pglfwWindowHintString = void function(int hint,const(char)* value);
		alias pglfwGetWindowContentScale = void function(GLFWwindow* window, float* xscale, float* yscale);
		alias pglfwGetWindowOpacity = float function(GLFWwindow* window);
		alias pglfwSetWindowOpacity = void function(GLFWwindow* window, float opacity);
		alias pglfwRequestWindowAttention = void function(GLFWwindow* window);
		alias pglfwSetWindowAttrib = void function(GLFWwindow* window, int attrib, int value);
		alias pglfwSetWindowMaximizeCallback = GLFWwindowmaximizefun function(GLFWwindow* window, GLFWwindowmaximizefun callback);
		alias pglfwSetWindowContentScaleCallback = GLFWwindowcontentscalefun function(GLFWwindow* window, GLFWwindowcontentscalefun callback);
		alias pglfwRawMouseMotionSupported = int function();
		alias pglfwGetKeyScancode = int function(int key);
		alias pglfwGetJoystickHats = const(ubyte)* function(int jid, int* count);
		alias pglfwGetJoystickGUID = const(char)* function(int jid);
		alias pglfwSetJoystickUserPointer = void function(int jid, void* pointer);
		alias pglfwGetJoystickUserPointer = void* function(int jid);
		alias pglfwJoystickIsGamepad = int function(int jid);
		alias pglfwUpdateGamepadMappings = int function(const(char)* string_);
		alias pglfwGetGamepadName = const(char)* function(int jid);
		alias pglfwGetGamepadState = int function(int jid, GLFWgamepadstate* state);
	}
}

__gshared{
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
	static if(glfwSupport >= GLFWSupport.glfw31){
		pglfwGetWindowFrameSize glfwGetWindowFrameSize;
		pglfwPostEmptyEvent glfwPostEmptyEvent;
		pglfwCreateCursor glfwCreateCursor;
		pglfwCreateStandardCursor glfwCreateStandardCursor;
		pglfwDestroyCursor glfwDestroyCursor;
		pglfwSetCursor glfwSetCursor;
		pglfwSetCharModsCallback glfwSetCharModsCallback;
		pglfwSetDropCallback glfwSetDropCallback;
	}
	static if(glfwSupport >= GLFWSupport.glfw32){
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
	static if(glfwSupport >= GLFWSupport.glfw33){
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
		pglfwRawMouseMotionSupported glfwRawMouseMotionSupported;
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

import bindbc.loader;

private{
	SharedLib lib;
	GLFWSupport loadedVersion;
}

@nogc nothrow:

void unloadGLFW(){
	if(lib != invalidHandle){
		lib.unload();
	}
}

GLFWSupport loadedGLFWVersion() @safe{
	return loadedVersion;
}

bool isGLFWLoaded() @safe{
	return lib != invalidHandle;
}

/**
This is exposed solely to support the optional loader mixins
at the bottom of the module.
*/
void bindGLFWSymbol(void** ptr, const(char)* symbolName){
	assert(lib != invalidHandle, "GLFW must be loaded before attempting to bind optional functions.");
	lib.bindSymbol(ptr, symbolName);
}

GLFWSupport loadGLFW(){
	version(Windows){
		const(char)[][1] libNames = ["glfw3.dll"];
	}else version(OSX){
		const(char)[][2] libNames = [
			"libglfw3.dylib",
			"libglfw.3.dylib"
		];
	}else version(Posix){
		const(char)[][4] libNames = [
			"libglfw3.so",
			"libglfw.so.3",
			"/usr/local/lib/libglfw3.so",
			"/usr/local/lib/libglfw.so.3"
		];
	}else static assert(0, "bindbc-glfw is not yet supported on this platform.");
	
	GLFWSupport ret;
	foreach(name; libNames){
		ret = loadGLFW(name.ptr);
		if(ret != GLFWSupport.noLibrary) break;
	}
	return ret;
}

GLFWSupport loadGLFW(const(char)* libName){
	lib = load(libName);
	if(lib == invalidHandle){
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
	
	static if(glfwSupport >= GLFWSupport.glfw31){
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
	
	static if(glfwSupport >= GLFWSupport.glfw32){
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
	
	static if(glfwSupport == GLFWSupport.glfw33){
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
		lib.bindSymbol(cast(void**)&glfwRawMouseMotionSupported, "glfwRawMouseMotionSupported");
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
	void load(){
		if(!loadGLFW()){
			throw new Exception("Failed to load GLFW");
		}
		loadGLFW_Vulkan();
	}
```
*/
static if(glfwSupport >= GLFWSupport.glfw32){
	enum bindGLFW_Vulkan = q{
		extern(C) @nogc nothrow{
			alias pglfwGetRequiredInstanceExtensions = const(char)** function(uint* count);
			alias pglfwGetInstanceProcAddress = GLFWvkproc function(VkInstance instance, const(char)* procname);
			alias pglfwGetPhysicalDevicePresentationSupport = int function(VkInstance instance, VkPhysicalDevice device, uint queuefamily);
			alias pglfwCreateWindowSurface = VkResult function(VkInstance instance, GLFWwindow* window, const(VkAllocationCallbacks)* allocator, VkSurfaceKHR* surface);
		}
		
		__gshared{
			pglfwGetRequiredInstanceExtensions glfwGetRequiredInstanceExtensions;
			pglfwGetInstanceProcAddress glfwGetInstanceProcAddress;
			pglfwGetPhysicalDevicePresentationSupport glfwGetPhysicalDevicePresentationSupport;
			pglfwCreateWindowSurface glfwCreateWindowSurface;
		}
		
		@nogc nothrow bool loadGLFW_Vulkan(){
			import bindbc.loader.sharedlib: errorCount;
			if(!isGLFWLoaded) return false;
			
			auto errCount = errorCount();
			bindGLFWSymbol(cast(void**)&glfwGetRequiredInstanceExtensions, "glfwGetRequiredInstanceExtensions");
			bindGLFWSymbol(cast(void**)&glfwGetInstanceProcAddress, "glfwGetInstanceProcAddress");
			bindGLFWSymbol(cast(void**)&glfwGetPhysicalDevicePresentationSupport, "glfwGetPhysicalDevicePresentationSupport");
			bindGLFWSymbol(cast(void**)&glfwCreateWindowSurface, "glfwCreateWindowSurface");
			return errorCount() == errCount;
		}
	};
}

enum bindGLFW_EGL= q{
	extern(C) @nogc nothrow{
		alias pglfwGetEGLDisplay = EGLDisplay function();
		alias pglfwGetEGLContext = EGLContext function(GLFWwindow* window);
		alias pglfwGetEGLSurface = EGLSurface function(GLFWwindow* window);
	}
	
	__gshared{
		pglfwGetEGLDisplay glfwGetEGLDisplay;
		pglfwGetEGLContext glfwGetEGLContext;
		pglfwGetEGLSurface glfwGetEGLSurface;
	}
	
	@nogc nothrow bool loadGLFW_EGL(){
		import bindbc.loader.sharedlib: errorCount;
		if(!isGLFWLoaded) return false;
		
		auto errCount = errorCount();
		bindGLFWSymbol(cast(void**)&glfwGetEGLDisplay, "glfwGetEGLDisplay");
		bindGLFWSymbol(cast(void**)&glfwGetEGLContext, "glfwGetEGLContext");
		bindGLFWSymbol(cast(void**)&glfwGetEGLSurface,"glfwGetEGLSurface");
		return errorCount() == errCount;
	}
};

version(Windows){
	enum bindGLFW_WGL = q{
		extern(C) @nogc nothrow alias pglfwGetWGLContext = HGLRC function(GLFWwindow* window);
		__gshared pglfwGetWGLContext glfwGetWGLContext;
		
		@nogc nothrow bool loadGLFW_WGL(){
			import bindbc.loader.sharedlib: errorCount;
			if(!isGLFWLoaded) return false;
			
			auto errCount = errorCount();
			bindGLFWSymbol(cast(void**)&glfwGetWGLContext,"glfwGetWGLContext");
			return errorCount() == errCount;
		}
	};
	static if(glfwSupport >= GLFWSupport.glfw31){
		enum bindGLFW_Windows = q{
			extern(C) @nogc nothrow{
				alias pglfwGetWin32Adapter = const(char)* function(GLFWmonitor* monitor);
				alias pglfwGetWin32Monitor = const(char)* function(GLFWmonitor* monitor);
				alias pglfwGetWin32Window = HWND function(GLFWwindow* window);
			}
			
			__gshared{
				pglfwGetWin32Adapter glfwGetWin32Adapter;
				pglfwGetWin32Monitor glfwGetWin32Monitor;
				pglfwGetWin32Window glfwGetWin32Window;
			}
			
			@nogc nothrow bool loadGLFW_Windows(){
				import bindbc.loader.sharedlib: errorCount;
				if(!isGLFWLoaded) return false;
				
				auto errCount = errorCount();
				bindGLFWSymbol(cast(void**)&glfwGetWin32Adapter, "glfwGetWin32Adapter");
				bindGLFWSymbol(cast(void**)&glfwGetWin32Monitor, "glfwGetWin32Monitor");
				bindGLFWSymbol(cast(void**)&glfwGetWin32Window,"glfwGetWin32Window");
				return errorCount() == errCount;
			}
		};
	}else{
		enum bindGLFW_Windows = q{
			extern(C) @nogc nothrow alias pglfwGetWin32Window = HWND function(GLFWwindow* window);
			__gshared pglfwGetWin32Window glfwGetWin32Window;
			@nogc nothrow bool loadGLFW_Windows(){
				import bindbc.loader.sharedlib: errorCount;
				if(!isGLFWLoaded) return false;
				
				auto errCount = errorCount();
				bindGLFWSymbol(cast(void**)&glfwGetWin32Window,"glfwGetWin32Window");
				return errorCount() == errCount;
			}
		};
	}
}else version(OSX){
	enum bindGLFW_NSGL = q{
		extern(C) @nogc nothrow alias pglfwGetNSGLContext = id function(GLFWwindow* window);
		__gshared pglfwGetNSGLContext glfwGetNSGLContext;
		
		@nogc nothrow bool loadGLFW_NSGL(){
			import bindbc.loader.sharedlib: errorCount;
			if(!isGLFWLoaded) return false;
			
			auto errCount = errorCount();
			bindGLFWSymbol(cast(void**)&glfwGetNSGLContext, "glfwGetNSGLContext");
			return errorCount() == errCount;
		}
	};
	
	static if(glfwSupport >= GLFWSupport.glfw31){
		enum glfwCocoaBind = q{
			extern(C) @nogc nothrow{
				alias pglfwGetCocoaMonitor = CGDirectDisplayID function(GLFWmonitor* monitor);
				alias pglfwGetCocoaWindow = id function(GLFWwindow* window);
			}
			
			__gshared{
				pglfwGetCocoaMonitor glfwGetCocoaMonitor;
				pglfwGetCocoaWindow glfwGetCocoaWindow;
			}
			
			@nogc nothrow bool loadGLFW_Cocoa(){
				import bindbc.loader.sharedlib: errorCount;
				if(!isGLFWLoaded) return false;
				
				auto errCount = errorCount();
				bindGLFWSymbol(cast(void**)&glfwGetCocoaMonitor, "glfwGetCocoaMonitor");
				bindGLFWSymbol(cast(void**)&glfwGetCocoaWindow,"glfwGetCocoaWindow");
				return errorCount() == errCount;
			}
		};
	}else{
		enum bindGLFW_Cocoa = q{
			extern(C) @nogc nothrow alias pglfwGetCocoaWindow = id function(GLFWwindow* window);
			__gshared pglfwGetCocoaWindow glfwGetCocoaWindow;
			
			@nogc nothrow bool loadGLFW_Cocoa(){
				import bindbc.loader.sharedlib: errorCount;
				if(!isGLFWLoaded) return false;
				
				auto errCount = errorCount();
				bindGLFWSymbol(cast(void**)&glfwGetCocoaWindow,"glfwGetCocoaWindow");
				return errorCount() == errCount;
			}
		};
	}
}else static if((){ //Posix, but not Android
	version(Posix){
		version(Android) return false;
		else return true;
	}else return false;
}()){
	static if(glfwSupport >= GLFWSupport.glfw32){
		enum bindGLFW_GLX = q{
			extern(C) @nogc nothrow{
				alias pglfwGetGLXContext = GLXContext function(GLFWwindow* window);
				alias pglfwGetGLXWindow = GLXWindow function(GLFWwindow* window);
			}
			
			__gshared{
				pglfwGetGLXContext glfwGetGLXContext;
				pglfwGetGLXWindow glfwGetGLXWindow;
			}
			
			@nogc nothrow bool loadGLFW_GLX(){
				import bindbc.loader.sharedlib: errorCount;
				if(!isGLFWLoaded) return false;
				
				auto errCount = errorCount();
				bindGLFWSymbol(cast(void**)&glfwGetGLXContext, "glfwGetGLXContext");
				bindGLFWSymbol(cast(void**)&glfwGetGLXWindow, "glfwGetGLXWindow");
				return errorCount() == errCount;
			}
		};
	}else{
		enum bindGLFW_GLX = q{
			extern(C) @nogc nothrow alias pglfwGetGLXContext = GLXContext function(GLFWwindow* window);
			__gshared pglfwGetGLXContext glfwGetGLXContext;
			
			@nogc nothrow bool loadGLFW_GLX(){
				import bindbc.loader.sharedlib: errorCount;
				if(!isGLFWLoaded) return false;
				
				auto errCount = errorCount();
				bindGLFWSymbol(cast(void**)&glfwGetGLXContext, "glfwGetGLXContext");
				return errorCount() == errCount;
			}
		};
	}
	static if(glfwSupport >= GLFWSupport.glfw33){
		enum bindGLFW_X11= q{
			extern(C) @nogc nothrow{
				alias pglfwGetX11Display = Display* function();
				alias pglfwGetX11Window = Window function(GLFWwindow* window);
				alias pglfwGetX11Adapter = RRCrtc function(GLFWmonitor* monitor);
				alias pglfwGetX11Monitor = RROutput function(GLFWmonitor* monitor);
				alias pglfwSetX11SelectionString = void function(const(char)* string_);
				alias pglfwGetX11SelectionString = const(char)* function();
			}
			
			__gshared{
				pglfwGetX11Display glfwGetX11Display;
				pglfwGetX11Window glfwGetX11Window;
				pglfwGetX11Adapter glfwGetX11Adapter;
				pglfwGetX11Monitor glfwGetX11Monitor;
				pglfwSetX11SelectionString glfwSetX11SelectionString;
				pglfwGetX11SelectionString glfwGetX11SelectionString;
			}
			
			@nogc nothrow bool loadGLFW_X11(){
				import bindbc.loader.sharedlib: errorCount;
				if(!isGLFWLoaded) return false;
				
				auto errCount = errorCount();
				bindGLFWSymbol(cast(void**)&glfwGetX11Display, "glfwGetX11Display");
				bindGLFWSymbol(cast(void**)&glfwGetX11Window,"glfwGetX11Window");
				bindGLFWSymbol(cast(void**)&glfwGetX11Adapter, "glfwGetX11Adapter");
				bindGLFWSymbol(cast(void**)&glfwGetX11Monitor,"glfwGetX11Monitor");
				bindGLFWSymbol(cast(void**)&glfwSetX11SelectionString,"glfwSetX11SelectionString");
				bindGLFWSymbol(cast(void**)&glfwGetX11SelectionString,"glfwGetX11SelectionString");
				return errorCount() == errCount;
			}
		};
	}else static if(glfwSupport >= GLFWSupport.glfw31){
		enum bindGLFW_X11= q{
			extern(C) @nogc nothrow{
				alias pglfwGetX11Display = Display* function();
				alias pglfwGetX11Window = Window function(GLFWwindow* window);
				alias pglfwGetX11Adapter = RRCrtc function(GLFWmonitor* monitor);
				alias pglfwGetX11Monitor = RROutput function(GLFWmonitor* monitor);
			}
			
			__gshared{
				pglfwGetX11Display glfwGetX11Display;
				pglfwGetX11Window glfwGetX11Window;
				pglfwGetX11Adapter glfwGetX11Adapter;
				pglfwGetX11Monitor glfwGetX11Monitor;
			}
			
			@nogc nothrow bool loadGLFW_X11(){
				import bindbc.loader.sharedlib: errorCount;
				if(!isGLFWLoaded) return false;
				
				auto errCount = errorCount();
				bindGLFWSymbol(cast(void**)&glfwGetX11Display, "glfwGetX11Display");
				bindGLFWSymbol(cast(void**)&glfwGetX11Window,"glfwGetX11Window");
				bindGLFWSymbol(cast(void**)&glfwGetX11Adapter, "glfwGetX11Adapter");
				bindGLFWSymbol(cast(void**)&glfwGetX11Monitor,"glfwGetX11Monitor");
				return errorCount() == errCount;
			}
		};
	}else{
		enum bindGLFW_X11 = q{
			extern(C) @nogc nothrow{
				alias pglfwGetX11Display = Display* function();
				alias pglfwGetX11Window = Window function(GLFWwindow* window);
			}
			
			__gshared{
				pglfwGetX11Display glfwGetX11Display;
				pglfwGetX11Window glfwGetX11Window;
			}
			
			@nogc nothrow bool loadGLFW_X11(){
				import bindbc.loader.sharedlib: errorCount;
				if(!isGLFWLoaded) return false;
				
				auto errCount = errorCount();
				bindGLFWSymbol(cast(void**)&glfwGetX11Display, "glfwGetX11Display");
				bindGLFWSymbol(cast(void**)&glfwGetX11Window,"glfwGetX11Window");
				return errorCount() == errCount;
			}
		};
	}
	
	static if(glfwSupport >= GLFWSupport.glfw32){
		enum gbindGLFW_Wayland = q{
			extern(C) @nogc nothrow{
				alias pglfwGetWaylandDisplay = wl_display* function();
				alias pglfwGetWaylandMonitor = wl_output* function(GLFWmonitor* monitor);
				alias pglfwGetWaylandWindow = wl_surface* function(GLFWwindow* window);
			}
			__gshared{
				pglfwGetWaylandDisplay glfwGetWaylandDisplay;
				pglfwGetWaylandMonitor glfwGetWaylandMonitor;
				pglfwGetWaylandWindow glfwGetWaylandWindow;
			}
			
			@nogc nothrow bool loadGLFW_Wayland(){
				import bindbc.loader.sharedlib: errorCount;
				if(!isGLFWLoaded) return false;
				
				auto errCount = errorCount();
				bindGLFWSymbol(cast(void**)&glfwGetWaylandDisplay, "glfwGetWaylandDisplay");
				bindGLFWSymbol(cast(void**)&glfwGetWaylandMonitor, "glfwGetWaylandMonitor");
				bindGLFWSymbol(cast(void**)&glfwGetWaylandWindow,"glfwGetWaylandWindow");
				return errorCount() == errCount;
			}
		};
	}
	
	// Support for Mir was removed in GLFW 3.3
	static if(glfwSupport == GLFWSupport.glfw32){
		enum bindGLFW_Mir = q{
			extern(C) @nogc nothrow{
				alias pglfwGetMirDisplay = MirConnection* function();
				alias pglfwGetMirMonitor = int function(GLFWmonitor* monitor);
				alias pglfwGetMirWindow = MirSurface* function(GLFWwindow* window);
			}
			
			__gshared{
				pglfwGetMirDisplay glfwGetMirDisplay;
				pglfwGetMirMonitor glfwGetMirMonitor;
				pglfwGetMirWindow glfwGetMirWindow;
			}
			
			@nogc nothrow bool loadGLFW_Mir(){
				import bindbc.loader.sharedlib: errorCount;
				if(!isGLFWLoaded) return false;
				
				auto errCount = errorCount();
				bindGLFWSymbol(cast(void**)&glfwGetMirDisplay, "glfwGetMirDisplay");
				bindGLFWSymbol(cast(void**)&glfwGetMirMonitor, "glfwGetMirMonitor");
				bindGLFWSymbol(cast(void**)&glfwGetMirWindow,"glfwGetMirWindow");
				return errorCount() == errCount;
			}
		};
	}
}
