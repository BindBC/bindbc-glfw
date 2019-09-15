
//          Copyright Michael D. Parker 2018.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.glfw.bindstatic;

version(BindBC_Static) version = BindGLFW_Static;
version(BindGLFW_Static):

import bindbc.glfw.types;

extern(C) @nogc nothrow {
    int glfwInit();
    void glfwTerminate();
    void glfwGetVersion(int*,int*,int*);
    const(char)* glfwGetVersionString();
    GLFWerrorfun glfwSetErrorCallback(GLFWerrorfun);
    GLFWmonitor** glfwGetMonitors(int*);
    GLFWmonitor* glfwGetPrimaryMonitor();
    void glfwGetMonitorPos(GLFWmonitor*,int*,int*);
    void glfwGetMonitorPhysicalSize(GLFWmonitor*,int*,int*);
    const(char)* glfwGetMonitorName(GLFWmonitor*);
    GLFWmonitorfun glfwSetMonitorCallback(GLFWmonitorfun);
    const(GLFWvidmode)* glfwGetVideoModes(GLFWmonitor*,int*);
    const(GLFWvidmode)* glfwGetVideoMode(GLFWmonitor*);
    void glfwSetGamma(GLFWmonitor*,float);
    const(GLFWgammaramp*) glfwGetGammaRamp(GLFWmonitor*);
    void glfwSetGammaRamp(GLFWmonitor*,const(GLFWgammaramp)*);
    void glfwDefaultWindowHints();
    void glfwWindowHint(int,int);
    GLFWwindow* glfwCreateWindow(int,int,const(char)*,GLFWmonitor*,GLFWwindow*);
    void glfwDestroyWindow(GLFWwindow*);
    int glfwWindowShouldClose(GLFWwindow*);
    void glfwSetWindowShouldClose(GLFWwindow*,int);
    void glfwSetWindowTitle(GLFWwindow*,const(char)*);
    void glfwGetWindowPos(GLFWwindow*,int*,int*);
    void glfwSetWindowPos(GLFWwindow*,int,int);
    void glfwGetWindowSize(GLFWwindow*,int*,int*);
    void glfwSetWindowSize(GLFWwindow*,int,int);
    void glfwGetFramebufferSize(GLFWwindow*,int*,int*);
    void glfwIconifyWindow(GLFWwindow*);
    void glfwRestoreWindow(GLFWwindow*);
    void glfwShowWindow(GLFWwindow*);
    void glfwHideWindow(GLFWwindow*);
    GLFWmonitor* glfwGetWindowMonitor(GLFWwindow*);
    int glfwGetWindowAttrib(GLFWwindow*,int);
    void glfwSetWindowUserPointer(GLFWwindow*,void*);
    void* glfwGetWindowUserPointer(GLFWwindow*);
    GLFWwindowposfun glfwSetWindowPosCallback(GLFWwindow*,GLFWwindowposfun);
    GLFWwindowsizefun glfwSetWindowSizeCallback(GLFWwindow*,GLFWwindowsizefun);
    GLFWwindowclosefun glfwSetWindowCloseCallback(GLFWwindow*,GLFWwindowclosefun);
    GLFWwindowrefreshfun glfwSetWindowRefreshCallback(GLFWwindow*,GLFWwindowrefreshfun);
    GLFWwindowfocusfun glfwSetWindowFocusCallback(GLFWwindow*,GLFWwindowfocusfun);
    GLFWwindowiconifyfun glfwSetWindowIconifyCallback(GLFWwindow*,GLFWwindowiconifyfun);
    GLFWframebuffersizefun glfwSetFramebufferSizeCallback(GLFWwindow*,GLFWframebuffersizefun);
    void glfwPollEvents();
    void glfwWaitEvents();
    int glfwGetInputMode(GLFWwindow*,int);
    void glfwSetInputMode(GLFWwindow*,int,int);
    int glfwGetKey(GLFWwindow*,int);
    int glfwGetMouseButton(GLFWwindow*,int);
    void glfwGetCursorPos(GLFWwindow*,double*,double*);
    void glfwSetCursorPos(GLFWwindow*,double,double);
    GLFWkeyfun glfwSetKeyCallback(GLFWwindow*,GLFWkeyfun);
    GLFWcharfun glfwSetCharCallback(GLFWwindow*,GLFWcharfun);
    GLFWmousebuttonfun glfwSetMouseButtonCallback(GLFWwindow*,GLFWmousebuttonfun);
    GLFWcursorposfun glfwSetCursorPosCallback(GLFWwindow*,GLFWcursorposfun);
    GLFWcursorenterfun glfwSetCursorEnterCallback(GLFWwindow*,GLFWcursorenterfun);
    GLFWscrollfun glfwSetScrollCallback(GLFWwindow*,GLFWscrollfun);
    int glfwJoystickPresent(int);
    float* glfwGetJoystickAxes(int,int*);
    ubyte* glfwGetJoystickButtons(int,int*);
    const(char)* glfwGetJoystickName(int);
    void glfwSetClipboardString(GLFWwindow*,const(char)*);
    const(char)* glfwGetClipboardString(GLFWwindow*);
    double glfwGetTime();
    void glfwSetTime(double);
    void glfwMakeContextCurrent(GLFWwindow*);
    GLFWwindow* glfwGetCurrentContext();
    void glfwSwapBuffers(GLFWwindow*);
    void glfwSwapInterval(int);
    int glfwExtensionSupported(const(char)*);
    GLFWglproc glfwGetProcAddress(const(char)*);

    static if(glfwSupport >= GLFWSupport.glfw31) {
        void glfwGetWindowFrameSize(GLFWwindow*,int*,int*,int*,int*);
        void glfwPostEmptyEvent();
        GLFWcursor* glfwCreateCursor(const(GLFWimage)*,int,int);
        GLFWcursor* glfwCreateStandardCursor(int);
        void glfwDestroyCursor(GLFWcursor*);
        void glfwSetCursor(GLFWwindow*,GLFWcursor*);
        GLFWcharmodsfun glfwSetCharModsCallback(GLFWwindow*,GLFWcharmodsfun);
        GLFWdropfun glfwSetDropCallback(GLFWwindow*,GLFWdropfun);
    }

    static if(glfwSupport >= GLFWSupport.glfw32) {
        void glfwSetWindowIcon(GLFWwindow*,int,const(GLFWimage)*);
        void glfwSetWindowSizeLimits(GLFWwindow*,int,int,int,int);
        void glfwSetWindowAspectRatio(GLFWwindow*,int,int);
        void glfwMaximizeWindow(GLFWwindow*);
        void glfwFocusWindow(GLFWwindow*);
        void glfwSetWindowMonitor(GLFWwindow*,GLFWmonitor*,int,int,int,int,int);
        void glfwWaitEventsTimeout(double);
        const(char)* glfwGetKeyName(int,int);
        long glfwGetTimerValue();
        long glfwGetTimerFrequency();
        int glfwVulkanSupported();
        GLFWjoystickfun glfwSetJoystickCallback(GLFWjoystickfun);
    }

    static if(glfwSupport >= GLFWSupport.glfw33) {
        void glfwInitHint(int,int);
        int glfwGetError(const(char)**);
        void glfwGetMonitorWorkarea(GLFWmonitor*,int*,int*,int*,int*);
        void glfwGetMonitorContentScale(GLFWmonitor*,float*,float*);
        void glfwSetMonitorUserPointer(GLFWmonitor*r,void*);
        void* glfwGetMonitorUserPointer(GLFWmonitor*);
        void glfwWindowHintString(int,const(char)*);
        void glfwGetWindowContentScale(GLFWwindow*,float*,float*);
        float glfwGetWindowOpacity(GLFWwindow*);
        void glfwSetWindowOpacity(GLFWwindow*,float);
        void glfwRequestWindowAttention(GLFWwindow*);
        void glfwSetWindowAttrib(GLFWwindow*,int,int);
        GLFWwindowmaximizefun glfwSetWindowMaximizeCallback(GLFWwindow*,GLFWwindowmaximizefun);
        GLFWwindowcontentscalefun glfwSetWindowContentScaleCallback(GLFWwindow*,GLFWwindowcontentscalefun);
        int glfwGetKeyScancode(int);
        int glfwUpdateGamepadMappings(const(char)*);
        const(char)* glfwGetGamepadName(int);
        int glfwGetGamepadState(int,GLFWgamepadstate*);
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
            const(char)** glfwGetRequiredInstanceExtensions(uint*);
            GLFWvkproc glfwGetInstanceProcAddress(VkInstance,const(char)*);
            int glfwGetPhysicalDevicePresentationSupport(VkInstance,VkPhysicalDevice,uint);
            VkResult glfwCreateWindowSurface(VkInstance,GLFWwindow*,const(VkAllocationCallbacks)*,VkSurfaceKHR*);
        }
    };
}

