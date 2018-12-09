///CheckCamReverse(Tank)
tank = argument0;
canReverse = true;

switch(tank.direction)
{
    case 0:
        if Wall_IsLeft(tank, global.wallGap)
            canReverse = false;
        break;
    case 90:
        if Wall_IsBelow(tank, global.wallGap)
            canReverse = false;  
        break;      
    case 180:
        if Wall_IsRight(tank, global.wallGap)
            canReverse = false;
        break;
    case 270:
        if Wall_IsAbove(tank, global.wallGap)
            canReverse = false;
        break;
    default:
        canReverse = true;
        break;
}

return canReverse;
