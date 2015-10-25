/// unload_world_data()
/*
This script will clear out every data structure and
texture created by obj_game_render and obj_game
It will also remove all game audio from memory
*/

// Data Structures //
mp_grid_destroy(global.pathing_grid);
//ds_grid_destroy(global.map_draw_grid);
ds_grid_destroy(global.world_tiles);
ds_grid_destroy(global.c_inventory_pack);
ds_grid_destroy(global.c_stack_pack);
ds_grid_destroy(global.c_worldmap);
ds_grid_destroy(global.world_temperature);
ds_grid_destroy(global.world_biomes);
ds_grid_destroy(global.ambient_light);
ds_grid_destroy(global.ambient_shader);
ds_list_destroy(global.ai_xdecal);
ds_list_destroy(global.ai_ydecal);
ds_list_destroy(global.ai_sdecal);
ds_list_destroy(global.fps_list);
ds_list_destroy(global.waypoint_data_x);
ds_list_destroy(global.waypoint_data_y);
ds_list_destroy(global.waypoint_data_name);
ds_list_destroy(global.cook_list);
ds_list_destroy(global.roof_list);
ds_list_destroy(global.status_list);
ds_map_destroy(global.status_map);
if !surface_exists(obj_game_render.surface_terrain)
{
surface_free(obj_game_render.surface_terrain)
}
if ( !surface_exists(global.vignette_surface) )
{surface_free(global.vignette_surface)}

// Unload Item Lists
ds_list_destroy(global.c_spawnlist_0);
ds_list_destroy(global.c_spawnlist_1);
ds_list_destroy(global.c_spawnlist_2);
ds_list_destroy(global.c_spawnlist_3);
ds_list_destroy(global.c_spawnlist_4);
ds_list_destroy(global.c_spawnlist_5);
ds_list_destroy(global.c_spawnlist_6);
ds_list_destroy(global.c_spawnlist_7);
ds_list_destroy(global.c_spawnlist_8);

// Stop Playing All Sounds
audio_stop_sound(ambience_morning);
audio_stop_sound(ambience_night);
audio_stop_sound(snd_sanity_loss1);
audio_stop_all();

// Unload Audio //
if ( audio_group_is_loaded(audiogroup_default) == true )
{audio_group_unload(audiogroup_default);}
if ( audio_group_is_loaded(audiogroup_footstep) == true )
{audio_group_unload(audiogroup_footstep);}
if ( audio_group_is_loaded(Ambience_Track1) == true )
{audio_group_unload(Ambience_Track1);}
if ( audio_group_is_loaded(Ambience_Track2) == true )
{audio_group_unload(Ambience_Track2);}

// Music Track Unload

var i = 0;
for(i=0;i<ds_list_size(obj_game.music_list);i++){
if ( obj_game.music_track != 0 ){audio_stop_sound(obj_game.music_track);obj_game.music_track=0;}
audio_destroy_stream(ds_list_find_value(obj_game.music_list,i));}
ds_list_destroy(obj_game.music_list);
