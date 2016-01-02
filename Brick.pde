/*
 * Class Bricks
 */
class Brick {
  private float x; //bric x-coordinate
  private float y; //brick y-coordinate
  private float w; 
  private float h;
  private float r; //brick red val
  private float g; //grick green val
  private float b; //brick blue val
  private int numXCollided;

  private boolean collided; //whether or not brick has been hit

  Brick(float x, float y, float w, float h, float r, float g, float b) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.r = r;
    this.g = g;
    this.b = b;

    collided      = false; //brick is initially not hit
    numXCollided  = 0;
  }

  /*
   *
   */
  void draw() {
    rectMode(CENTER);
    fill(r, g, b);
    rect(x, y, w, h);
  }

  /*
    * Method : brick got hit
   */
  void destroyBrick() {

    if (collided) {
      r = 0;
      g = 0;
      b = 0;
    }
  }

  boolean gotHit(Ball b) {


    if (x - w*1/2 <= b.getX() &&
      b.getX() <= x+ w*1/2 &&
      y+w*1/2 > b.y-b.getRad()) {
      if (numXCollided == 5) {
        collided = true;
      }
      numXCollided++;
      return true;
    } else
      return false;
  }
  
  /*
   * Get Methods for Brick classs
   */
  float getX() { 
    return x;
  }
  float getY() { 
    return y;
  }
  float getW() { 
    return w;
  }
  float getH() { 
    return h;
  }
  int getNumXCollided() { 
    return numXCollided;
  }
  boolean getCollided() {
    return collided;
  }

  void setRGB(float red, float green, float blue) {
    r = red;
    g = green;
    b = blue;
  }
  
  void resetGame() {
    numXCollided = 0;
    collided = false;
    
  }
}

