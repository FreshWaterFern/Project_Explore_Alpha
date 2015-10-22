// [Function] execute_program_ex(prog, arg, wait)
// [Description] executes a specified program.
// [Inputs]
//  argument0 : path to the program to exexute.
//  argument1 : arguments to the program.
//  argument2 : if set to true, the function waits for finishing of the program.
// [Return value]
//  Returns true (1) when the programm successfully started,
//  otherwise returns false (0)
// (you can get the cause of the error with execute_ex_get_error.)
// [Example]
//  execute_program_ex('calc.exe', '', true);
// [See also]
//  You can set several options with the following functions:
//  execute_ex_set_directory to set the working directory for the program.
//  execute_ex_set_showmode to run the program maximized, minimized or hidden.
//  execute_ex_set_position to set the window position of the program.
//  execute_ex_set_size to set the window size of the program.
// function execute_program_ex(prog, arg: PChar; wait: Double): Double; stdcall;
global.__execute_program_ex__ = external_define('ExecuteEx.dll', 'execute_program_ex', dll_stdcall, ty_real, 3, ty_string, ty_string, ty_real);
return external_call(global.__execute_program_ex__, argument0, argument1, argument2);