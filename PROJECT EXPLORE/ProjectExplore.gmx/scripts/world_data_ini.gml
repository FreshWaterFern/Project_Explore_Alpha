/// world_data_ini()

/*
This will initialize all of the data structures 
and variables needed for the world data system
*/

global.w_plants_id = ds_list_create();
global.w_plants_type = ds_list_create();
global.w_plants_state = ds_list_create();
global.w_obj_id = ds_list_create();
global.w_obj_index = ds_list_create();
global.w_obj_x = ds_list_create();
global.w_obj_y = ds_list_create();
global.w_obj_angle = ds_list_create();
global.w_obj_var1 = ds_list_create();
global.w_obj_var2 = ds_list_create();
global.w_obj_var3 = ds_list_create();
global.w_obj_var4 = ds_list_create();
global.world_chunks = ds_grid_create(floor(room_width/1280)+15,floor(room_height/1280)+15);
global.world_biomes = ds_grid_create(floor(room_width/1280)+15,floor(room_height/1280)+15);

// Also include various lists if needed for some objects
global.cook_list = ds_list_create();
ds_list_add(global.cook_list,9);
ds_list_add(global.cook_list,70);
ds_list_add(global.cook_list,73);
ds_list_add(global.cook_list,75);
ds_list_add(global.cook_list,76);
ds_list_add(global.cook_list,77);
ds_list_add(global.cook_list,87);
ds_list_add(global.cook_list,140);
ds_list_add(global.cook_list,141);
ds_list_add(global.cook_list,142);
ds_list_add(global.cook_list,143);
