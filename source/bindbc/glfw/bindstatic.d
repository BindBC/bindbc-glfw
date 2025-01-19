/+
+            Copyright 2023 – 2025 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.glfw.bindstatic;

import bindbc.glfw.types;

static if(staticBinding):

extern(C) @nogc nothrow {
	int glfwInit();
	void glfwTerminate();
	void glfwGetVersion(int* major, int* minor, int* rev);
	const(char)* glfwGetVersionString();
	GLFWerrorfun glfwSetErrorCallback(GLFWerrorfun callback);
	GLFWmonitor** glfwGetMonitors(int* count);
	GLFWmonitor* glfwGetPrimaryMonitor();
	void glfwGetMonitorPos(GLFWmonitor* monitor, int* xpos, int* ypos);
	void glfwGetMonitorPhysicalSize(GLFWmonitor* monitor, int* widthMM, int* heightMM);
	const(char)* glfwGetMonitorName(GLFWmonitor* monitor);
	GLFWmonitorfun glfwSetMonitorCallback(GLFWmonitorfun callback);
	const(GLFWvidmode)* glfwGetVideoModes(GLFWmonitor* monitor, int* count);
	const(GLFWvidmode)* glfwGetVideoMode(GLFWmonitor* monitor);
	void glfwSetGamma(GLFWmonitor* monitor, float gamma);
	const(GLFWgammaramp*) glfwGetGammaRamp(GLFWmonitor* monitor);
	void glfwSetGammaRamp(GLFWmonitor* monitor, const(GLFWgammaramp)* ramp);
	void glfwDefaultWindowHints();
	void glfwWindowHint(int hint, int value);
	GLFWwindow* glfwCreateWindow(int width, int height, const(char)* title, GLFWmonitor* monitor, GLFWwindow* share);
	void glfwDestroyWindow(GLFWwindow* window);
	int glfwWindowShouldClose(GLFWwindow* window);
	void glfwSetWindowShouldClose(GLFWwindow* window, int value);
	void glfwSetWindowTitle(GLFWwindow* window, const(char)* title);
	void glfwGetWindowPos(GLFWwindow* window, int* xpos, int* ypos);
	void glfwSetWindowPos(GLFWwindow* window, int xpos, int ypos);
	void glfwGetWindowSize(GLFWwindow* window, int* width, int* height);
	void glfwSetWindowSize(GLFWwindow* window, int width, int height);
	void glfwGetFramebufferSize(GLFWwindow* window, int* width, int* height);
	void glfwIconifyWindow(GLFWwindow* window);
	void glfwRestoreWindow(GLFWwindow* window);
	void glfwShowWindow(GLFWwindow* window);
	void glfwHideWindow(GLFWwindow* window);
	GLFWmonitor* glfwGetWindowMonitor(GLFWwindow* window);
	int glfwGetWindowAttrib(GLFWwindow* window, int attrib);
	void glfwSetWindowUserPointer(GLFWwindow* window, void* pointer);
	void* glfwGetWindowUserPointer(GLFWwindow* window);
	GLFWwindowposfun glfwSetWindowPosCallback(GLFWwindow* window, GLFWwindowposfun callback);
	GLFWwindowsizefun glfwSetWindowSizeCallback(GLFWwindow* window, GLFWwindowsizefun callback);
	GLFWwindowclosefun glfwSetWindowCloseCallback(GLFWwindow* window, GLFWwindowclosefun callback);
	GLFWwindowrefreshfun glfwSetWindowRefreshCallback(GLFWwindow* window, GLFWwindowrefreshfun callback);
	GLFWwindowfocusfun glfwSetWindowFocusCallback(GLFWwindow* window, GLFWwindowfocusfun callback);
	GLFWwindowiconifyfun glfwSetWindowIconifyCallback(GLFWwindow* window, GLFWwindowiconifyfun callback);
	GLFWframebuffersizefun glfwSetFramebufferSizeCallback(GLFWwindow* window, GLFWframebuffersizefun callback);
	void glfwPollEvents();
	void glfwWaitEvents();
	int glfwGetInputMode(GLFWwindow* window, int mode);
	void glfwSetInputMode(GLFWwindow* window, int mode, int value);
	int glfwGetKey(GLFWwindow* window, int key);
	int glfwGetMouseButton(GLFWwindow* window, int button);
	void glfwGetCursorPos(GLFWwindow* window, double* xpos, double* ypos);
	void glfwSetCursorPos(GLFWwindow* window, double xpos, double ypos);
	GLFWkeyfun glfwSetKeyCallback(GLFWwindow* window, GLFWkeyfun callback);
	GLFWcharfun glfwSetCharCallback(GLFWwindow* window, GLFWcharfun callback);
	GLFWmousebuttonfun glfwSetMouseButtonCallback(GLFWwindow* window, GLFWmousebuttonfun callback);
	GLFWcursorposfun glfwSetCursorPosCallback(GLFWwindow* window, GLFWcursorposfun callback);
	GLFWcursorenterfun glfwSetCursorEnterCallback(GLFWwindow* window, GLFWcursorenterfun callback);
	GLFWscrollfun glfwSetScrollCallback(GLFWwindow* window, GLFWscrollfun callback);
	int glfwJoystickPresent(int jid);
	float* glfwGetJoystickAxes(int jid, int* count);
	ubyte* glfwGetJoystickButtons(int jid, int* count);
	const(char)* glfwGetJoystickName(int jid);
	void glfwSetClipboardString(GLFWwindow* window, const(char)* string_);
	const(char)* glfwGetClipboardString(GLFWwindow* window);
	double glfwGetTime();
	void glfwSetTime(double time);
	void glfwMakeContextCurrent(GLFWwindow* window);
	GLFWwindow* glfwGetCurrentContext();
	void glfwSwapBuffers(GLFWwindow* window);
	void glfwSwapInterval(int interval);
	int glfwExtensionSupported(const(char)* extension);
	GLFWglproc glfwGetProcAddress(const(char)* procname);

	static if(glfwSupport >= GLFWSupport.glfw31) {
		void glfwGetWindowFrameSize(GLFWwindow* window, int* left, int* top, int* right, int* bottom);
		void glfwPostEmptyEvent();
		GLFWcursor* glfwCreateCursor(const(GLFWimage)* image, int xhot, int yhot);
		GLFWcursor* glfwCreateStandardCursor(int shape);
		void glfwDestroyCursor(GLFWcursor* cursor);
		void glfwSetCursor(GLFWwindow* window, GLFWcursor* cursor);
		GLFWcharmodsfun glfwSetCharModsCallback(GLFWwindow* window, GLFWcharmodsfun callback);
		GLFWdropfun glfwSetDropCallback(GLFWwindow* window, GLFWdropfun callback);
	}

	static if(glfwSupport >= GLFWSupport.glfw32) {
		void glfwSetWindowIcon(GLFWwindow* window, int count, const(GLFWimage)* images);
		void glfwSetWindowSizeLimits(GLFWwindow* window, int minwidth, int minheight, int maxwidth, int maxheight);
		void glfwSetWindowAspectRatio(GLFWwindow* window, int numer, int denom);
		void glfwMaximizeWindow(GLFWwindow* window);
		void glfwFocusWindow(GLFWwindow* window);
		void glfwSetWindowMonitor(GLFWwindow* window, GLFWmonitor* monitor, int xpos, int ypos, int width, int height, int refreshRate);
		void glfwWaitEventsTimeout(double timeout);
		const(char)* glfwGetKeyName(int key, int scancode);
		long glfwGetTimerValue();
		long glfwGetTimerFrequency();
		int glfwVulkanSupported();
		GLFWjoystickfun glfwSetJoystickCallback(GLFWjoystickfun callback);
	}

	static if(glfwSupport >= GLFWSupport.glfw33) {
		void glfwInitHint(int,int);
		int glfwGetError(const(char)** description);
		void glfwGetMonitorWorkarea(GLFWmonitor* monitor, int* xpos, int* ypos, int* width, int* height);
		void glfwGetMonitorContentScale(GLFWmonitor* monitor, float* xscale, float* yscale);
		void glfwSetMonitorUserPointer(GLFWmonitor* monitor, void* pointer);
		void* glfwGetMonitorUserPointer(GLFWmonitor* monitor);
		void glfwWindowHintString(int hint,const(char)* value);
		void glfwGetWindowContentScale(GLFWwindow* window, float* xscale, float* yscale);
		float glfwGetWindowOpacity(GLFWwindow* window);
		void glfwSetWindowOpacity(GLFWwindow* window, float opacity);
		void glfwRequestWindowAttention(GLFWwindow* window);
		void glfwSetWindowAttrib(GLFWwindow* window, int attrib, int value);
		GLFWwindowmaximizefun glfwSetWindowMaximizeCallback(GLFWwindow* window, GLFWwindowmaximizefun callback);
		GLFWwindowcontentscalefun glfwSetWindowContentScaleCallback(GLFWwindow* window, GLFWwindowcontentscalefun callback);
		int glfwRawMouseMotionSupported();
		int glfwGetKeyScancode(int key);
		const(ubyte)* glfwGetJoystickHats(int jid, int* count);
		const(char)* glfwGetJoystickGUID(int jid);
		void glfwSetJoystickUserPointer(int jid, void* pointer);
		void* glfwGetJoystickUserPointer(int jid);
		int glfwJoystickIsGamepad(int jid);
		int glfwUpdateGamepadMappings(const(char)* string_);
		const(char)* glfwGetGamepadName(int jid);
		int glfwGetGamepadState(int jid, GLFWgamepadstate* state);
	}
}

