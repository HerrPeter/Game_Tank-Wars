///scr_MoveBackward(Tank)
//This handles wall collisions while moving backwards
if global.paused
exit;

tank = argument0;
oldDir = tank.direction;


//This handles a left wall collision
if Wall_IsLeft(tank, global.wallGap - 1) && dir_chk_Right(tank)
{
    //Control tank spd manually
    SpdCtrlTo(false, tank);
    tank.speed = 0;
    tank.direction = oldDir;
    
    //Check if this is the first wall the tank collides with
    if tank.firstWall != firstWall.left && tank.firstWall == firstWall.none
        tank.firstWall = firstWall.left;
    
    //Handle tank colliding at different directions
    if tank.firstWall == firstWall.left
    {
        tank.wallHug = wallHug.left;
        tank.specialTurn = false;
        
        switch(tank.tankDir)
        {
            case tankDir.upRight:
                tank.finalDegree = 90;
                tank.turnLeft = true;
                tank.canRight = false;
                tank.rotate = true;
                tank.spdDir = spdDir.down;
                break;
            
            case tankDir.downRight:
                tank.finalDegree = 270;
                tank.turnLeft = false;
                tank.canLeft = false;
                tank.rotate = true;
                tank.spdDir = spdDir.up;
                break;
                
            case tankDir.right:
                tank.rotate = false;
                tank.spdDir = spdDir.left;
                break;
            default:
                SpdCtrlTo(true, tank);
        }
    }
}


//This handles a sub wall collision
if Wall_IsAbove(tank, global.wallGap - 1) && dir_chk_Below(tank)
{
    //Control tank spd manually
    SpdCtrlTo(false, tank);
    tank.speed = 0;
    tank.direction = oldDir;
    
    //Check if this is the first wall the tank collides with
    if tank.firstWall != firstWall.above && tank.firstWall == firstWall.none
        tank.firstWall = firstWall.above;
    
    //Handle tank colliding at different directions
    if tank.firstWall == firstWall.above
    {
        tank.wallHug = wallHug.above;
        
        switch(tank.tankDir)
        {
            case tankDir.downRight:
                tank.finalDegree = 0;
                tank.turnLeft = true;
                tank.canRight = false;
                tank.rotate = true;
                tank.spdDir = spdDir.left;
                tank.specialTurn = true;
                break;
            
            case tankDir.downLeft:
                tank.finalDegree = 180;
                tank.turnLeft = false;
                tank.canLeft = false;
                tank.rotate = true;
                tank.spdDir = spdDir.right;
                tank.specialTurn = false;
                break;
                
            case tankDir.down:
                tank.rotate = false;
                tank.spdDir = spdDir.up;
                break;
            default:
                SpdCtrlTo(true, tank);
        }
    }
}

//This handles a right wall collision
if Wall_IsRight(tank, global.wallGap - 1) && dir_chk_Left(tank)
{
    //Control tank spd manually
    SpdCtrlTo(false, tank);
    tank.speed = 0;
    tank.direction = oldDir;
    
    //Check if this is the first wall the tank collides with
    if tank.firstWall != firstWall.right && tank.firstWall == firstWall.none
        tank.firstWall = firstWall.right;
    
    //Handle tank colliding at different directions
    if tank.firstWall == firstWall.right
    {
        tank.wallHug = wallHug.right;
        tank.specialTurn = false;
                           
        switch(tank.tankDir)
        {
            case tankDir.upLeft:
                tank.finalDegree = 90;
                tank.turnLeft = false;
                tank.canLeft = false;
                tank.rotate = true;
                tank.spdDir = spdDir.down;
                break;
            
            case tankDir.downLeft:
                tank.finalDegree = 270;
                tank.turnLeft = true;
                tank.canRight = false;
                tank.rotate = true;
                tank.spdDir = spdDir.up;
                break;
                
            case tankDir.left:
                tank.rotate = false;
                tank.spdDir = spdDir.right;
                break;
            default:
                SpdCtrlTo(true, tank);
        }
    }
}

//This handles a sub wall collision
if Wall_IsBelow(tank, global.wallGap - 1) && dir_chk_Above(tank)
{
    //Control tank spd manually
    SpdCtrlTo(false, tank);
    tank.speed = 0;
    tank.direction = oldDir;
    
    //Check if this is the first wall the tank collides with
    if tank.firstWall != firstWall.below && tank.firstWall == firstWall.none
        tank.firstWall = firstWall.below;
    
    //Handle tank colliding at different directions
    if tank.firstWall == firstWall.below
    {
        tank.wallHug = wallHug.below;
        tank.specialTurn = false;
                           
        switch(tank.tankDir)
        {
            case tankDir.upLeft:
                tank.finalDegree = 180;
                tank.turnLeft = true;
                tank.canRight = false;
                tank.rotate = true;
                tank.spdDir = spdDir.right;
                break;
            
            case tankDir.upRight:
                tank.finalDegree = 0;
                tank.turnLeft = false;
                tank.canLeft = false;
                tank.rotate = true;
                tank.spdDir = spdDir.left;
                break;
                
            case tankDir.up:
                tank.rotate = false;
                tank.spdDir = spdDir.down;
                break;
            default:
                SpdCtrlTo(true, tank);
        }
    }
}

//Rotate the tank when it hits the wall
if tank.rotate
{
    if tank.direction != tank.finalDegree
    {
        TurnTank(tank, tank.turnLeft, tank.finalDegree, tank.specialTurn);
    }
    else
    {
        tank.rotate = false;
        tank.firstWall = firstWall.none;
        tank.ignoreWall = ignoreWall.none;
        SpdCtrlTo(true, tank);
    }
    
    //while tank.leftFirst && !Wall_IsLeft(tank, global.wallGap - 2)
    //    tank.x--;
}

if tank.canReverse
{
    if tank.spdControl == spdControl.auto
    {
        if (tank.speed >= (global.MaxSpd * -1))
        {
            tank.speed -= 1;
        }
    }
    else if tank.spdControl == spdControl.manual
    {
        if tank.currSpd >= (global.MaxSpd * -1)
            tank.currSpd -= 1;
        
        switch(tank.spdDir)
        {
            case spdDir.right:
                tank.x += abs(tank.currSpd);
                break;
            case spdDir.up:
                tank.y -= abs(tank.currSpd);
                break;
            case spdDir.left:
                tank.x -= abs(tank.currSpd);
                break;
            case spdDir.down:
                tank.y += abs(tank.currSpd);
                break;
        }
    }
}
