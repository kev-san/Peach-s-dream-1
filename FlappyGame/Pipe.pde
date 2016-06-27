class Pipe {
  float xPos;
  float yPos;
  float objWidth;
  float objHeight;
  boolean counted;
  float xVelocity;
  float location;

  Pipe(int num) {
    counted = false;
    objWidth = 50;
    objHeight = 250;
    xPos = width + (num * (width/2));
    yPos = chooseYPos();
    xVelocity= -5;
  }

  // Shows pipe.
  void show() {
    // WRITE METHOD
    fill(int(random(255)));
    rect(xPos, yPos, objWidth, objHeight);
  }

  // Moves pipe across the screen.
  void move() {
    // WRITE METHOD
    xPos=xPos+xVelocity;
    if (xPos+objWidth<0) {
      reset();
    }
  }

  // Resets pipe at initial location.
  void reset() {
    xPos=width;
    counted=false;
    yPos=chooseYPos();
    // WRITE METHOD
  }

  // Returns y position for either top pipe or bottom pipe.
  float chooseYPos() {
    int location=(int)random(2);
    if (location==0) {
      return 0;
    } else {
      return height-objHeight;
    }
  }
}