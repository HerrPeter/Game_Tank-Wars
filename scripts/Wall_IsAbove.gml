tank = argument0;
pixelsAbove = abs(argument1);

if(place_meeting(tank.x, tank.y - pixelsAbove, ob_Wall_1) 
|| place_meeting(tank.x, tank.y - pixelsAbove, ob_Wall_2)) return true;
else return false;
