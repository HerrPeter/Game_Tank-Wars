///Wall_IsBelow(Tank, GapFromWall)
tank = argument0;
pixelsBelow = abs(argument1);

if(place_meeting(tank.x, tank.y + pixelsBelow, ob_Wall_1) 
|| place_meeting(tank.x, tank.y + pixelsBelow, ob_Wall_2)) return true;
else return false;
