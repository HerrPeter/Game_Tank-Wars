///CheckCanForward(Tank)
tank = argument0;
canForward = true;

switch(tank.direction)
{
    case 0:
        if Wall_IsRight(tank, global.wallGap)
            canForward = false;
        break;
    case 90:
        if Wall_IsAbove(tank, global.wallGap)
            canForward = false;        
        break;
    case 180:
        if Wall_IsLeft(tank, global.wallGap)
            canForward = false;
        break;
    case 270:
        if Wall_IsBelow(tank, global.wallGap)
            canForward = false;
        break;
    default:
        canForward = true;
}

return canForward;
