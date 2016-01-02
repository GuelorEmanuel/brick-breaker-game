/* 
 * Problem 5  : Breakout
 * Description: A simplified version of the game berakout 
 * Author: Guelor Emanuel
 */
GameEngine game; // create a GameEngine empty Object

void setup() {
  size(600, 400);
  game = new GameEngine(11, 5, 0, 0); // create the object
}

void draw() {
  background(0);
  game.levels(); //update the object
}

void mouseClicked() {
  game.newBall(); // create the game ball
  game.increasePaddle(); // changle paddle width
}

void keyPressed() {
  if ( key == 10) {
    game.pressedEnter(true); // Check if the player pressed Enter to start the game
  }
   
}

