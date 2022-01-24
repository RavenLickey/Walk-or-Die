//super(sndSilence, sndSilence, 5, 2); I'M NOT SURE WHAT THIS IS REFERENCING 
event_inherited();
locationType = "desert";
creationTimeSlope = 1;
sEmit0 = audio_emitter_create();
sEmit1 = audio_emitter_create();
sEmit2 = audio_emitter_create();
sEmit3 = audio_emitter_create();
oPyramidsSeen = false;

function createItemHere(){
	oLocation.createItem();
	
	creationNumber = random(1);
	
	//Mid distance
	if(random(1) > 0.25){
		if(creationNumber < 0.01 && oPyramidsSeen == false){
			instance_create_depth(0,0,0, oPyramids);
			oPyramidsSeen = true;
		}
		else if(creationNumber < 0.05){
			instance_create_depth(0,0,0, oGiantCactus);	
		}
		else if(creationNumber < 0.1){
			instance_create_depth(0,0,0, oButte);
		}
		else if(creationNumber < 0.15){
			instance_create_depth(0,0,0, oTumbleweed);	
		}
		else if(creationNumber < 1){
			instance_create_depth(0,0,0, oCactus);	
		}
		show_debug_message("Creation Number (oDesert CreateItemHere): " + string(creationNumber));  
	}
	//sounds
	if (random_range(0,1) > 0.4){
		pan = choose( -1, 1) * random_range(0,1);
		vol = 0.2 + 0.7 * random_range(0,1);
		// Night sounds
		if (oMyWorldController.time == "night"){
			if (creationNumber < 0.1 && !audio_is_playing(sndWolf)){
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit0, pan,0,0);
				audio_play_sound_on(sEmit0, sndWolf, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends		
			}					
			else if (creationNumber < 0.5 && !audio_is_playing(sndWind)){
				//sndWind.play(vol, pan);
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit1, pan,0,0);
				audio_play_sound_on(sEmit1, sndWind, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
			}		
		}
		// Day sounds
		else{
			if (creationNumber < 0.5 && !audio_is_playing(sndWolf)){
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit2, pan,0,0);
				audio_play_sound_on(sEmit2, sndWolf, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
			}						
			else if (creationNumber < 0.5 && !audio_is_playing(sndWind)){
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit3, pan,0,0);
				audio_play_sound_on(sEmit3, sndWind, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
			}					
		}
	}
}

function gameStart(){
	instance_create_depth(150, 0, 0, oCactus);	
}