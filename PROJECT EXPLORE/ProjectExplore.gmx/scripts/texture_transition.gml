/// texture_transition(grid_x,grid_y,draw_x,draw_y)
gml_pragma("forceinline");
var grid_data = global.world_tiles[# argument0, argument1]; //global.world_tiles should be your terrain tile ds_grid

if ( ds_list_find_index(global.trans_id, grid_data) != -1 ) { // first check to see if this tile is valid for blending
    var xCoord = argument2;
    var yCoord = argument3;
    
    var adj; // an array[4] telling us which touching tiles are of different types
    adj[directions.up] = global.world_tiles[# argument0, (argument1-1)];
    adj[directions.down] = global.world_tiles[# argument0, (argument1+1)];
    adj[directions.left] = global.world_tiles[# (argument0-1), argument1];
    adj[directions.right] = global.world_tiles[# (argument0+1), argument1];
    adj[directions.diag_dr] = global.world_tiles[# (argument0+1), (argument1+1)];
    adj[directions.diag_dl] = global.world_tiles[# (argument0-1), (argument1+1)];
    adj[directions.diag_ur] = global.world_tiles[# (argument0+1), (argument1-1)];
    adj[directions.diag_ul] = global.world_tiles[# (argument0-1), (argument1-1)];

    // check in cardinal directions for places to draw transition images
    for (var i = 0; i < 4; i++) {
        if (adj[i] != grid_data && ds_list_find_index(global.trans_id, adj[i]) != -1 && adj[i] > grid_data) {
            draw_enable_alphablend(true);
            draw_sprite(global.trans_cache[# adj[i], i], 0, xCoord, yCoord);
        }
    }
    
    // now check diagonally
    if (adj[directions.diag_dr] != grid_data && ds_list_find_index(global.trans_id, adj[directions.diag_dr]) != -1 && adj[directions.diag_dr] > grid_data) {
        if (adj[directions.down] < adj[directions.diag_dr] && adj[directions.right] < adj[directions.diag_dr]) {
            draw_enable_alphablend(true);
            draw_sprite(global.trans_cache[# adj[directions.diag_dr], directions.diag_ul], 0, xCoord, yCoord);
        }
    }

    if (adj[directions.diag_dl] != grid_data && ds_list_find_index(global.trans_id, adj[directions.diag_dl]) != -1 && adj[directions.diag_dl] > grid_data) {
        if (adj[directions.down] < adj[directions.diag_dl] && adj[directions.left] < adj[directions.diag_dl]) {
            draw_enable_alphablend(true);
            draw_sprite(global.trans_cache[# adj[directions.diag_dl], directions.diag_ur], 0, xCoord, yCoord);
        }
    }
    
    if (adj[directions.diag_ur] != grid_data && ds_list_find_index(global.trans_id, adj[directions.diag_ur]) != -1 && adj[directions.diag_ur] > grid_data) {
        if (adj[directions.up] < adj[directions.diag_ur] && adj[directions.right] < adj[directions.diag_ur]) {
            draw_enable_alphablend(true);
            draw_sprite(global.trans_cache[# adj[directions.diag_ur], directions.diag_dl], 0, xCoord, yCoord);
        }
    }
    
    if (adj[directions.diag_ul] != grid_data && ds_list_find_index(global.trans_id, adj[directions.diag_ul]) != -1 && adj[directions.diag_ul] > grid_data) {
        if (adj[directions.up] < adj[directions.diag_ul] && adj[directions.left] < adj[directions.diag_ul]) {
            draw_enable_alphablend(true);
            draw_sprite(global.trans_cache[# adj[directions.diag_ul], directions.diag_dr], 0, xCoord, yCoord);
        }
    }
}