/*
	The following allow binding to Vulkan and native system functions using
	types declared in any Vulkan or system binding, e.g.:

	```d
	module myglfw;
	public import bindbc.glfw;
	mixin(bindGLFW_Vulkan);
   ```
*/

// Vulkan
static if(glfwSupport >= GLFWSupport.glfw32) {
	enum bindGLFW_Vulkan = q{
		extern(C) @nogc nothrow {
			const(char)** glfwGetRequiredInstanceExtensions(uint* count);
			GLFWvkproc glfwGetInstanceProcAddress(VkInstance instance, const(char)* procname);
			int glfwGetPhysicalDevicePresentationSupport(VkInstance instance, VkPhysicalDevice device, uint queuefamily);
			VkResult glfwCreateWindowSurface(VkInstance instance, GLFWwindow* window, const(VkAllocationCallbacks)* allocator, VkSurfaceKHR* surface);
		}
	};
}

// EGL
enum bindGLFW_EGL = q{
	extern(C) @nogc nothrow {
		EGLDisplay glfwGetEGLDisplay();
		EGLContext glfwGetEGLContext(GLFWwindow* window);
		EGLSurface glfwGetEGLSurface(GLFWwindow* window);
	}
};

version(Windows) {
	enum bindGLFW_WGL = q{
		extern(C) @nogc nothrow HGLRC glfwGetWGLContext(GLFWwindow* window);
	};

	static if(glfwSupport >= GLFWSupport.glfw31) {
		enum bindGLFW_Windows = q{
			extern(C) @nogc nothrow {
				HWND glfwGetWin32Window(GLFWwindow* window);
				const(char)* glfwGetWin32Adapter(GLFWmonitor* monitor);
				const(char)* glfwGetWin32Monitor(GLFWmonitor* monitor);
			}
		};
	}
	else enum bindGLFW_Windows= q{
			extern(C) @nogc nothrow HWND glfwGetWin32Window(GLFWwindow* window);
	};
}

