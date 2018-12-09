////Wall_IsLeft(Tank, PixelsLeft)
tank = argument0;
pixelsLeft = abs(argument1);


if(place_meeting((tank.x) - pixelsLeft, tank.y, ob_Wall_1) 
|| place_meeting((tank.x) - pixelsLeft, tank.y, ob_Wall_2)) return true;
else return false;
