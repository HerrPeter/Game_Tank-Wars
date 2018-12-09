///dir_Check_LeftWall(Tank)
tank = argument0;

if tank.tankDir == tankDir.upLeft
    return true;

if tank.tankDir == tankDir.upRight
    return true;
    
if tank.tankDir == tankDir.up
    return true;
    
return false;
