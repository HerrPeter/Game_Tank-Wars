///TankIsBetween(Direction, Min, Max, Include)
DIR = argument0;
MIN = argument1;
MAX = argument2;
INCLUDE = argument3;

if INCLUDE
{
    if (DIR >= MIN) && (DIR <= MAX)
        return true;
    else
        return false;
}
else
{
    if (DIR > MIN) && (DIR < MAX)
        return true;
    else
        return false;
}
