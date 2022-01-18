creationTimeSlope = 1;

function location(DAY_SOUND, NIGHT_SOUND, maxCreationtime = 4, minCreationTime = 0.4, creationTimeDecreaseRate = 0.4){
	daySound = DAY_SOUND;
	nightSound = NIGHT_SOUND;
		
	maxCreationTime = (maxCreationTime / (oPlayer.SPEED / 100));
	minCreationTime = (minCreationTime / (oPlayer.SPEED / 100));
	creationTimeIncreaseRate = (creationTimeIncreaseRate * (oPlayer.SPEED / 100));
	creationTimeDecreaseRate = (creationTimeDecreaseRate * (oPlayer.SPEED / 100));
		
	creationTime = maxCreationTime;
	alarm[0] = creationTime;
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
	alarm[0] = creationTime;
}


function gameStartItem(rmTemp, oItemTemp){
	myItem = oItemTemp;
	myItem.x = 150;
	player = instance_create_depth(0, 0, 0, myItem);
}