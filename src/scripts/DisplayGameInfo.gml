draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, room_width, room_width, 0);
draw_set_font(fnt_Arial);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(room_width/2, 100, "Tank Wars - Game Info");
draw_set_halign(fa_left);

//Draw Directions
draw_text(room_width/2-400, 150, "##- Game Controls:"
        + "##   * Player 1 (Left-Screen):"
        + "#        - W/S/A/D Keys -> move Player 1's Tank around the map."
        + "#        - Spacebar -> fire missiles."
        + "#        - Ctrl button -> fire / activate power ups."
        + "#        - 'R' Key -> Free Tank Manually if Stuck or Out of Bounds."
        + "##   * Player 2 (Right-Screen):"
        + "#        - Numpad 8/5/4/6 or Arrow Keys -> move Player 2's Tank around the map."
        + "#        - Enter Key -> fire missiles."
        + "#        - Backspace -> fire / acticate power ups."
        + "#        - Numpad 7 -> Free Tank Manually if Stuck or Out of Bounds."
        + "##   * Misc:"
        + "#        - F1 Key -> Display this help screen."
        + "#        - Esc -> Quit Game."
        + "###- Game Objective:"
        + "##    - Each Player is given a tank that they must use to defeat the other player."
        + "#    - The first player to destroy their opponent's tank, WINS!!!"
        + "#    - There are power ups that are constantly moved accross the map that will"
        + "#      provide the player with a corresponding advantage:"
        + "#        - Rocket: Homing Missile that moves towards your opponent!"
        + "#        - Bouncing Betty: This rocket will bounce off walls until it evaporates!"
        + "#        - Shield: Grab one of these to temporarily defend yourself agains incoming projectiles."
        + "#        - Health Pack: Grab a health pack when your low on health to get you back in the game!"
        + "###    - Good Luck to the Both O' You, may the strongest player WINNN!!!");

//Reset Values
draw_set_color(c_black);
draw_set_halign(fa_center);
