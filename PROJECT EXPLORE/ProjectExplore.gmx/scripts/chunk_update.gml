/// chunk_update(chunk_x,chunk_y,re-activate)

// Deactivate And Re-Activate Instances
if ( chunk_step == 0 )
{
chunk_step_x = global.chunk_x;
chunk_step_y = global.chunk_y;
//chunk_step = 1;

with(all)
{
if ( object_index != obj_game_render && object_index != obj_game_weather && object_index != obj_game && object_index != obj_volume && object_index != obj_player && object_index != obj_camera && object_index != obj_main_logic )
{
instance_deactivate_object(self);
}
}
previous_chunk_x = global.chunk_x;
previous_chunk_y = global.chunk_y;
instance_activate_region((argument0-1)*1280,(argument1-1)*1280,3840,3840,true);
}

// Multi Step Chunk Generation
var i = 0;var r = 0;
var width = ds_grid_width(global.world_chunks)-1;
var height = ds_grid_height(global.world_chunks)-1;
for(i=0;i<4;i++)
{
    for(r=0;r<4;r++)
    {
    if ( ds_grid_get(global.world_chunks,clamp(argument0-2+i,0,width),clamp(argument0-2+r,0,height)) == 0 )
    {
    if ( argument0-2+i >= 0 && argument1-2+r >= 0 && argument0-2+i <= ds_grid_width(global.world_chunks) && argument1-2+r <= ds_grid_height(global.world_chunks) )
    {
    world_generate(argument0-2+i,argument1-2+r,true);
    ds_grid_set(global.world_chunks,argument0-2+i,argument1-2+r,1);
    }
    }
    }
}
