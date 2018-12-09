tank = argument0;

if TankIsBetween(tank.direction, global.deg_LeftSub, global.deg_DownLeft, true)
    return true;
else
    return false;
