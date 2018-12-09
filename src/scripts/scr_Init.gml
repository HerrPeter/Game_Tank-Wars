//These control the vars shared by both tanks
global.TurnSpd = 3;         //The speed at which the tank will rotate
global.MaxSpd = 6;          //The maximum speed the tank will move
global.wallGap = 15;        //Use this to increase/decrease the gap between the tank and the wall
global.waitTime_CheckIfStuck = 30   //Time to wait until checks to see if tank is stuck
global.Grav = 0.1;          //This is how the tnak will slow down

//These keep the score per player
global.Score1 = 0;
global.Score2 = 0;

//Game Settings
global.paused = false;

//These vars determine the direction the tank will turn (based on its subimage)
global.deg_RightTop = 6;    //Replace global.deg_UpRight
global.deg_RightSub = 359;  //Replace global.deg_DwnRight

global.deg_TopRight = 89;
global.deg_TopLeft = 96;

global.deg_LeftTop = 179;   //Replace global.deg_UpLeft
global.deg_LeftSub = 186;   //Replace global.deg_DwnLeft

global.deg_DownLeft = 269;
global.deg_DownRight = 276;

//Vars for items
global.smShellSpd = 16;
numSecs = 2;                //Set the number of seconds the shield will be active
global.shieldTime = 60 * numSecs;

randomize();                //Generate true random numbers
