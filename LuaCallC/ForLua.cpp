#include <iostream>  
using namespace std;

extern "C" {
#include "lua_src/lua.h"  
#include "lua_src/lualib.h"  
#include "lua_src/lauxlib.h"
};

extern "C" int ShowMsg(lua_State * luaEnv) {
	cout << "Hello world from C++ library!" << endl;
	return 0; // 没有返回值
}

static int GetAverage(lua_State* L)
{
	int n = lua_gettop(L);
	double sum = 0;
	int i;
	for (i = 1; i <= n; i++)
	{
		sum += lua_tonumber(L, i);
	}
	lua_pushnumber(L, sum / n);
	lua_pushnumber(L, sum);
	return 2; // 有两个返回值
}

// part one: 要导出的函数列表
static luaL_Reg luaLibs[] = {
	{ "ShowMsg", ShowMsg},
	{ "GetAverage", GetAverage},
	{ NULL, NULL }
};

// part two: DLL入口函数，Lua调用此DLL的入口函数.  
extern "C" __declspec(dllexport)
int luaopen_AlexLib(lua_State * luaEnv) {   //WinFeature是modole名, 将来require这个名字
	const char* const LIBRARY_NAME = "AlexLib"; //这里也写WinFeature
	luaL_register(luaEnv, LIBRARY_NAME, luaLibs);  //关键一行, 在luaState上注册好这个lib
	return 1;
}