#define texture_transition
/// texture_transition(grid_x,grid_y)
var grid_data = ds_grid_get(world_tiles,argument0,argument1);
// grass1
if ( grid_data != 0 )
{
if ( ds_grid_get(world_tiles,argument0-1,argument1) == 0 )
{
draw_enable_alphablend(true);
w3d_draw_floor(grass1_trans_L,argument0*128,argument1*128,1,128,128);
}
if ( ds_grid_get(world_tiles,argument0+1,argument1) == 0 )
{
draw_enable_alphablend(true);
w3d_draw_floor(grass1_trans_R,argument0*128,argument1*128,1,128,128);
}
if ( ds_grid_get(world_tiles,argument0,argument1-1) == 0 )
{
draw_enable_alphablend(true);
w3d_draw_floor(grass1_trans_U,argument0*128,argument1*128,1,128,128);
}
if ( ds_grid_get(world_tiles,argument0,argument1+1) == 0 )
{
draw_enable_alphablend(true);
w3d_draw_floor(grass1_trans_D,argument0*128,argument1*128,1,128,128);
}
}

// drygrass1
if ( grid_data != 1 and grid_data != 0 )
{
if ( ds_grid_get(world_tiles,argument0-1,argument1) == 1 )
{
draw_enable_alphablend(true);
w3d_draw_floor(drygrass1_trans_L,argument0*128,argument1*128,1,128,128);
}
if ( ds_grid_get(world_tiles,argument0+1,argument1) == 1 )
{
draw_enable_alphablend(true);
w3d_draw_floor(drygrass1_trans_R,argument0*128,argument1*128,1,128,128);
}
if ( ds_grid_get(world_tiles,argument0,argument1-1) == 1 )
{
draw_enable_alphablend(true);
w3d_draw_floor(drygrass1_trans_U,argument0*128,argument1*128,1,128,128);
}
if ( ds_grid_get(world_tiles,argument0,argument1+1) == 1 )
{
draw_enable_alphablend(true);
w3d_draw_floor(drygrass1_trans_D,argument0*128,argument1*128,1,128,128);
}
}

// gravel1
if ( grid_data != 3 and grid_data != 1 and grid_data != 0 )
{
if ( ds_grid_get(world_tiles,argument0-1,argument1) == 3 )
{
draw_enable_alphablend(true);
w3d_draw_floor(gravel1_trans_L,argument0*128,argument1*128,1,128,128);
}
if ( ds_grid_get(world_tiles,argument0+1,argument1) == 3 )
{
draw_enable_alphablend(true);
w3d_draw_floor(gravel1_trans_R,argument0*128,argument1*128,1,128,128);
}
if ( ds_grid_get(world_tiles,argument0,argument1-1) == 3 )
{
draw_enable_alphablend(true);
w3d_draw_floor(gravel1_trans_U,argument0*128,argument1*128,1,128,128);
}
if ( ds_grid_get(world_tiles,argument0,argument1+1) == 3 )
{
draw_enable_alphablend(true);
w3d_draw_floor(gravel1_trans_D,argument0*128,argument1*128,1,128,128);
}
}

// grassdead1
if ( grid_data != 4 and grid_data != 3 and grid_data != 1 and grid_data != 0 )
{
if ( ds_grid_get(world_tiles,argument0-1,argument1) == 4 )
{
draw_enable_alphablend(true);
w3d_draw_floor(grassdead1_trans_L,argument0*128,argument1*128,1,128,128);
}
if ( ds_grid_get(world_tiles,argument0+1,argument1) == 4 )
{
draw_enable_alphablend(true);
w3d_draw_floor(grassdead1_trans_R,argument0*128,argument1*128,1,128,128);
}
if ( ds_grid_get(world_tiles,argument0,argument1-1) == 4 )
{
draw_enable_alphablend(true);
w3d_draw_floor(grassdead1_trans_U,argument0*128,argument1*128,1,128,128);
}
if ( ds_grid_get(world_tiles,argument0,argument1+1) == 4 )
{
draw_enable_alphablend(true);
w3d_draw_floor(grassdead1_trans_D,argument0*128,argument1*128,1,128,128);
}
}

