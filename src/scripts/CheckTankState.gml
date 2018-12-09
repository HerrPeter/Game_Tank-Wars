///CheckTankState(Tank)
tank = argument0;

if tank.type == type.tank1
{
    player1_forward = keyboard_check(ord('W'));
    player1_reverse = keyboard_check(ord('S'));

    if player1_forward
    {
        if tank.prevMovDir == prevMovDir.reverse && tank.movDir != movDir.forward && tank.wallHug != wallHug.none
            {
                tank.currSpd = 0;
                switch(tank.spdDir)
                {
                    case spdDir.up:
                        tank.spdDir = spdDir.down;
                        break;
                    case spdDir.down:
                        tank.spdDir = spdDir.up;
                        break;
                    case spdDir.right:
                        tank.spdDir = spdDir.left;
                        break;
                    case spdDir.left:
                        tank.spdDir = spdDir.right;
                        break;                     
                }
            }//*/
            
        tank.movDir = movDir.forward;
    }
    else if player1_reverse
    {
        if tank.prevMovDir == prevMovDir.forward && tank.movDir != movDir.reverse && tank.wallHug != wallHug.none
            {
                tank.currSpd = 0;
                switch(tank.spdDir)
                {
                    case spdDir.up:
                        tank.spdDir = spdDir.down;
                        break;
                    case spdDir.down:
                        tank.spdDir = spdDir.up;
                        break;
                    case spdDir.right:
                        tank.spdDir = spdDir.left;
                        break;
                    case spdDir.left:
                        tank.spdDir = spdDir.right;
                        break;                 
                }
            }//*/
    
        tank.movDir = movDir.reverse;
    }
    else
    {   
        if tank.movDir == movDir.forward
            tank.prevMovDir = prevMovDir.forward;
        else if tank.movDir == movDir.reverse
            tank.prevMovDir = prevMovDir.reverse
            
        tank.movDir = movDir.stop;
    }
}else if tank.type == type.tank2
{
    player2_forward = keyboard_check(vk_numpad8) || keyboard_check(vk_up);
    player2_reverse = keyboard_check(vk_numpad5) || keyboard_check(vk_down);
    
    if player2_forward
    {
        if tank.prevMovDir == prevMovDir.reverse && tank.movDir != movDir.forward && tank.wallHug != wallHug.none
            {
                tank.currSpd = 0;
                switch(tank.spdDir)
                {
                    case spdDir.up:
                        tank.spdDir = spdDir.down;
                        break;
                    case spdDir.down:
                        tank.spdDir = spdDir.up;
                        break;
                    case spdDir.right:
                        tank.spdDir = spdDir.left;
                        break;
                    case spdDir.left:
                        tank.spdDir = spdDir.right;
                        break;                     
                }
            }//*/
            
        tank.movDir = movDir.forward;
    }
    else if player2_reverse
    {
        if tank.prevMovDir == prevMovDir.forward && tank.movDir != movDir.reverse && tank.wallHug != wallHug.none
            {
                tank.currSpd = 0;
                switch(tank.spdDir)
                {
                    case spdDir.up:
                        tank.spdDir = spdDir.down;
                        break;
                    case spdDir.down:
                        tank.spdDir = spdDir.up;
                        break;
                    case spdDir.right:
                        tank.spdDir = spdDir.left;
                        break;
                    case spdDir.left:
                        tank.spdDir = spdDir.right;
                        break;                 
                }
            }//*/
    
        tank.movDir = movDir.reverse;
    }
    else
    {   
        if tank.movDir == movDir.forward
            tank.prevMovDir = prevMovDir.forward;
        else if tank.movDir == movDir.reverse
            tank.prevMovDir = prevMovDir.reverse
            
        tank.movDir = movDir.stop;
    }
}
