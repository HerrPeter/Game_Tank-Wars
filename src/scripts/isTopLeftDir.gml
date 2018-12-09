tank = argument0;

if TankIsBetween(tank.direction, global.deg_TopLeft, global.deg_LeftTop, true)
    return true;
else
    return false;