version(OSX) {
	enum bindGLFW_NSGL = q{
		extern(C) @nogc nothrow id glfwGetNSGLContext(GLFWwindow* window);
	};

	static if(glfwSupport >= GLFWSupport.glfw31) {
		enum bindGLFW_Cocoa = q{
			extern(C) @nogc nothrow {
				CGDirectDisplayID glfwGetCocoaMonitor(GLFWmonitor* monitor);
				id glfwGetCocoaWindow(GLFWwindow* window);
			}
		};
	}
	else enum bindGLFW_Cocoa = q{
		extern(C) @nogc nothrow id glfwGetCocoaWindow(GLFWwindow* window);
	};
}
else version(Android) {}
else version(Posix) {
	// X11
	static if(glfwSupport >= GLFWSupport.glfw32) {
		enum bindGLFW_GLX = q{
			extern(C) @nogc nothrow {
				GLXContext glfwGetGLXContext(GLFWwindow* window);
				GLXwindow glfwGetGLXWindow(GLFWwindow* window);
			}
		};
	}
	else enum bindGLFW_GLX = q{
		extern(C) @nogc nothrow GLXContext glfwGetGLXContext(GLFWwindow* window);
	};
	static if(glfwSupport >= GLFWSupport.glfw33) {
		enum bindGLFW_X11 = q{
			extern(C) @nogc nothrow {
				Display* glfwGetX11Display();
				Window glfwGetX11Window(GLFWwindow* window);
				RRCrtc glfwGetX11Adapter(GLFWmonitor* monitor);
				RROutput glfwGetX11Monitor(GLFWmonitor* monitor);
				void glfwSetX11SelectionString(const(char)* string_);
				const(char)* glfwGetX11SelectionString();
			}
		};
	}
	else static if(glfwSupport >= GLFWSupport.glfw31) {
		enum bindGLFW_X11 = q{
			extern(C) @nogc nothrow {
				Display* glfwGetX11Display();
				Window glfwGetX11Window(GLFWwindow* window);
				RRCrtc glfwGetX11Adapter(GLFWmonitor* monitor);
				RROutput glfwGetX11Monitor(GLFWmonitor* monitor);
			}
		};
	}
	else enum bindGLFW_X11 = q{
		extern(C) @nogc nothrow {
			Display* glfwGetX11Display();
			Window glfwGetX11Window(GLFWwindow* window);
		}
	};

	// Wayland
	static if(glfwSupport >= GLFWSupport.glfw32) {
		enum bindGLFW_Wayland = q{
			extern(C) @nogc nothrow {
				wl_display* glfwGetWaylandDisplay();
				wl_output* glfwGetWaylandMonitor(GLFWmonitor* monitor);
				wl_surface* glfwGetWaylandWindow(GLFWwindow* window);
			}
		};
	}

	// Mir
	// Removed in GLFW 3.3
	static if(glfwSupport == GLFWSupport.glfw32) {
		enum bindGLFW_Mir = q{
			extern(C) @nogc nothrow {
				MirConnection* glfwGetMirDisplay();
				int glfwGetMirMonitor(GLFWmonitor* monitor);
				MirSurface* glfwGetMirWindow(GLFWwindow* window);
			}
		};
	}
}
