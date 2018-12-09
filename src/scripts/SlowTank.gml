///ShowTank(Tank)
//Technically BROKEN
tank = argument0;

if tank.spdControl == spdControl.manual
{
    if tank.movDir == movDir.stop
    {            
        if tank.prevMovDir == prevMovDir.forward///USED TO BE movDir
        {
            if tank.currSpd - global.Grav <= 0
                tank.currSpd = 0;
                
            if tank.currSpd > 0
                tank.currSpd -= global.Grav;
        }else
        {
            if tank.currSpd + global.Grav >= 0
                tank.currSpd = 0;   
                
            if tank.currSpd < 0
                tank.currSpd += global.Grav; 
        }//*/
    }   
}
