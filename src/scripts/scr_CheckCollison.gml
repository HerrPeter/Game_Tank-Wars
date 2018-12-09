///scr_CheckCollison(Object, nextX-Coor, nextY-Coor)
if global.paused
exit;

tank = argument0;

//Check Tank Direction
GetTankDir(tank);

//Check the mov dir of the tank
CheckTankState(tank);

//Slow the tank if manual control
SlowTank(tank);

//THIS CAUSES PROBLEMS(Not Anymore...Yet)
if !Wall_IsLeft(tank, global.wallGap+10) && 
   !Wall_IsRight(tank, global.wallGap+10) &&
   !Wall_IsAbove(tank, global.wallGap+10) &&
   !Wall_IsBelow(tank, global.wallGap+10)
    {
        tank.spdControl = spdControl.auto;
        tank.ignoreWall = ignoreWall.none;
        tank.firstWall = firstWall.none;
        tank.wallHug = wallHug.none;//*/
    }

//Move Tank Closer to Wall
if tank.wallHug != wallHug.none
{
    if tank.wallHug == wallHug.left && tank.spdDir != spdDir.right
    {
        if !Wall_IsLeft(tank, global.wallGap + 1)
            tank.x--;
    }
    else if tank.wallHug == wallHug.right && tank.spdDir != spdDir.left
    {
        if !Wall_IsRight(tank, global.wallGap + 1)
            tank.x++;
    }
    else if tank.wallHug == wallHug.above && tank.spdDir != spdDir.down
    {
        if !Wall_IsAbove(tank, global.wallGap + 1)
            tank.y--;
    }
    else if tank.wallHug == wallHug.below && tank.spdDir != spdDir.up
    {
        if !Wall_IsBelow(tank, global.wallGap + 1)
            tank.y++;
    }
}

//Fix Tank is Stuck Action
//

//CHANGE: '- 1'
WallisLeft = (Wall_IsLeft(tank, global.wallGap - 1));
WallisRight = (Wall_IsRight(tank, global.wallGap - 1));
WallisTop = Wall_IsAbove(tank, global.wallGap - 1);
WallisDown = Wall_IsBelow(tank, global.wallGap - 1);

//tooFarFromWall

//This will check if the tank can turn LEFT
if tank.movDir == movDir.forward
{   //Check for LEFT Turns
    if (tank.wallHug == wallHug.left && (tank.tankDir == tankDir.up || tank.tankDir == tankDir.upLeft) ||
        tank.wallHug == wallHug.right && (tank.tankDir == tankDir.down || tank.tankDir == tankDir.downRight) ||
        tank.wallHug == wallHug.above && (tank.tankDir == tankDir.right || tank.tankDir == tankDir.upRight) ||
        tank.wallHug == wallHug.below && (tank.tankDir == tankDir.left || tank.tankDir == tankDir.downLeft))
        tank.canLeft = false;
    else
        tank.canLeft = true;
        
    //Check for RIGHT Turns
    if (tank.wallHug == wallHug.left && (tank.tankDir == tankDir.down || tank.tankDir == tankDir.downLeft) ||
        tank.wallHug == wallHug.right && (tank.tankDir == tankDir.up || tank.tankDir == tankDir.upRight) ||
        tank.wallHug == wallHug.above && (tank.tankDir == tankDir.left || tank.tankDir == tankDir.upLeft) ||
        tank.wallHug == wallHug.below && (tank.tankDir == tankDir.right || tank.tankDir == tankDir.downRight))
        tank.canRight = false;
    else
        tank.canRight = true;            
}
else if tank.movDir == movDir.reverse
{   //Check for LEFT Turns     
    if (tank.wallHug == wallHug.left && (tank.tankDir == tankDir.down || tank.tankDir == tankDir.downRight) ||
        tank.wallHug == wallHug.right && (tank.tankDir == tankDir.up || tank.tankDir == tankDir.upLeft) ||
        tank.wallHug == wallHug.above && (tank.tankDir == tankDir.left || tank.tankDir == tankDir.downLeft) ||
        tank.wallHug == wallHug.below && (tank.tankDir == tankDir.right || tank.tankDir == tankDir.upRight))
        tank.canLeft = false;
    else
        tank.canLeft = true;
        
    //Check for RIGHT Turns
    if (tank.wallHug == wallHug.left && (tank.tankDir == tankDir.up || tank.tankDir == tankDir.upRight) ||
        tank.wallHug == wallHug.right && (tank.tankDir == tankDir.down || tank.tankDir == tankDir.downLeft) ||
        tank.wallHug == wallHug.above && (tank.tankDir == tankDir.right || tank.tankDir == tankDir.downRight) ||
        tank.wallHug == wallHug.below && (tank.tankDir == tankDir.left || tank.tankDir == tankDir.upLeft))
        tank.canRight = false;
    else
        tank.canRight = true;
}
else
{   //Check for LEFT Turns
    if (tank.wallHug == wallHug.left && tank.tankDir == tankDir.up) ||
       (tank.wallHug == wallHug.right && tank.tankDir == tankDir.down) ||
       (tank.wallHug == wallHug.above && tank.tankDir == tankDir.right) ||
       (tank.wallHug == wallHug.below && tank.tankDir == tankDir.left)
        tank.canLeft = false;
    else
        tank.canLeft = true;
        
    if (tank.wallHug == wallHug.left && tank.tankDir == tankDir.down) ||
       (tank.wallHug == wallHug.right && tank.tankDir == tankDir.up) ||
       (tank.wallHug == wallHug.above && tank.tankDir == tankDir.left) ||
       (tank.wallHug == wallHug.below && tank.tankDir == tankDir.right)
        tank.canRight = false;
    else
        tank.canRight = true;   
}
    
    
//Move tank away from any walls near it
if WallisLeft && (tank.direction != 0 && tank.direction != 180)
    tank.x += 1; 
    
if WallisRight && (tank.direction != 0 && tank.direction != 180)
    tank.x -= 1;
    
if WallisTop && (tank.direction != 90 && tank.direction != 270)
    tank.y += 1;

if WallisDown && (tank.direction != 90 && tank.direction != 270)
tank.y -= 1;
    
//Check if the tank can move forward
tank.canForward = CheckCanForward(tank);

//Check if the tank can reverse
tank.canReverse = CheckCamReverse(tank);

    
//Check if tank is colliding with a wall
if Wall_IsHere(tank.x, tank.y) //!WallisLeft && !WallisRight && !WallisAbove && !WallisBelow
    tank.Collide = true;
else
    tank.Collide = false;
    
if !tank.Collide
{
    //Reset the turn requests (from <left> <right> buttons)
    tank.leftTurnReq = false;
    tank.rightTurnReq = false;
    
    //Stop the movement TO wall
    if tank.wallHug != wallHug.none && tank.direction == tank.finalDegree
    {
        //SET WALL HUGG => FALSE HERE
        tank.rotate = false;
        
        //Reset which wall the tank collided with first
        tank.firstWall = firstWall.none;
        /*tank.rightFirst = false;
        tank.topFirst = false;
        tank.leftFirst = false;
        tank.subFirst = false;*/
    }
}

//Check if tank is stuck
if (tank.savedX == tank.x && tank.savedY == tank.y) && (tank.Collide || TankIs_OutOfBounds(tank))
{   
    tank.numSteps++;
    if tank.numSteps == global.waitTime_CheckIfStuck
        TankIsStuck(tank);
}else
    tank.numSteps = 0;

tank.savedX = tank.x;
tank.savedY = tank.y;
