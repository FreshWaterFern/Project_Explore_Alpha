/// world_data_save(string)

// Save Data Structures
if ( os_type == os_windows )
{
var add_save = "";
var str1 = file_find_first(string(argument0),0);
if ( string_count(".sav",str1) == 0 )
{str1 = ".sav";}
else
{str1 = "";}
file_find_close();
if ( file_exists(string(argument0)+string(str1)) == true )
{file_delete(string(argument0)+string(str1));}
}
else
{
if ( os_type != os_windows )
{
str1 = "";
}
var slot_found = false;
if ( string_pos(".sav",argument0) == 0 ){var add_save = ".sav";}else{var add_save = "";}
//show_message(string(argument0+add_save));
ini_open("save_index.ini");
if ( ini_read_string("data","save1","") != "" or ini_read_string("data","save1","") == argument0+add_save )
{ini_write_string("data","save1",argument0+add_save);slot_found = true;}else{ini_write_string("data","save1","");}
if ( ini_read_string("data","save2","") != "" && slot_found == false or ini_read_string("data","save2","") == argument0+add_save )
{ini_write_string("data","save2",argument0+add_save);slot_found = true;}else{ini_write_string("data","save2","");}
if ( ini_read_string("data","save3","") != "" && slot_found == false or ini_read_string("data","save3","") == argument0+add_save )
{ini_write_string("data","save3",argument0+add_save);slot_found = true;}else{ini_write_string("data","save3","");}
if ( ini_read_string("data","save4","") != "" && slot_found == false or ini_read_string("data","save4","") == argument0+add_save )
{ini_write_string("data","save4",argument0+add_save);slot_found = true;}else{ini_write_string("data","save4","");}
if ( ini_read_string("data","save5","") != "" && slot_found == false or ini_read_string("data","save5","") == argument0+add_save )
{ini_write_string("data","save5",argument0+add_save);slot_found = true;}else{ini_write_string("data","save5","");}
if ( ini_read_string("data","save6","") != "" && slot_found == false or ini_read_string("data","save6","") == argument0+add_save )
{ini_write_string("data","save6",argument0+add_save);slot_found = true;}else{ini_write_string("data","save6","");}
if ( ini_read_string("data","save7","") != "" && slot_found == false or ini_read_string("data","save7","") == argument0+add_save )
{ini_write_string("data","save7",argument0+add_save);slot_found = true;}else{ini_write_string("data","save7","");}
if ( ini_read_string("data","save8","") != "" && slot_found == false or ini_read_string("data","save8","") == argument0+add_save )
{ini_write_string("data","save8",argument0+add_save);slot_found = true;}else{ini_write_string("data","save8","");}
if ( ini_read_string("data","save9","") != "" && slot_found == false or ini_read_string("data","save9","") == argument0+add_save )
{ini_write_string("data","save9",argument0+add_save);slot_found = true;}else{ini_write_string("data","save9","");}
ini_write_string("data","save1",argument0+add_save);
ini_close();
}

var buff1 = buffer_create(64,buffer_grow,1);

// -- -- -- -- Save Game Version -- -- -- -- \\