// EGL
enum bindGLFW_EGL = q{
    extern(C) @nogc nothrow {
        EGLDisplay glfwGetEGLDisplay();
        EGLContext glfwGetEGLContext(GLFWwindow*);
        EGLSurface glfwGetEGLSurface(GLFWwindow*);
    }
};

version(Windows) {
    enum bindGLFW_WGL = q{
        extern(C) @nogc nothrow HGLRC glfwGetWGLContext(GLFWwindow*);
    };

    static if(glfwSupport >= GLFWSupport.glfw31) {
        enum bindGLFW_Windows = q{
            extern(C) @nogc nothrow {
                HWND glfwGetWin32Window(GLFWwindow*);
                const(char)* glfwGetWin32Adapter(GLFWmonitor*);
                const(char)* glfwGetWin32Monitor(GLFWmonitor*);
            }
        };
    }
    else enum bindGLFW_Windows= q{
            extern(C) @nogc nothrow HWND glfwGetWin32Window(GLFWwindow*);
    };
}

version(OSX) {
    enum bindGLFW_NSGL = q{
        extern(C) @nogc nothrow id glfwGetNSGLContext(GLFWwindow*);
    };

    static if(glfwSupport >= GLFWSupport.glfw31) {
        enum bindGLFW_Cocoa = q{
            extern(C) @nogc nothrow {
                CGDirectDisplayID glfwGetCocoaMonitor(GLFWmonitor*);
                id glfwGetCocoaWindow(GLFWwindow*);
            }
        };
    }
    else enum bindGLFW_Cocoa = q{
        extern(C) @nogc nothrow id glfwGetCocoaWindow(GLFWwindow*);
    };
}
else version(Android) {}
else version(Posix) {
    // X11
    static if(glfwSupport >= GLFWSupport.glfw32) {
        enum bindGLFW_GLX = q{
            extern(C) @nogc nothrow {
                GLXContext glfwGetGLXContext(GLFWwindow*);
                GLXwindow glfwGetGLXWindow(GLFWwindow*);
            }
        };
    }
    else enum bindGLFW_GLX = q{
        extern(C) @nogc nothrow GLXContext glfwGetGLXContext(GLFWwindow*);
    };
    static if(glfwSupport >= GLFWSupport.glfw33) {
        enum bindGLFW_X11 = q{
            extern(C) @nogc nothrow {
                Display* glfwGetX11Display();
                Window glfwGetX11Window(GLFWwindow*);
                RRCrtc glfwGetX11Adapter(GLFWmonitor*);
                RROutput glfwGetX11Monitor(GLFWmonitor*);
                void glfwSetX11SelectionString(const(char)*);
                const(char)* glfwGetX11SelectionString();
            }
        };
    }
    else static if(glfwSupport >= GLFWSupport.glfw31) {
        enum bindGLFW_X11 = q{
            extern(C) @nogc nothrow {
                Display* glfwGetX11Display();
                Window glfwGetX11Window(GLFWwindow*);
                RRCrtc glfwGetX11Adapter(GLFWmonitor*);
                RROutput glfwGetX11Monitor(GLFWmonitor*);
            }
        };
    }
    else enum bindGLFW_X11 = q{
        extern(C) @nogc nothrow {
            Display* glfwGetX11Display();
            Window glfwGetX11Window(GLFWwindow*);
        }
    };

    // Wayland
    static if(glfwSupport >= GLFWSupport.glfw32) {
        enum bindGLFW_Wayland = q{
            extern(C) @nogc nothrow {
                wl_display* glfwGetWaylandDisplay();
                wl_output* glfwGetWaylandMonitor(GLFWmonitor*);
                wl_surface* glfwGetWaylandWindow(GLFWwindow*);
            }
        };
    }

    // Mir
    // Removed in GLFW 3.3
    static if(glfwSupport == GLFWSupport.glfw32) {
        enum bindGLFW_Mir = q{
            extern(C) @nogc nothrow {
                MirConnection* glfwGetMirDisplay();
                int glfwGetMirMonitor(GLFWmonitor*);
                MirSurface* glfwGetMirWindow(GLFWwindow*);
            }
        };
    }
}
