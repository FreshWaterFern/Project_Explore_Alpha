/// world_data_load(File)

// -- -- -- -- Open .ini File -- -- -- -- \\
var buff1 = buffer_load(string(argument0));
buffer_seek(buff1,buffer_seek_start,8);

// -- -- -- -- Load Game Version -- -- -- -- \\
var version = buffer_read(buff1,buffer_string);

// -- -- -- -- Load Player Data -- -- -- -- \\
global.char_hair_style = buffer_read(buff1,buffer_s16);
global.char_hair_color = buffer_read(buff1,buffer_s16);
global.char_shirt = buffer_read(buff1,buffer_s16);
global.char_skin = buffer_read(buff1,buffer_s16);
global.char_legs = buffer_read(buff1,buffer_s16);
global.clothing_body = buffer_read(buff1,buffer_string);
global.clothing_head = buffer_read(buff1,buffer_string);


obj_game.v_hotbar_set = buffer_read(buff1,buffer_s8);
obj_player.x = buffer_read(buff1,buffer_f32);
obj_player.y = buffer_read(buff1,buffer_f32);
obj_game.x = obj_player.x;
obj_game.y = obj_player.y;
view_xview[0] = obj_player.x-640;
view_yview[0] = obj_player.y-360;
obj_camera.x = obj_player.x;
obj_camera.y = obj_player.y;
global.pl_bleeding = buffer_read(buff1,buffer_f32);
obj_game.c_food = buffer_read(buff1,buffer_f32);
obj_game.c_thirst = buffer_read(buff1,buffer_f32);
obj_game.c_health = buffer_read(buff1,buffer_f32);
obj_game.c_sanity = buffer_read(buff1,buffer_f32);
global.fishing_multiplier = buffer_read(buff1,buffer_f32);
global.distance_travelled = buffer_read(buff1,buffer_f32);
global.wolves_killed = buffer_read(buff1,buffer_u32);
global.bears_killed = buffer_read(buff1,buffer_u32);
global.bucks_killed = buffer_read(buff1,buffer_u32);
global.stalkers_killed = buffer_read(buff1,buffer_u32);
global.rippers_killed = buffer_read(buff1,buffer_u32);
global.fish_caught = buffer_read(buff1,buffer_u32);
global.trees_cut = buffer_read(buff1,buffer_u32);
global.rocks_cut = buffer_read(buff1,buffer_u32);
global.world_time = buffer_read(buff1,buffer_f32);
global.world_days = buffer_read(buff1,buffer_u32);
obj_game_weather.rain_active = buffer_read(buff1,buffer_bool);
obj_game_weather.rain_ini = buffer_read(buff1,buffer_s32);
obj_game_weather.rain_time = buffer_read(buff1,buffer_s32);
obj_game_weather.previous_temperature = buffer_read(buff1,buffer_f32);
global.weather_mode = buffer_read(buff1,buffer_u8);
global.world_temperature_base = buffer_read(buff1,buffer_f32);
global.waypoint_x = buffer_read(buff1,buffer_f32);
global.waypoint_y = buffer_read(buff1,buffer_f32);
ds_list_read(global.equip_list,buffer_read(buff1,buffer_string));
ds_list_read(global.waypoint_data_x,buffer_read(buff1,buffer_string));
ds_list_read(global.waypoint_data_y,buffer_read(buff1,buffer_string));
ds_list_read(global.waypoint_data_name,buffer_read(buff1,buffer_string));
ds_grid_read(global.c_inventory_pack,buffer_read(buff1,buffer_string));
ds_grid_read(global.c_stack_pack,buffer_read(buff1,buffer_string));

// Play audio for weather
if ( global.weather_mode == 1 )
{
if ( audio_is_playing(snd_rain_loop1) == false )
{
audio_play_sound(snd_rain_loop1,3,true);
}
}

