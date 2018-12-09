///TankIs_OutOfBounds(Tank)
tank = argument0;

if !TankIsBetween(tank.x, 0, room_width, false) || 
   !TankIsBetween(tank.y, 0, room_height, false)
    return true;
else
    return false;
