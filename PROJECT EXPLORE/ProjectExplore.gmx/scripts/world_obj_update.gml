/// world_obj_update(instance_id)
if ( global.save_loading == false )
{
if ( global.world_loading == false )
{
var inst = argument0;
var temp_list = ds_list_create();
var index = ds_list_find_index(global.w_obj_id,inst);
ds_list_replace(global.w_obj_id,index,inst);
//ds_list_replace(global.w_obj_index,index,inst.object_index);
ds_list_replace(global.w_obj_x,index,inst.x);
ds_list_replace(global.w_obj_y,index,inst.y);
ds_list_replace(global.w_obj_angle,index,inst.image_angle);
var obj_name = object_get_name(inst.object_index);
ds_list_replace(global.w_obj_index,index,obj_name);
switch(obj_name)
{
    case "obj_world_tree_1":{
    ds_list_replace(global.w_obj_var1,index,real(inst.resource_count)); // resouce_count
    ds_list_replace(global.w_obj_var2,index,real(inst.height)); // height
    ds_list_replace(global.w_obj_var3,index,real(inst.tree_top_sub)); // tree_top_sub
    ds_list_replace(global.w_obj_var4,index,real(inst.tree_top_rot)); // tree_top_rot
    break;
    }
    case "obj_world_rock_1":{
    ds_list_replace(global.w_obj_var1,index,string(sprite_get_name(sprite_index))); // sprite_index
    ds_list_replace(global.w_obj_var2,index,real(inst.direction)); // direction
    ds_list_replace(global.w_obj_var3,index,real(inst.scale_x)); // scale
    ds_list_replace(global.w_obj_var4,index,real(inst.resource_count)); // resouce_count
    break;
    }
    case "obj_world_rock_2":{
    ds_list_replace(global.w_obj_var1,index,string(sprite_get_name(sprite_index))); // sprite_index
    ds_list_replace(global.w_obj_var2,index,real(inst.direction)); // direction
    ds_list_replace(global.w_obj_var3,index,real(inst.scale_x)); // scale
    ds_list_replace(global.w_obj_var4,index,real(inst.resource_count)); // resouce_count
    break;
    }   
    case "obj_item_dropped":{
    ds_list_replace(global.w_obj_var1,index,real(inst.item_id)); // item_id
    ds_list_replace(global.w_obj_var2,index,real(inst.item_stack)); // item_stack
    break;
    }
    case "obj_construct_wall":{
    ds_list_replace(global.w_obj_var1,index,real(construct_health)); // construct_health
    break;
    }
    case "obj_construct_pillar":{
    ds_list_replace(global.w_obj_var1,index,real(construct_health)); // construct_health
    break;
    }
    case "obj_construct_doorway":{
    ds_list_replace(global.w_obj_var1,index,real(construct_health)); // construct_health
    break;
    }
    case "obj_construct_door":{
    ds_list_replace(global.w_obj_var1,index,real(construct_health)); // construct_health
    ds_list_replace(global.w_obj_var2,index,real(door_locked)); // door_locked
    ds_list_replace(global.w_obj_var3,index,real(door_construct)); // door_construct
    break;
    }
    case "obj_construct_fence":{
    ds_list_replace(global.w_obj_var1,index,real(construct_health)); // construct_health
    break;
    }
    case "obj_construct_flag":{
    ds_list_replace(global.w_obj_var1,index,string(waypoint_name)); // waypoint_name
    ds_list_replace(global.w_obj_var2,index,real(waypoint_index)); // waypoint_index
    ds_list_replace(global.w_obj_var3,index,real(flag_color)); // flag_color
    break;
    }
    case "obj_npc_wolf":{
    ds_list_add(temp_list,inst.npc_food,inst.npc_thirst,inst.npc_health,inst.npc_anger,inst.npc_fear,inst.npc_heat,inst.ai_dead,inst.death_frames);
    ds_list_replace(global.w_obj_var1,index,string(ds_list_write(temp_list))); // ai_spawn_resource
    ds_list_clear(temp_list);
    break;
    }
    case "obj_npc_bear":{
    ds_list_add(temp_list,inst.npc_food,inst.npc_thirst,inst.npc_health,inst.npc_anger,inst.npc_fear,inst.npc_heat,inst.ai_dead,inst.death_frames);
    ds_list_replace(global.w_obj_var1,index,string(ds_list_write(temp_list))); // ai_spawn_resource
    ds_list_clear(temp_list);
    break;
    }
    case "obj_ai_nomadstalker":{
    ds_list_replace(global.w_obj_var1,index,real(inst.npc_health)); // npc_health
    ds_list_replace(global.w_obj_var2,index,real(inst.ai_spawn_resource)); // ai_spawn_resource
    break;
    }
    case "obj_ai_nomadripper":{
    ds_list_replace(global.w_obj_var1,index,real(inst.npc_health)); // npc_health
    ds_list_replace(global.w_obj_var2,index,real(inst.ai_spawn_resource)); // ai_spawn_resource
    break;
    }
    case "obj_npc_buck":{
    ds_list_add(temp_list,inst.npc_food,inst.npc_thirst,inst.npc_health,inst.npc_anger,inst.npc_fear,inst.npc_heat,inst.ai_dead,inst.death_frames);
    ds_list_replace(global.w_obj_var1,index,string(ds_list_write(temp_list))); // ai_spawn_resource
    ds_list_clear(temp_list);
    break;
    }
    case "obj_plant":{
    ds_list_replace(global.w_obj_var1,index,real(inst.plant_type)); // plant_type
    ds_list_replace(global.w_obj_var2,index,real(inst.plant_state)); // plant_state
    break;
    }
    case "obj_smallcrate":{
    ds_list_replace(global.w_obj_var1,index,string(ds_grid_write(inst.c_inv))); // c_inv
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(inst.c_stack))); // c_stack
    break;
    }
    case "obj_largecrate":{
    ds_list_replace(global.w_obj_var1,index,string(ds_grid_write(inst.c_inv))); // c_inv
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(inst.c_stack))); // c_stack
    break;
    }
    case "obj_furn_table1":{
    ds_list_replace(global.w_obj_var1,index,string(ds_grid_write(inst.c_inv))); // c_inv
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(inst.c_stack))); // c_stack
    break;
    }
    case "obj_furn_forgetable":{
    ds_list_replace(global.w_obj_var1,index,string(ds_grid_write(inst.c_inv))); // c_inv
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(inst.c_stack))); // c_stack
    break;
    }
    case "obj_furn_deconstructtable":{
    ds_list_replace(global.w_obj_var1,index,string(ds_grid_write(inst.c_inv))); // c_inv
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(inst.c_stack))); // c_stack
    break;
    }
    case "obj_furn_woodchest1":{
    ds_list_replace(global.w_obj_var1,index,string(ds_grid_write(inst.c_inv))); // c_inv
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(inst.c_stack))); // c_stack
    break;
    }
    case "obj_dead_skeleton1":{
    ds_list_replace(global.w_obj_var1,index,string(ds_grid_write(inst.c_inv))); // c_inv
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(inst.c_stack))); // c_stack
    break;
    }
    case "obj_campfire":{
    ds_list_replace(global.w_obj_var1,index,real(inst.is_enabled)); // is_enabled
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(inst.c_inv))); // c_inv
    ds_list_replace(global.w_obj_var3,index,string(ds_grid_write(inst.c_stack))); // c_stack
    ds_list_replace(global.w_obj_var4,index,real(inst.burn_time)); // burn_time
    break;
    }
    case "obj_bigfire":{
    ds_list_replace(global.w_obj_var1,index,real(inst.is_enabled)); // is_enabled
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(inst.c_inv))); // c_inv
    ds_list_replace(global.w_obj_var3,index,string(ds_grid_write(inst.c_stack))); // c_stack
    ds_list_replace(global.w_obj_var4,index,real(inst.burn_time)); // burn_time
    break;
    }
    case "obj_lantern":{
    ds_list_replace(global.w_obj_var1,index,real(inst.is_enabled)); // is_enabled
    break;
    }
    case "obj_env_plant1":{
    ds_list_replace(global.w_obj_var1,index,real(inst.leaf_status)); // leaf_status
    break;
    }
    case "obj_env_plant2":{
    ds_list_replace(global.w_obj_var1,index,real(inst.leaf_status)); // leaf_status
    break;
    }
    case "obj_env_plant3":{
    ds_list_replace(global.w_obj_var1,index,real(inst.leaf_status)); // leaf_status
    break;
    }
    case "obj_env_bush1":{
    ds_list_replace(global.w_obj_var1,index,real(inst.leaf_status)); // leaf_status
    break;
    }
}
ds_list_destroy(temp_list);
}
}
