///GetTankDir(tank)
tank = argument0;

//Check Tank Direction
if TankIsBetween(tank.direction, 0, global.deg_RightTop - 1, true) 
    tank.tankDir = tankDir.right;
else if TankIsBetween(tank.direction, 90, global.deg_TopLeft - 1, true)
    tank.tankDir = tankDir.up;
else if TankIsBetween(tank.direction, 180, global.deg_LeftSub - 1, true) 
    tank.tankDir = tankDir.left;
else if TankIsBetween(tank.direction, 270, global.deg_DownRight - 1, true) 
    tank.tankDir = tankDir.down;
else if isTopRightDir(tank)
    tank.tankDir = tankDir.upRight;
else if isTopLeftDir(tank)
    tank.tankDir = tankDir.upLeft;
else if isSubLeftDir(tank)
    tank.tankDir = tankDir.downLeft;
else if isSubRightDir(tank)
    tank.tankDir = tankDir.downRight;
else
    show_message("FAIL");
