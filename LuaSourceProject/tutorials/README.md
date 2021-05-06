# How to do?



1. Build static library; [excluding lua.c,luac.c and lua.h] ---> Preporcessor(definitions)->_CRT_SECURE_NO_WARNINGS && Static Lib && Win64 || x86(Win32) && Release || Debug. 
2. Build execution file; [including all the header files with lua.c only] ---> Preporcessor(definitions)->_CRT_SECURE_NO_WARNINGS && Application .exe && Linker/Input==/*CreatedLibrary*/.lib && Linker/Genral/Additional Linker Directories==/*The path of created library*/ && Win64 || x86(Win32) && Release || Debug.
3. Fruit is the `ProjectName.exe` which is runnable on targeted platform. Usable also along with the library files as Windows Environment.







by Alexander Ezharjan