// -- -- -- -- Load World Data -- -- -- -- \\
ds_grid_read(global.world_chunks,buffer_read(buff1,buffer_string));
ds_grid_read(global.world_biomes,buffer_read(buff1,buffer_string));
ds_list_read(global.w_obj_index,buffer_read(buff1,buffer_string));
ds_list_read(global.w_obj_x,buffer_read(buff1,buffer_string));
ds_list_read(global.w_obj_y,buffer_read(buff1,buffer_string));
ds_list_read(global.w_obj_var1,buffer_read(buff1,buffer_string));
ds_list_read(global.w_obj_var2,buffer_read(buff1,buffer_string));
ds_list_read(global.w_obj_var3,buffer_read(buff1,buffer_string));
ds_list_read(global.w_obj_var4,buffer_read(buff1,buffer_string));
ds_list_read(global.w_obj_angle,buffer_read(buff1,buffer_string));
//ds_grid_read(global.world_tiles,buffer_read(buff1,buffer_string));
global.world_tiles=world_read_compressed(string_delete(argument0,string_length(argument0)-3,5)+".world");
ds_list_read(global.ai_xdecal,buffer_read(buff1,buffer_string));
ds_list_read(global.ai_ydecal,buffer_read(buff1,buffer_string));
ds_list_read(global.ai_sdecal,buffer_read(buff1,buffer_string));

// -- -- -- -- Close .ini File -- -- -- -- \\
buffer_delete(buff1);

// Place objects based on data structures

