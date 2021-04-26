function player_jump_state(){
 
	//Get input
	get_input();
 
	//Calculate movement
	calc_movement();
	
	//check state
	if on_ground() {
		if hsp != 0 state = states.WALK else state = states.IDLE;
	}
	
	if attack {
		state = states.ATTACK;
		image_index = 0;
	} 
	
	//apply movement
	collision();
 
	//Apply animations
	anim();
}