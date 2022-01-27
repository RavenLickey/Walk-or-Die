creationTimeSlope = 1 ;
minCreationTime = 0;
maxCreationtime = 0;
creationTimeDecreaseRate = 0;
creationTimeIncreaseRate = 0;

function Location(DAY_SOUND, NIGHT_SOUND, maxCreationTime = 4, minCreationTime = 0.4, creationTimeIncreaseRate = 0.4, creationTimeDecreaseRate = 0.4){
	daySound = DAY_SOUND;
	nightSound = NIGHT_SOUND;
		
	self.maxCreationTime = (maxCreationTime / (oPlayer.SPEED / 100));
	self.minCreationTime = (minCreationTime / (oPlayer.SPEED / 100));
	self.creationTimeIncreaseRate = (creationTimeIncreaseRate * (oPlayer.SPEED / 100));
	self.creationTimeDecreaseRate = (creationTimeDecreaseRate * (oPlayer.SPEED / 100));
		
	creationTime = maxCreationTime;
	alarm[0] = creationTime * room_speed; 
	//show_debug_message("Show Alarm time (oLocation(Location)): " + string(alarm[0]));
}

function createItem(){
	
	if(random(1) > 0.25){
		switch(creationTimeSlope){
			case -1:
				if (creationTime < maxCreationTime){
					creationTime += creationTimeIncreaseRate;
					if (creationTime > maxCreationTime){
						creationTime = maxCreationTime;
					}							
				}
				break;
			case 1:
				if (creationTime > minCreationTime){
					creationTime -= creationTimeDecreaseRate;
					if (creationTime < minCreationTime){
						creationTime = minCreationTime;
					}
				}
				break;
			case 0:
				break;
		}
	}
	
	alarm[0] = creationTime * room_speed;
	//show_debug_message("Show Alarm time (oLocation(createItem)): " + string(alarm[0]));   
}
  
/* Gamemaker does not like this, items will instead be created within the specific location objects
function gameStartItem(oItemTemp){
	myItem = oItemTemp;
	myItem.x = 150;
	instance_create_depth(0, 0, 0, myItem);
}
*/