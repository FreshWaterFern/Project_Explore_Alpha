/// world_data_load(File)

var time_track = get_timer();
file_log_write("Game load initiated| file: "+string(argument0)+" |"); // Log File Usage

var i = 0;var r = 0;
var temp_list = ds_list_create();
var list_copy = ds_list_create();
var list_size = 0;var scale = 0;
var obj_name = "";var inst = 0;
var list_cache = 0;

var file = file_text_open_read(argument0);

// -- Build Version [BEGIN] -- \\
var get_version = file_text_read_string(file);file_text_readln(file);
if ( get_version != GAME_VERSION ){
file_log_write("Save file is from version ("+string(get_version)+"), out-of-date, build version is "+string(GAME_VERSION));} // Log File Usage
// -- Build Version [END] -- \\

// -- World Size [BEGIN] -- \\
repeat(3){file_text_readln(file);} // Skip this part, we don't need it right now
// -- World Size [END] -- \\

// -- Player Variables [BEGIN] -- \\
file_text_readln(file);
global.clothing_body = file_text_read_string(file);file_text_readln(file);
global.clothing_head = file_text_read_string(file);file_text_readln(file);
global.char_hair_style = file_text_read_real(file);file_text_readln(file);
global.char_hair_color = file_text_read_real(file);file_text_readln(file);
global.char_hair_shirt = file_text_read_real(file);file_text_readln(file);
global.char_hair_skin = file_text_read_real(file);file_text_readln(file);
global.char_hair_legs = file_text_read_real(file);file_text_readln(file);
obj_game.v_hotbar_set = file_text_read_real(file);file_text_readln(file);
obj_game.x = file_text_read_real(file);file_text_readln(file);
obj_game.y = file_text_read_real(file);file_text_readln(file);
global.pl_bleeding = file_text_read_real(file);file_text_readln(file);
obj_game.c_food = file_text_read_real(file);file_text_readln(file);
obj_game.c_thirst = file_text_read_real(file);file_text_readln(file);
obj_game.c_health = file_text_read_real(file);file_text_readln(file);
obj_game.c_sanity = file_text_read_real(file);file_text_readln(file);
global.waypoint_x = file_text_read_real(file);file_text_readln(file);
global.waypoint_y = file_text_read_real(file);file_text_readln(file);
file_text_readln(file); // Equip list size goes here, size = 2
global.equip_list[|0] = file_text_read_real(file);file_text_readln(file);
global.equip_list[|1] = file_text_read_real(file);file_text_readln(file);

list_cache = convert_string_to_list(file_text_read_string(file),",");file_text_readln(file);
global.c_inventory_pack = convert_list_to_grid_real(list_cache,7,5);ds_list_destroy(list_cache);

list_cache = convert_string_to_list(file_text_read_string(file),",");file_text_readln(file);
global.c_stack_pack = convert_list_to_grid_real(list_cache,7,5);ds_list_destroy(list_cache);
// -- Player Variables [END] -- \\
/*
list_size = file_text_read_real(file);file_text_readln(file);

var i = 0;
for(i=0;i<list_size;i++){
ds_list_add(list_copy,file_text_read_string(file));file_text_readln(file);}*/

file_text_close(file);
/*
//ds_list_copy(list_copy,global.world_obj_data);
for(i=0;i<list_size;i++)
{
    temp_list = convert_string_to_list(list_copy[|i],","); // Write our object data into a list
    inst = instance_create(real(temp_list[|1]),real(temp_list[|2]),objind(asset_get_index(temp_list[|0])));
    /*
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
    }*/
//}

ds_list_destroy(temp_list);

if ( file != -1 ){file_log_write("Game loaded successfully| file: "+string(argument0)+" |Time spent: "+string(get_timer()-time_track));} // Log File Usage
else{file_log_write("Game load failed| file: "+string(argument0)+" |Time spent: "+string(get_timer()-time_track));} // Log File Usage
