///SpdCtrlTo(Auto, Tank)
ToAuto = argument0;
tank = argument1;

if ToAuto
{
    tank.spdControl = spdControl.auto;
    tank.speed = tank.currSpd;
    tank.ignoreWall = ignoreWall.none;
    tank.spdDir = spdDir.auto;
}
else
{
    tank.spdControl = spdControl.manual;
    tank.currSpd = abs(tank.speed);
}
