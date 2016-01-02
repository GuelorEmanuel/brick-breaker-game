/*
 * Class GameEngine: Responsible for controlling the game flow 
 */
class GameEngine {

  private Ball  ball;
  private Paddle paddle;
  private Brick [][] bricks;

  private int lives;
  private int row;
  private int columns;
  private int score;
  private int gameScore;
  private int screen = 0;
  private boolean pressedEnterVal;
  boolean didWeWin;

  GameEngine( int row, int col, int score, int gScore) {
    this.row        = row;
    columns         = col;
    this.score      = score;
    gameScore       = gScore;
    lives           = 3;
    pressedEnterVal = false;
    didWeWin        = false;


    paddle = new Paddle();
    bricks = new Brick[this.row][columns];

    for (int i = 0; i < row; ++i) {
      for (int j = 0; j < columns; ++j) {
        bricks[i][j] = new Brick((i+1) * width/(columns+7), (j+2)*25, 50, 25, 255, 0, 0);
      }
    }
  }

/*
 * method to update the game
 */
  void update() {
    float tmp = 0;
    float tmp2 = 0;

    println("3");
    for (int i = 0; i < row; ++i) {
      for (int j = 0; j < columns; ++j) {
        bricks[i][j].draw();
      }
    }

    for (int i = 0; i < row; ++i) {
      for (int j = 0; j < columns; ++j) {
        if (ball != null) {
          tmp = ball.getY() + ball.getDY();
          if ( tmp < ball.getRad() ) {
            ball.changeYCoordinate();
          }
          //check if ball impacted with paddle
          if (ball != null && paddle.gotHit(ball)) {
            ball.changeYCoordinate();
            paddle.changXVelocityBall(ball);
            ball.update();
          }
          if (bricks[i][j] != null && bricks[i][j].gotHit(ball) == true &&  bricks[i][j].getCollided() == false) {

            ball.changeYCoordinate();
            ball.changeXCoordinate();
            //bricks[i][j] = null;
            ball.update();
          }
          if ( bricks[i][j].getCollided()) {
            bricks[i][j].setRGB(0, 0, 0);
            weWon();
            if ( didWeWin) {
              bricks[i][j].resetGame();
            }
          }
          if (bricks[i][j].getNumXCollided() == 0 ) {
            bricks[i][j].setRGB(255, 0, 0);
          } else if (bricks[i][j].getNumXCollided() == 1 ) {
            bricks[i][j].setRGB(250, 152, 23);
          } else if (bricks[i][j].getNumXCollided() == 2 ) {
            bricks[i][j].setRGB(255, 255, 0);
          } else if (bricks[i][j].getNumXCollided() == 3 ) {
            bricks[i][j].setRGB(74, 211, 30);
          } else if (bricks[i][j].getNumXCollided() == 4 ) {
            bricks[i][j].setRGB(0, 0, 255);
          } else {
            bricks[i][j].setRGB(0, 0, 0);
          }
        }
      }
    }

    //check if ball is bellow screen
    if (ball != null && ball.getY()-ball.getRad() > height) {
      lives--;
      ball = null;
    }
    if (ball !=null) {
      ball.draw();
      ball.update();
    }
    paddle.update();
  }

  void newBall() {
    if ( ball == null && ( lives > 0 && lives <= 3)) {
      ball   = new Ball(width*1/2, height-paddle.getH(), 0, -2);
    }
  }

  void increasePaddle() {
    paddle.cheat();
  }

  // Method to check if we won
  void weWon() {
    for (int i = 0; i < row; ++i) {
      for (int j = 0; j < columns; ++j) {
        didWeWin = true;
        if (bricks[i][j]. getCollided() != true ) {
          didWeWin = false;
          break;
        }
      }
    }
  }

  void gameOver() {
    background (0);
    textSize(random(15, 16));
    text ("GAME OVER", width*1/2, height*1/2);
  }

  void startGame() {
    background (0);
    //stroke (0);
    textSize(random(15, 16));
    text ("Press Enter to Start Game", width*1/2, height*1/2);
  }

  void youWin() {
    background (0);
    //stroke (0);
    textSize(random(15, 16));
    text ("You win", width*1/2, height*1/2);
  }

  void pressedEnter(boolean passed) {
    pressedEnterVal = passed;
  }

  void levels() {
    background(0);
    fill(255);

    //test which screen I am on
    if ( screen == 0 ) {
      if (pressedEnterVal == false) {
        startGame();
      }
      if (pressedEnterVal) {
        update();
        if ((lives == 0)) {
          screen = 1;
        }
      }
    } else if ( screen == 1 ) {
      gameOver();
    } else if ( screen == 2) {
      youWin();
    }
  }
}

