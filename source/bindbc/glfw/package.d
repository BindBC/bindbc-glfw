
//          Copyright Michael D. Parker 2018.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.glfw;

public import bindbc.glfw.types;

version(BindBC_Static) version = BindGLFW_Static;
version(BindGLFW_Static) public import bindbc.glfw.bindstatic;
else public import bindbc.glfw.binddynamic;