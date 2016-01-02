/*
 * Paddle class
 */
class Paddle {
  private int x; //ball x-coordinate
  private int y; //ball y-coordinate
  private int w; //paddle width
  private int h; //paddle width
  private float r, g, b;
  private int temp; 
  private int change;
  private int sizeChange;

  //Constructor
  Paddle() {
    x = constrain(mouseX, w/2, width-w*1/2);
    temp = x;
    w = 50;
    h = 10;
    y = height-h;
    r = random(255);
    g = random(255);
    b = random(255);
  }

  /* Methdod: update the paddle
   *
   */
  void update() {

    temp = x;
    x = constrain(mouseX, w/2, width-w*1/2);

    fill(r, g, b);
    rectMode(CENTER);
    rect(x, y, w, h);
  }
  /*
   * Get Methods for Paddle classs
   */
  int getX() { 
    return x;
  }
  int getY() { 
    return y;
  }
  int getW() { 
    return w;
  }
  int getH() { 
    return h;
  }

  void setRGB(float red, float green, float blue) {
    r = red;
    g = green;
    b = blue;
  }

  boolean gotHit(Ball b) {
    if (x - w*1/2 <= b.getX() &&
      b.getX() <= x+ w*1/2 &&
      y-h*1/2 < b.y+b.getRad()) {
      return true;
    } else
      return false;
  }

  void changXVelocityBall(Ball b) {
    int xDX = x - temp;
    println(sizeChange);
    b.setDX(xDX);
  }

  void cheat() {
    change = constrain(sizeChange, 0, width);
    sizeChange +=1;
    w +=1;
  }
}

