/// world_generate(x/1280,y/1280,random)

//objind(object_id) inst = instance_create(x,y,objind(object_id), verify correct id is returned

// Ensure that the ocean has sand in it
ds_grid_set_region(global.world_tiles,0,0,4,(room_height/128),15);
ds_grid_set_region(global.world_tiles,0,(room_height/128)-4,room_width/128,(room_height/128),15);
ds_grid_set_region(global.world_tiles,(room_width/128)-4,0,(room_width/128),(room_height/128),15);
ds_grid_set_region(global.world_tiles,0,0,room_width/128,4,15);

var type = 0;
var chance = 0;
var r_x = 0;
var r_y = 0;
var side_check = 0;
var multi_sides = 0;
var pre_x = argument0*1280;
var pre_y = argument1*1280;
var pre_x128 = round(pre_x/128);
var pre_y128 = round(pre_y/128);
var scale = 0;
var inst = 0;
var sprite = 0;
var i = 0;
var r = 0;
var t = argument2;
var temp_var0 = 0;
var temp_var1 = 0;
var temp_var2 = 2;
var temp_var3 = 3;
var biome_override = false;
var get_biome_left = ds_grid_get(global.world_biomes,(pre_x/1280)-1,(pre_y/1280));
var get_biome_right = ds_grid_get(global.world_biomes,(pre_x/1280)+1,(pre_y/1280));
var get_biome_up = ds_grid_get(global.world_biomes,(pre_x/1280),(pre_y/1280)-1);
var get_biome_down = ds_grid_get(global.world_biomes,(pre_x/1280),(pre_y/1280)+1);

// Generate 1280x1280, 10 tiles
// Biome Continue And Override
if ( get_biome_left == 7 or get_biome_left == 8 )
{
    type = irandom(4);
    if ( type == 1 )
    {
        type = choose(7,8);
        biome_override = true;
    }
}
if ( get_biome_up == 7 or get_biome_up == 8 )
{
    type = irandom(4);
    if ( type == 1 )
    {
        type = choose(7,8);
        biome_override = true;
    }
}
if ( get_biome_down == 7 or get_biome_down == 8 )
{
    type = irandom(4);
    if ( type == 1 )
    {
        type = choose(7,8);
        biome_override = true;
    }
}
if ( get_biome_right == 7 or get_biome_right == 8 )
{
    type = irandom(4);
    if ( type == 1 )
    {
        type = choose(7,8);
        biome_override = true;
    }
}

// Ruins 1
if ( get_biome_left == 9 )
{
    if ( irandom(4) == 3 )
    {
        type = 9;
        side_check = 1;
        multi_sides ++;
        biome_override = true;
    }
}
if ( get_biome_up == 9 )
{
    if ( irandom(4) == 3 )
    {
        type = 9;
        side_check = 2;
        multi_sides ++;
        biome_override = true;
    }
}
if ( get_biome_down == 9 )
{
    if ( irandom(4) == 3 )
    {
        type = 9;
        side_check = 3;
        multi_sides ++;
        biome_override = true;
    }
}
if ( get_biome_right == 9 )
{
    if ( irandom(4) == 3 )
    {
        type = 9;
        side_check = 4;
        multi_sides ++;
        biome_override = true;
    }
}

if ( biome_override == false )
{
type = irandom(11);
if ( type == 9 )
{
    if ( irandom(4) == 2 )
    {
    type = 9;
    }
    else
    {
    type = irandom(11);
    }
}
// Increase rarity of certain biomes
if ( type == 5 or type == 6 or type == 10 or type == 11 )
{
    type = irandom(11);
}
}
// SPECIAL CHECK ONLY
type = -1;
// SPECIAL CHECK ONLY

// Map Edge Check
if ( (pre_y/1280) <= 1 or (pre_x/1280) <= 1 or (pre_x/1280) >= (room_width/1280)-2 or (pre_y/1280) >= (room_height/1280)-2 )
{type = irandom(1);}

switch(type)
{
        case 0: // Grass & Light Tree's
        {chunk_0(argument0,argument1);break;}
        
        case 1: // Grass & Heavy Tree's
        {chunk_1(argument0,argument1);break;}
        
        case 2: // Brick Structure
        {chunk_2(argument0,argument1);break;}
        
        case 3: // Wood Structure
        {chunk_3(argument0,argument1);break;}
        
        case 4: // Dirt & Light Tree's
        {chunk_4(argument0,argument1);break;}
        
        case 5: // Grass and big pond
        {chunk_5(argument0,argument1);break;}
        
        case 6: // Lake
        {chunk_6(argument0,argument1);break;}
        
        case 7: // Sand Structure
        {chunk_7(argument0,argument1);break;}
        
        case 8: // Sand & Rocks
        {chunk_8(argument0,argument1);break;}
        
        case 9: // Ruins Type 1
        {chunk_9(argument0,argument1);break;}
        
        case 10: // Grass and small pond
        {chunk_10(argument0,argument1);break;}
        
        case 11: // Small Town 1 (Grass and trees)
        {chunk_11(argument0,argument1);break;}
}
