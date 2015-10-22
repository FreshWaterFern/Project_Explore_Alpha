/// init_open_exe()
/*
    Call this script just once at the start of your game
*/
global._OpenExe = external_define("OpenExe.dll", "OpenExe", dll_cdecl, ty_real, 1, ty_string);