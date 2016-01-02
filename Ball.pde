/*
 * Class for ball
 */
class Ball {

  private int x; //ball x-coordinate
  private int y; //ball y-coordinate
  private int dX; //ball velocity for x-coordinate
  private int dY; //ball velocity for y-coordinate
  private int radius; //ball diameter
  private color ballColor;

  /*
   * Ball default constructor
   */
  Ball(int x, int y, int dX, int dY) {
    this.x    = x*1/2;
    this.y    = y*1/2;
    this.dX   = dX ; // no horizontal movements when the game starts
    this.dY   = dY;
    radius    = 10; 
    ballColor = color(random(255), random(255), random(255));
  }

  /*
   * Method: update the ball x-coordinate and y-coordinate
   *
   */
  void update() {
    x  +=dX;
    y  +=dY;
    //tmp = ball.getX() + ball.getDX();
    //println(ball != null && paddle.gotHit(ball));
    if ( x < 0 || x > width- radius) {
      changeXCoordinate();
    }
  }

  void draw() {
    fill(ballColor);
    ellipse(x, y, radius*2, radius*2);
  }

  /*
   * Method: bounce the ball
   */
  void changeXCoordinate() {
    dX *= -1;
  }

  /*
   * Method: change Y coordiunate
   */
  void changeYCoordinate() {
    dY *= -1;
  }

  void moveLeft() {
    dX = -3;
  }

  void moveRight() {
    dX = 3;
  }

  /*
   * Get Methods for Ball classs
   */
  int getX() { 
    return x;
  }

  int getDX() {
    return dX;
  }
  int getY() { 
    return y;
  }
  int getDY() {
    return dY;
  }

  int getRad() {
    return radius;
  }

  void setDX(int dx) {
    dX += dx;
  }
}

