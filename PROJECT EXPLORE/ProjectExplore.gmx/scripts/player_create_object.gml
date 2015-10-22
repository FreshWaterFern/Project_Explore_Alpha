/// player_create_object(x,y,object,rotation)

var inst = instance_create(argument0,argument1,argument2);

inst.angle = argument3;
with(inst){ // Parse mod information into the instance
var list = ds_list_create();var i = 0;
list = object_mod_inherit(db_object_get_name(global.item_data[#other.v_item_equipped,0]));
obj_name=list[|0];
index=other.v_item_equipped;
texture=background_get_texture(list[|1]);
sprite_index=list[|2];
type=list[|3];
switch(type)
{
case 0:{ds_grid_resize(c_inv,list[|4],list[|5]);ds_grid_resize(c_stack,list[|4],list[|5]);break;}
}
rot=list[|6];
is_3d=list[|7];
if ( is_3d != 0 )
{
var temp_list = ds_list_create();
temp_list=convert_string_to_list(list[|8],",");
for(i=0;i<ds_list_size(temp_list);i++)
{ds_list_add(data_x,real(temp_list[|i]));}
temp_list=convert_string_to_list(list[|9],",");
for(i=0;i<ds_list_size(temp_list);i++)
{ds_list_add(data_y,real(temp_list[|i]));}
temp_list=convert_string_to_list(list[|10],",");
for(i=0;i<ds_list_size(temp_list);i++)
{ds_list_add(data_z1,real(temp_list[|i]));}
temp_list=convert_string_to_list(list[|11],",");
for(i=0;i<ds_list_size(temp_list);i++)
{ds_list_add(data_z2,real(temp_list[|i]));}
temp_list=convert_string_to_list(list[|12],",");
for(i=0;i<ds_list_size(temp_list);i++)
{ds_list_add(data_xsize,real(temp_list[|i]));}
temp_list=convert_string_to_list(list[|13],",");
for(i=0;i<ds_list_size(temp_list);i++)
{ds_list_add(data_ysize,real(temp_list[|i]));}
ds_list_destroy(temp_list);

// Pre-calculate all math for rotations
var i = 0;var px = 0;var py = 0;var theta = degtorad(angle);
if ( rot ){
for(i=0;i<ds_list_size(data_x);i++)
{px = (data_x[|i]*cos(theta))-(data_y[|i]*sin(theta));py = (data_x[|i]*sin(theta))+(data_y[|i]*cos(theta));data_x[|i]=px;data_y[|i]=py;}}
}
}
