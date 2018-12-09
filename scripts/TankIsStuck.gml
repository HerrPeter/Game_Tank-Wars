///TankIsStuck(Tank)
tank = argument0;
keepSearch = true;
shiftX = 0;
shiftY = 0;

newX = tank.x + shiftX;
newY = tank.y + shiftY;

searchFail = false;

//Direction to check
enum chkPosition
{
    right,
    upRight,
    up,
    upLeft,
    left,
    dwnLeft,
    dwn,
    dwnRight,
    fail
}

chkPosition = chkPosition.right;

while(keepSearch)
{      
    if (!place_meeting(newX, newY, ob_Wall_1) && !place_meeting(newX, newY, ob_Wall_2) &&
        !TankIs_OutOfBounds(tank) && place_empty(newX, newY))
    {
        tank.x = newX;
        tank.y = newY;
        
        //if chkPosition == chkPosition.fail
        keepSearch = false;     //CONTINUE
    }
    else
    {
        switch chkPosition
        {
            case chkPosition.right:
                if shiftX <= 500
                    shiftX++;
                else
                {   //Move on
                    shiftX = 0; shiftY = 0;
                    chkPosition = chkPosition.upRight;
                }
                break;
            case chkPosition.upRight:
                if shiftX <= 500
                    shiftX++;
                if shiftY >= -500
                    shiftY--;
                else
                {   //Move on
                    shiftX = 0; shiftY = 0;
                    chkPosition = chkPosition.up;
                }
                break;
            case chkPosition.up:
                if shiftY >= -500
                    shiftY--;
                else
                {   //Move on
                    shiftX = 0; shiftY = 0;
                    chkPosition = chkPosition.upLeft;
                }
                break;
            case chkPosition.upLeft:
                if shiftX >= -500
                    shiftX--;
                if shiftY >= -500
                    shiftY--;
                else
                {   //Move on
                    shiftX = 0; shiftY = 0;
                    chkPosition = chkPosition.left;
                }
                break;
             case chkPosition.left:
               if shiftY >= -500
                    shiftY--;
                else
                {   //Move on
                    shiftX = 0; shiftY = 0;
                    chkPosition = chkPosition.dwnLeft;
                }
                break;
            case chkPosition.dwnLeft:
                if shiftX >= -500
                    shiftX--;
                if shiftY <= 500
                    shiftY++;
                else
                {   //Move on
                    shiftX = 0; shiftY = 0;
                    chkPosition = chkPosition.dwn;
                }
                break;
            case chkPosition.dwn:
               if shiftY >= 500
                    shiftY++;
                else
                {   //Move on
                    shiftX = 0; shiftY = 0;
                    chkPosition = chkPosition.dwnRight;
                }
                break;
            case chkPosition.dwnRight:
                if shiftX <= 500
                    shiftX++;
                if shiftY <= 500
                    shiftY++;
                else
                {   //Move on
                    shiftX = 0; shiftY = 0;
                    chkPosition = chkPosition.fail;
                }
                break;
            default:
                if TankIs_OutOfBounds(tank) //|| searchFail
                    {
                        show_message("Couldn't Find Free Place to move your Tank...so I've reset your Tank =(");
                        
                        tank.x = tank.xstart;
                        tank.y = tank.ystart;    
                        
                        //chkPosition = chkPosition.right; IF BROKEN...uncomment
                    }            
//                searchFail = true;
                break;
        }
        
        newX = tank.x + shiftX;
        newY = tank.y + shiftY;
    }
}