i = 0;
r = 0;
var temp_list = ds_list_create();
var scale = 0;
var obj_name = "";
var inst = 0;//show_message(string(ds_list_find_value(global.w_obj_index,i)));
for(i=0;i<ds_list_size(global.w_obj_index);i++)
{
    inst = instance_create(ds_list_find_value(global.w_obj_x,i),ds_list_find_value(global.w_obj_y,i),objind(asset_get_index(string(ds_list_find_value(global.w_obj_index,i)))));
    if ( instance_exists(inst) )
    {
    ds_list_add(global.w_obj_id,inst);
    inst.image_angle = real(ds_list_find_value(global.w_obj_angle,i)); // image_angle
    obj_name = object_get_name(inst.object_index);
    switch(obj_name)
    {
        case "obj_world_tree_1":{
        inst.resource_count = real(ds_list_find_value(global.w_obj_var1,i)); // resource_count
        inst.height = real(ds_list_find_value(global.w_obj_var2,i)); // height
        inst.tree_top_sub = real(ds_list_find_value(global.w_obj_var3,i)); // tree_top_sub
        inst.tree_top_rot = real(ds_list_find_value(global.w_obj_var4,i)); // tree_top_rot
        break;
        }
        case "obj_world_rock_1":{
        inst.sprite_index = asset_get_index(string(ds_list_find_value(global.w_obj_var1,i))); // sprite_index
        inst.direction = real(ds_list_find_value(global.w_obj_var2,i)); // direction
        scale = real(ds_list_find_value(global.w_obj_var3,i)); // scale
        inst.scale_x = scale;inst.scale_y = scale;
        inst.resource_count = real(ds_list_find_value(global.w_obj_var4,i)); // resource_count
        break;
        }
        case "obj_world_rock_2":{
        inst.sprite_index = asset_get_index(string(ds_list_find_value(global.w_obj_var1,i))); // sprite_index
        inst.direction = real(ds_list_find_value(global.w_obj_var2,i)); // direction
        scale = real(ds_list_find_value(global.w_obj_var3,i)); // scale
        inst.scale_x = scale;inst.scale_y = scale;
        inst.resource_count = real(ds_list_find_value(global.w_obj_var4,i)); // resource_count
        break;
        }
        case "obj_construct_wall":{
        inst.construct_health = real(ds_list_find_value(global.w_obj_var1,i)); // resource_count
        break;
        }
        case "obj_construct_pillar":{
        inst.construct_health = real(ds_list_find_value(global.w_obj_var1,i)); // resource_count
        break;
        }
        case "obj_construct_doorway":{
        inst.construct_health = real(ds_list_find_value(global.w_obj_var1,i)); // resource_count
        break;
        }
        case "obj_construct_door":{
        inst.construct_health = real(ds_list_find_value(global.w_obj_var1,i)); // resource_count
        inst.door_locked = real(ds_list_find_value(global.w_obj_var2,i)); // door_locked
        inst.door_construct = real(ds_list_find_value(global.w_obj_var3,i)); // door_construct
        break;
        }
        case "obj_construct_fence":{
        inst.construct_health = real(ds_list_find_value(global.w_obj_var1,i)); // resource_count
        break;
        }
        case "obj_construct_flag":{
        inst.waypoint_name = string(ds_list_find_value(global.w_obj_var1,i));// waypoint_name
        inst.waypoint_index = string(ds_list_find_value(global.w_obj_var2,i));// waypoint_index
        inst.flag_color = real(ds_list_find_value(global.w_obj_var3,i)); // flag_color
        break;
        }
        case "obj_npc_wolf":{
        ds_list_read(temp_list,string(ds_list_find_value(global.w_obj_var1,i)));
        inst.npc_food=temp_list[| 0];inst.npc_thirst=temp_list[| 1];
        inst.npc_health=temp_list[| 2];inst.npc_anger=temp_list[| 3];
        inst.npc_fear=temp_list[| 4];inst.npc_heat=temp_list[| 5];
        inst.ai_dead=temp_list[| 6];inst.death_frames=temp_list[| 7];
        ds_list_clear(temp_list);
        break;
        }
        case "obj_npc_bear":{
        ds_list_read(temp_list,string(ds_list_find_value(global.w_obj_var1,i)));
        inst.npc_food=temp_list[| 0];inst.npc_thirst=temp_list[| 1];
        inst.npc_health=temp_list[| 2];inst.npc_anger=temp_list[| 3];
        inst.npc_fear=temp_list[| 4];inst.npc_heat=temp_list[| 5];
        inst.ai_dead=temp_list[| 6];inst.death_frames=temp_list[| 7];
        ds_list_clear(temp_list);
        break;
        }
        case "obj_ai_nomadstalker":{
        inst.npc_health = real(ds_list_find_value(global.w_obj_var1,i)); // npc_health
        inst.ai_spawn_resource = real(ds_list_find_value(global.w_obj_var2,i)); // ai_spawn_resource
        break;
        }
        case "obj_ai_nomadripper":{
        inst.npc_health = string(ds_list_find_value(global.w_obj_var1,i)); // npc_health
        inst.ai_spawn_resource = real(ds_list_find_value(global.w_obj_var2,i)); // ai_spawn_resource
        break;
        }
        case "obj_npc_buck":{
        ds_list_read(temp_list,string(ds_list_find_value(global.w_obj_var1,i)));
        inst.npc_food=temp_list[| 0];inst.npc_thirst=temp_list[| 1];
        inst.npc_health=temp_list[| 2];inst.npc_anger=temp_list[| 3];
        inst.npc_fear=temp_list[| 4];inst.npc_heat=temp_list[| 5];
        inst.ai_dead=temp_list[| 6];inst.death_frames=temp_list[| 7];
        ds_list_clear(temp_list);
        break;
        }
        case "obj_plant":{
        inst.plant_type = real(ds_list_find_value(global.w_obj_var1,i)); // plant_type
        inst.plant_state = real(ds_list_find_value(global.w_obj_var2,i)); // plant_state
        break;
        }
        case "obj_smallcrate":{
        with(inst)
        {
        ds_grid_read(c_inv,string(ds_list_find_value(global.w_obj_var1,other.i))); // c_inv
        ds_grid_read(c_stack,string(ds_list_find_value(global.w_obj_var2,other.i))); // c_stack
        }
        break;
        }
        case "obj_largecrate":{
        with(inst)
        {
        ds_grid_read(c_inv,string(ds_list_find_value(global.w_obj_var1,other.i))); // c_inv
        ds_grid_read(c_stack,string(ds_list_find_value(global.w_obj_var2,other.i))); // c_stack
        }
        break;
        }
        case "obj_dead_skeleton1":{
        with(inst)
        {
        ds_grid_read(c_inv,string(ds_list_find_value(global.w_obj_var1,other.i))); // c_inv
        ds_grid_read(c_stack,string(ds_list_find_value(global.w_obj_var2,other.i))); // c_stack
        }
        break;
        }
        case "obj_furn_table1":{
        with(inst)
        {
        ds_grid_read(c_inv,string(ds_list_find_value(global.w_obj_var1,other.i))); // c_inv
        ds_grid_read(c_stack,string(ds_list_find_value(global.w_obj_var2,other.i))); // c_stack
        }
        break;
        }
        case "obj_furn_forgetable":{
        with(inst)
        {
        ds_grid_read(c_inv,string(ds_list_find_value(global.w_obj_var1,other.i))); // c_inv
        ds_grid_read(c_stack,string(ds_list_find_value(global.w_obj_var2,other.i))); // c_stack
        }
        break;
        }
        case "obj_furn_deconstructtable":{
        with(inst)
        {
        ds_grid_read(c_inv,string(ds_list_find_value(global.w_obj_var1,other.i))); // c_inv
        ds_grid_read(c_stack,string(ds_list_find_value(global.w_obj_var2,other.i))); // c_stack
        }
        break;
        }
        case "obj_furn_woodchest1":{
        with(inst)
        {
        ds_grid_read(c_inv,string(ds_list_find_value(global.w_obj_var1,other.i))); // c_inv
        ds_grid_read(c_stack,string(ds_list_find_value(global.w_obj_var2,other.i))); // c_stack
        }
        break;
        }
        case "obj_item_dropped":{
        inst.item_id = real(ds_list_find_value(global.w_obj_var1,other.i)); // item_id
        inst.item_stack = real(ds_list_find_value(global.w_obj_var2,other.i)); // item_stack
        break;
        }
        case "obj_campfire":{
        inst.is_enabled = real(ds_list_find_value(global.w_obj_var1,i)); // is_enabled
        with(inst)
        {
        ds_grid_read(c_inv,string(ds_list_find_value(global.w_obj_var2,other.i))); // c_inv
        ds_grid_read(c_stack,string(ds_list_find_value(global.w_obj_var3,other.i))); // c_stack
        }
        inst.burn_time = real(ds_list_find_value(global.w_obj_var4,i)); // burn_time
        break;
        }
        case "obj_bigfire":{
        inst.is_enabled = real(ds_list_find_value(global.w_obj_var1,i)); // is_enabled
        with(inst)
        {
        ds_grid_read(c_inv,string(ds_list_find_value(global.w_obj_var2,other.i))); // c_inv
        ds_grid_read(c_stack,string(ds_list_find_value(global.w_obj_var3,other.i))); // c_stack
        }
        inst.burn_time = real(ds_list_find_value(global.w_obj_var4,i)); // burn_time
        break;
        }
        case "obj_lantern":{
        inst.is_enabled = real(ds_list_find_value(global.w_obj_var1,i)); // is_enabled
        break;
        }
        case "obj_env_plant1":{
        inst.leaf_status = real(ds_list_find_value(global.w_obj_var1,i)); // leaf_status
        break;
        }
        case "obj_env_plant2":{
        inst.leaf_status = real(ds_list_find_value(global.w_obj_var1,i)); // leaf_status
        break;
        }
        case "obj_env_plant3":{
        inst.leaf_status = real(ds_list_find_value(global.w_obj_var1,i)); // leaf_status
        break;
        }
        case "obj_env_bush1":{
        inst.leaf_status = real(ds_list_find_value(global.w_obj_var1,i)); // leaf_status
        break;
        }
    }
    }
}

ds_list_destroy(temp_list);
