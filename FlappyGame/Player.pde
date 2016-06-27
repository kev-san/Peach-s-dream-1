class Player {
  float xPos;
  float yPos;
  float objWidth;
  float objHeight;
  float jumpImpulse;
  float gravity;
  float yVelocity;
  PImage peach;
  Player() {
    peach=loadImage("peach.png");
     yVelocity=0;
    jumpImpulse = -9;
    gravity = (float)0.5;
    objWidth = 90;
    objHeight = 115;
    xPos = 50;
    yPos = (height/2) - objHeight;
  }

  // Shows player.
  void show() {
    // WRITE METHOD
    image(peach,xPos,yPos,objWidth,objHeight);
  }

  // Moves player down.
  void move() {
    // WRITE METHOD
    yVelocity=yVelocity+gravity;
    yPos=yPos+yVelocity;
  }

  // Moves player up.
  void jump() {
    // WRITE METHOD
    yVelocity=jumpImpulse;
  }
}