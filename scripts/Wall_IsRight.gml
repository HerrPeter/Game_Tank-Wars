///Wall_IsRight(Tank, PixelsRight)
tank = argument0;
pixelsRight = abs(argument1);

if(place_meeting(tank.x + pixelsRight, tank.y, ob_Wall_1) 
|| place_meeting(tank.x + pixelsRight, tank.y, ob_Wall_2)) return true;
else return false;
