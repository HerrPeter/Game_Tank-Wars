tank = argument0;

if TankIsBetween(tank.direction, global.deg_DownRight, global.deg_RightSub, true)
    return true;
else
    return false;
