///dir_Check_LeftWall(Tank)
tank = argument0;

if tank.tankDir == tankDir.downLeft
    return true;

if tank.tankDir == tankDir.downRight
    return true;
    
if tank.tankDir == tankDir.down
    return true;
    
return false;
