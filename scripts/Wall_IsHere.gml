///Wall_IsHere(newX, newY)
//Tank = argument0;
newX = argument0;
newY = argument1;

//Check to see if there is a wall in the next movement
if(place_meeting(newX, newY, ob_Wall_1) || 
   place_meeting(newX, newY, ob_Wall_2)) 
    return true;
else 
    return false;
