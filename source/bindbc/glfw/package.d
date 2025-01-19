/+
+            Copyright 2023 – 2025 Aya Partridge
+          Copyright 2018 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.glfw;

public import bindbc.glfw.types;

static if(staticBinding){
	public import bindbc.glfw.bindstatic;
}else{
	public import bindbc.glfw.binddynamic;
}
