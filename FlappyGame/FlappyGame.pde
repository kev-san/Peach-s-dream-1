int score;
int gameState; // 0 = start, 1 = running, 2 = over
Player kev;
Pipe pipeOne;
PImage backgroundimage;
void setup() {
  size(500, 500);
  
  score = 0;
  gameState=0;
  kev = new Player();
  pipeOne=new Pipe(1);
  backgroundimage=loadImage("peach's castle.jpeg");
}

void draw() {
  image(backgroundimage,0,0,width,height);
  if (gameState == 0) {
    // game start
    fill(25, 215, 57);
    textSize(30);
    text("my game", 100, 100);
    kev.show();
  } else if (gameState == 1) {
    if (kev.yPos<0|| kev.yPos+kev.objHeight> height) {
        gameState=2;
    }
    if (kev.xPos<pipeOne.xPos+ pipeOne.objWidth && kev.xPos +kev.objWidth> pipeOne.xPos
      && kev.yPos< pipeOne.yPos+pipeOne.objHeight && kev.yPos+kev.objHeight>pipeOne.yPos) {
      gameState=2;
    }
    if (pipeOne.counted== false && pipeOne.xPos + pipeOne.objWidth< kev.xPos) {
      score = score +1;
      pipeOne.counted=true;
    }
    // game running
    kev.show();
    kev.move();
    pipeOne.show();
    pipeOne.move();
    text(score, 200, 200);
  } else { // gameState == 2
    // game over
    textSize(30);
    text("GameOver", 170, 100);
    kev.show();
    pipeOne.show();
  }
  println(gameState);
}

void keyPressed() {
  if (key==' ' && gameState==0) {
    gameState=1;
  }
  if (key==' ' && gameState ==1) {
    kev.jump();
  }
  if (key==' ' && gameState==2) {
    score =0;
    gameState=1;
    kev=new Player();
    pipeOne=new Pipe(1);
    kev.jump();
  }
}

void mousePressed() {
  if (key==' ' && gameState==1) {
    kev.jump();
  }
}