///dir_Check_LeftWall(Tank)
tank = argument0;

if tank.tankDir == tankDir.upLeft
    return true;

if tank.tankDir == tankDir.downLeft
    return true;
    
if tank.tankDir == tankDir.left
    return true;
    
return false;
