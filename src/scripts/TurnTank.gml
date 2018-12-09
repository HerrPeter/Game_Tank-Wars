///TurnTank(Tank, left?, finalDegree, SpecialTurn?)
tank = argument0;
left = argument1;
finalDegree = argument2;
specialTurn = argument3;

if tank.direction != finalDegree && !specialTurn
{        
    if left
    {
        if tank.direction <= (finalDegree - global.TurnSpd)            
            tank.direction += global.TurnSpd; 
        else
            tank.direction += 1;   
    }
    else
    {
        if tank.direction >= (finalDegree + global.TurnSpd)
            tank.direction -= global.TurnSpd;
        else
            tank.direction -= 1;
    }
}
else if tank.direction != finalDegree && specialTurn
{
    if tank.direction != (finalDegree - global.TurnSpd)
        tank.direction += global.TurnSpd;
    else
        tank.direction += 1;

}
