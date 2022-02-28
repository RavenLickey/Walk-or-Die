event_inherited();

// Position audio emitter at tree location. This takes care of panning and fading.
audio_emitter_position(sndEmit, x, y, 0);

// Play creaking sound chance, if it is not playing globally.
if(random(1) < 0.002 and !audio_is_playing(sndCreaking)){
	show_debug_message("oBarrenTree " + string(id) + " playing sndCreaking.")
	mySound = audio_play_sound_on(sndEmit, sndCreaking, 0, 100);
}

// Only allow object to be destroyed when out of ear shot.
if (!canDestroy and distance_to_object(oPlayer) > sndMaxDist) {
	show_debug_message("oBarrenTree " + string(id) + " out of ear shot. Can destroy.");
	canDestroy = true;
}