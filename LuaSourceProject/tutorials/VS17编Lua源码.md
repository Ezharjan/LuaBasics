# Visual Studio 2017编译Lua源代码
准备工作

需要带有C++开发组件的Visual Studio
需要Lua源代码（下载页面）
下载得到的Lua源代码是一个tar.gz格式的压缩包，提取出其中的 src 文件夹，这个文件夹中包含了 Lua解释器 、 Lua编译器 和 Lua链接库 的源代码。

编译Lua解释器（lua.exe）
打开Visual Studio，新建一个 Visual C++空项目 ，项目名称为Lua。
打开 项目属性页 ，设置 目标平台（Win32或x64），在 配置属性-常规-项目默认值 中选择 配置类型 为 应用程序(.exe) ，保存更改。
将从Lua源代码压缩包中提取的 src 文件夹复制到项目文件夹中，在 解决方案资源管理器 菜单栏中勾选 显示所有文件 ，然后选择 src 文件夹，通过右键菜单中的 包括在项目中 选项将 src 文件夹添加到项目中。
展开 src 文件夹，选中文件 luac.c ，通过右键菜单的 从项目中排除 选项将文件 luac.c 从项目中移除。
在Visual Studio菜单栏中选择 生成-生成 Lua 来生成可执行程序。
可执行文件的生成位置：

32位：Lua/Release/
64位：Lua/x64/Release/
编译Lua编译器（luac.exe）
打开Visual Studio，新建一个 Visual C++空项目 ，项目名称为Luac。
打开 项目属性页 ，设置 目标平台（Win32或x64），在 配置属性-常规-项目默认值 中选择 配置类型 为 应用程序(.exe) ，保存更改。
将从Lua源代码压缩包中提取的 src 文件夹复制到项目文件夹中，在 解决方案资源管理器 菜单栏中勾选 显示所有文件 ，然后选择 src 文件夹，通过右键菜单中的 包括在项目中 选项将 src 文件夹添加到项目中。
展开 src 文件夹，选中文件 lua.c ，通过右键菜单的 从项目中排除 选项将文件 lua.c 从项目中移除。
在Visual Studio菜单栏中选择 生成-生成 Luac 来生成可执行程序。
可执行文件的生成位置：

32位：Luac/Release/
64位：Luac/x64/Release/
编译Lua链接库（lua.dll或lua.lib）
打开Visual Studio，新建一个 Visual C++空项目 ，项目名称为LuaDll（或LuaLib）。
打开 项目属性页 ，设置 目标平台（Win32或x64），在 配置属性-常规-项目默认值 中选择 配置类型 为 动态库(.dll) （或 静态库(.lib) ），保存更改。
将从Lua源代码压缩包中提取的 src 文件夹复制到项目文件夹中，在 解决方案资源管理器 菜单栏中勾选 显示所有文件 ，然后选择 src 文件夹，通过右键菜单中的 包括在项目中 选项将 src 文件夹添加到项目中。
展开 src 文件夹，选中文件 lua.c 、 luac.c 、 lua.hpp ，通过右键菜单的 从项目中排除 选项将文件 lua.c 、 luac.c 、 lua.hpp 从项目中移除。
在Visual Studio菜单栏中选择 生成-生成 LuaDll （或 生成-生成 LuaLib ）来生成可链接库。
链接库的生成位置：

32位：LuaDll/Release/
64位：LuaDll/x64/Release/