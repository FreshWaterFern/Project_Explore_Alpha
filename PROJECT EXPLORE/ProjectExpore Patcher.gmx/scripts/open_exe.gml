/// open_exe(.exe)
/*
    Returns 1 on success
    Returns 0 on failure
*/
if(is_string(argument0))
    return external_call(global._OpenExe, argument0);
else
    show_message_async("open_exe argument must be a string!");
