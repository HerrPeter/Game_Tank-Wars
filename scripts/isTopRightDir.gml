tank = argument0;

if (TankIsBetween(tank.direction, global.deg_RightTop, global.deg_TopRight, true))
    return true;
else
    return false;
