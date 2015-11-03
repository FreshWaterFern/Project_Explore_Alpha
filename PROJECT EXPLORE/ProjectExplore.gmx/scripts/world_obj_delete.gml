/// world_obj_delete(instance_id)
/*
var inst_id = argument0;
var index = ds_list_find_index(global.w_obj_id,inst_id);
if ( index != -1 ){
var obj_name = object_get_name(inst_id.object_index);
ds_list_delete(global.w_obj_id,index);
ds_list_delete(global.w_obj_index,index);
ds_list_delete(global.w_obj_x,index);
ds_list_delete(global.w_obj_y,index);
ds_list_delete(global.w_obj_angle,index); // image_angle
ds_list_delete(global.w_obj_var1,index);
ds_list_delete(global.w_obj_var2,index);
ds_list_delete(global.w_obj_var3,index);
ds_list_delete(global.w_obj_var4,index);}
