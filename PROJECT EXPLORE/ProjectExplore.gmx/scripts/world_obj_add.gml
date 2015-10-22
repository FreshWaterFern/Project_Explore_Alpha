/// world_obj_add(instance_id)
if ( global.world_loading == false && global.map_loaded == false )
{
// This should be the instance_id
var inst_id = argument0;
var obj_name = object_get_name(inst_id.object_index);

var temp_list = ds_list_create();

if ( ds_list_find_index(global.w_obj_id,inst_id) == -1 )
{
ds_list_add(global.w_obj_id,inst_id);
//ds_list_add(global.w_obj_index,inst_id.object_index);
ds_list_add(global.w_obj_index,string(obj_name));
ds_list_add(global.w_obj_x,inst_id.x);
ds_list_add(global.w_obj_y,inst_id.y);
var index = ds_list_size(global.w_obj_id)-1;
ds_list_add(global.w_obj_angle,real(inst_id.image_angle)); // image_angle
ds_list_add(global.w_obj_var1,0);ds_list_add(global.w_obj_var2,0);ds_list_add(global.w_obj_var3,0);ds_list_add(global.w_obj_var4,0);

switch(obj_name)
{
    case "obj_world_tree_1":{
    ds_list_replace(global.w_obj_var1,index,real(resource_count)); // resouce_count
    ds_list_replace(global.w_obj_var2,index,real(height)); // height
    ds_list_replace(global.w_obj_var3,index,real(tree_top_sub)); // tree_top_sub
    ds_list_replace(global.w_obj_var4,index,real(tree_top_rot)); // tree_top_rot
    break;
    }    
    case "obj_world_rock_1":{
    ds_list_replace(global.w_obj_var1,index,string(sprite_get_name(sprite_index))); // sprite_index
    ds_list_replace(global.w_obj_var2,index,real(direction)); // direction
    ds_list_replace(global.w_obj_var3,index,real(scale_x)); // scale
    ds_list_replace(global.w_obj_var4,index,real(resource_count)); // resouce_count
    break;
    }
    case "obj_world_rock_2":{
    ds_list_replace(global.w_obj_var1,index,string(sprite_get_name(sprite_index))); // sprite_index
    ds_list_replace(global.w_obj_var2,index,real(direction)); // direction
    ds_list_replace(global.w_obj_var3,index,real(scale_x)); // scale
    ds_list_replace(global.w_obj_var4,index,real(resource_count)); // resouce_count
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
    case "obj_item_dropped":{
    ds_list_replace(global.w_obj_var1,index,real(item_id)); // item_id
    ds_list_replace(global.w_obj_var2,index,real(item_stack)); // item_stack
    break;
    }
    case "obj_npc_wolf":{
    ds_list_add(temp_list,npc_food,npc_thirst,npc_health,npc_anger,npc_fear,npc_heat,ai_dead,death_frames);
    ds_list_replace(global.w_obj_var1,index,string(ds_list_write(temp_list))); // ai_spawn_resource
    ds_list_clear(temp_list);
    break;
    }
    case "obj_npc_bear":{
    ds_list_add(temp_list,npc_food,npc_thirst,npc_health,npc_anger,npc_fear,npc_heat,ai_dead,death_frames);
    ds_list_replace(global.w_obj_var1,index,string(ds_list_write(temp_list))); // ai_spawn_resource
    ds_list_clear(temp_list);
    break;
    }
    case "obj_ai_nomadstalker":{
    ds_list_replace(global.w_obj_var1,index,real(npc_health)); // npc_health
    ds_list_replace(global.w_obj_var2,index,real(ai_spawn_resource)); // ai_spawn_resource
    break;
    }
    case "obj_ai_nomadripper":{
    ds_list_replace(global.w_obj_var1,index,real(npc_health)); // npc_health
    ds_list_replace(global.w_obj_var2,index,real(ai_spawn_resource)); // ai_spawn_resource
    break;
    }
    case "obj_npc_buck":{
    ds_list_add(temp_list,npc_food,npc_thirst,npc_health,npc_anger,npc_fear,npc_heat,ai_dead,death_frames);
    ds_list_replace(global.w_obj_var1,index,string(ds_list_write(temp_list))); // ai_spawn_resource
    ds_list_clear(temp_list);
    break;
    }
    case "obj_plant":{
    ds_list_replace(global.w_obj_var1,index,real(plant_type)); // plant_type
    ds_list_replace(global.w_obj_var2,index,real(plant_state)); // plant_state
    break;
    }
    case "obj_smallcrate":{
    ds_list_replace(global.w_obj_var1,index,string(ds_grid_write(c_inv))); // c_inv
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(c_stack))); // c_stack
    break;
    }
    case "obj_largecrate":{
    ds_list_replace(global.w_obj_var1,index,string(ds_grid_write(c_inv))); // c_inv
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(c_stack))); // c_stack
    break;
    }
    case "obj_furn_table1":{
    ds_list_replace(global.w_obj_var1,index,string(ds_grid_write(c_inv))); // c_inv
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(c_stack))); // c_stack
    break;
    }
    case "obj_furn_woodchest1":{
    ds_list_replace(global.w_obj_var1,index,string(ds_grid_write(c_inv))); // c_inv
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(c_stack))); // c_stack
    break;
    }
    case "obj_furn_forgetable":{
    ds_list_replace(global.w_obj_var1,index,string(ds_grid_write(c_inv))); // c_inv
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(c_stack))); // c_stack
    break;
    }
    case "obj_furn_deconstructtable":{
    ds_list_replace(global.w_obj_var1,index,string(ds_grid_write(c_inv))); // c_inv
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(c_stack))); // c_stack
    break;
    }
    case "obj_dead_skeleton1":{
    ds_list_replace(global.w_obj_var1,index,string(ds_grid_write(c_inv))); // c_inv
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(c_stack))); // c_stack
    break;
    }
    case "obj_campfire":{
    ds_list_replace(global.w_obj_var1,index,real(is_enabled)); // is_enabled
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(c_inv))); // c_inv
    ds_list_replace(global.w_obj_var3,index,string(ds_grid_write(c_stack))); // c_stack
    ds_list_replace(global.w_obj_var4,index,real(burn_time)); // burn_time
    break;
    }
    case "obj_bigfire":{
    ds_list_replace(global.w_obj_var1,index,real(is_enabled)); // is_enabled
    ds_list_replace(global.w_obj_var2,index,string(ds_grid_write(c_inv))); // c_inv
    ds_list_replace(global.w_obj_var3,index,string(ds_grid_write(c_stack))); // c_stack
    ds_list_replace(global.w_obj_var4,index,real(burn_time)); // burn_time
    break;
    }
    case "obj_lantern":{
    ds_list_replace(global.w_obj_var1,index,real(is_enabled)); // is_enabled
    break;
    }
    case "obj_env_plant1":{
    ds_list_replace(global.w_obj_var1,index,real(leaf_status)); // leaf_status
    break;
    }
    case "obj_env_plant2":{
    ds_list_replace(global.w_obj_var1,index,real(leaf_status)); // leaf_status
    break;
    }
    case "obj_env_plant3":{
    ds_list_replace(global.w_obj_var1,index,real(leaf_status)); // leaf_status
    break;
    }
    case "obj_env_bush1":{
    ds_list_replace(global.w_obj_var1,index,real(leaf_status)); // leaf_status
    break;
    }
}

}
ds_list_destroy(temp_list);
}
