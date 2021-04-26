// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collision() {
//horizontal collision
//apply carried over decimals
hsp += hsp_decimal;
vsp += vsp_decimal;
	
//floor decimals
//save and subtract decimals
hsp_decimal = frac(hsp);
hsp -= hsp_decimal;
vsp_decimal = frac(vsp);
vsp -= vsp_decimal;
	
var side;
//determine which side to test
if hsp > 0 side = bbox_right else side = bbox_left;
	
//check the top and bottom of the side
var t1 = tilemap_get_at_pixel(global.map, side + hsp, bbox_top);
var t2 = tilemap_get_at_pixel(global.map, side + hsp, bbox_bottom);
	
if t1 != VOID or t2 != VOID {
	//collision found
	if hsp > 0 x = x - (x mod global.tile_size) + global.tile_size - 1 - (side - x);
	else x = x - (x mod global.tile_size) - (side - x);
	hsp = 0;
}
	
x += hsp;

//vertical collision
var side;
//determine which side to test
if vsp > 0 side = bbox_bottom else side = bbox_top;
	
//check the left and right side
var t1 = tilemap_get_at_pixel(global.map, bbox_left, side + vsp);
var t2 = tilemap_get_at_pixel(global.map, bbox_right, side + vsp);
	
if t1 != VOID or t2 != VOID {
	//collision found
	if vsp > 0 y = y - (y mod global.tile_size) + global.tile_size - 1 - (side - y);
	else y = y - (y mod global.tile_size) - (side - y);
	vsp = 0;
}
	
y += vsp;
}