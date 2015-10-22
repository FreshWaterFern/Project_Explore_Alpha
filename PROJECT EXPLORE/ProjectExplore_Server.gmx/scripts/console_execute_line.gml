/// console_execute_line(string)
var command_str = argument0;
var str_pos1 = string_pos(" ",argument0);
command_str = string_delete(argument0,str_pos1,string_length(argument0));
switch(command_str)
{
    case "edit_ip":
    {
    var input_str = string_delete(argument0,1,str_pos1);
    global.server_ip = input_str;
    ini_open("server_info.ini");
    ini_write_string("server","public_ip",string(input_str));
    ini_close();
    console_add("Server IP changed to "+input_str);
    break;
    }
    case "edit_port":
    {
    var input_str = string_delete(argument0,1,str_pos1);
    port = input_str;
    ini_open("server_info.ini");
    ini_write_string("server","port",string(input_str));
    ini_close();
    console_add("Server port changed to "+input_str);
    break;
    }
    case "save":
    {
    console_add("Saving server...");
    // Run Save Script
    console_add("Server save complete");
    break;
    }
    case "close":
    case "quit":
    case "exit":
    {
    console_add("Closing server...");
    game_end();
    break;
    }
    default:
    {
    console_add("Command error");
    }
}