buffer_write(buff1,buffer_u32,real(room_width));
buffer_write(buff1,buffer_u32,real(room_height));
buffer_write(buff1,buffer_string,"Version: 0.2.1.2");
buffer_write(buff1,buffer_s16,global.char_hair_style);
buffer_write(buff1,buffer_s16,global.char_hair_color);
buffer_write(buff1,buffer_s16,global.char_shirt);
buffer_write(buff1,buffer_s16,global.char_skin);
buffer_write(buff1,buffer_s16,global.char_legs);
buffer_write(buff1,buffer_string,string(global.clothing_body));
buffer_write(buff1,buffer_string,string(global.clothing_head));
buffer_write(buff1,buffer_s8,obj_game.v_hotbar_set);
buffer_write(buff1,buffer_f32,obj_game.x); // Player Position X
buffer_write(buff1,buffer_f32,obj_game.y); // Player Position Y
buffer_write(buff1,buffer_f32,global.pl_bleeding);
buffer_write(buff1,buffer_f32,obj_game.c_food); // Food
buffer_write(buff1,buffer_f32,obj_game.c_thirst); // Thirst
buffer_write(buff1,buffer_f32,obj_game.c_health); // Health
buffer_write(buff1,buffer_f32,obj_game.c_sanity); // Sanity
buffer_write(buff1,buffer_f32,global.fishing_multiplier);
buffer_write(buff1,buffer_f32,global.distance_travelled);
buffer_write(buff1,buffer_u32,global.wolves_killed);
buffer_write(buff1,buffer_u32,global.bears_killed);
buffer_write(buff1,buffer_u32,global.bucks_killed);
buffer_write(buff1,buffer_u32,global.stalkers_killed);
buffer_write(buff1,buffer_u32,global.rippers_killed);
buffer_write(buff1,buffer_u32,global.fish_caught);
buffer_write(buff1,buffer_u32,global.trees_cut);
buffer_write(buff1,buffer_u32,global.rocks_cut);
buffer_write(buff1,buffer_f32,global.world_time); // Time Of Day
buffer_write(buff1,buffer_u32,global.world_days); // Days Passed
buffer_write(buff1,buffer_bool,obj_game_weather.rain_active); // Rain Active
buffer_write(buff1,buffer_s32,obj_game_weather.rain_ini);
buffer_write(buff1,buffer_s32,obj_game_weather.rain_time);
buffer_write(buff1,buffer_f32,obj_game_weather.previous_temperature);
buffer_write(buff1,buffer_u8,global.weather_mode);
buffer_write(buff1,buffer_f32,global.world_temperature_base);
buffer_write(buff1,buffer_f32,global.waypoint_x);
buffer_write(buff1,buffer_f32,global.waypoint_y);
buffer_write(buff1,buffer_string,ds_list_write(global.equip_list));
buffer_write(buff1,buffer_string,ds_list_write(global.waypoint_data_x));
buffer_write(buff1,buffer_string,ds_list_write(global.waypoint_data_y));
buffer_write(buff1,buffer_string,ds_list_write(global.waypoint_data_name));
buffer_write(buff1,buffer_string,ds_grid_write(global.c_inventory_pack));
buffer_write(buff1,buffer_string,ds_grid_write(global.c_stack_pack));
buffer_write(buff1,buffer_string,ds_grid_write(global.world_chunks));
buffer_write(buff1,buffer_string,ds_grid_write(global.world_biomes));
buffer_write(buff1,buffer_string,ds_list_write(global.w_obj_index));
buffer_write(buff1,buffer_string,ds_list_write(global.w_obj_x));
buffer_write(buff1,buffer_string,ds_list_write(global.w_obj_y));
buffer_write(buff1,buffer_string,ds_list_write(global.w_obj_var1));
buffer_write(buff1,buffer_string,ds_list_write(global.w_obj_var2));
buffer_write(buff1,buffer_string,ds_list_write(global.w_obj_var3));
buffer_write(buff1,buffer_string,ds_list_write(global.w_obj_var4));
buffer_write(buff1,buffer_string,ds_list_write(global.w_obj_angle));
//buffer_write(buff1,buffer_string,ds_grid_write(global.world_tiles));
buffer_write(buff1,buffer_string,ds_list_write(global.ai_xdecal));
buffer_write(buff1,buffer_string,ds_list_write(global.ai_ydecal));
buffer_write(buff1,buffer_string,ds_list_write(global.ai_sdecal));
if ( obj_game.autosave_time != 0 ){
file_delete(string(argument0+add_save));
buffer_save(buff1,argument0+add_save);}else{
file_delete(argument0+add_save);
buffer_save(buff1,argument0+add_save);}
buffer_delete(buff1);
var str2 = string_replace(argument0+add_save,".sav",".world");
world_write_compressed(global.world_tiles,str2);
//show_message(string(str2));
