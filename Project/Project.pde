PImage img;
Snake snake;
Food food;

boolean ismoved=false;
boolean isUp=false;
boolean isDown=false;
boolean isRight=false;
boolean isLeft=false;
boolean lose = false;
int highscore;



void setup() {

  size(1000, 800);

  snake = new Snake();
  food = new Food();


  rectMode(CENTER);
  noStroke();
  frameRate(20);

  highscore=0;
  img = loadImage("stardust.png");
}






void draw() {
  image(img,0,0,width,height);

  fill(255, 158, 158);
  rect(115, 65, 200, 100);
  fill(118, 22, 167);
  textSize(23);
  text( "Score: " + snake.len, 70, 50);

  if (snake.len > highscore) {
    highscore= snake.len;
  }
  fill(118, 22, 167);
  textSize(23);
  text( "High Score: " + highscore, 60, 80);

  snake.draw();
  food.draw();
  if (ismoved) {
    snake.move();
  }

  if ( dist(food.x, food.y, snake.xPos.get(0), snake.yPos.get(0))<food.rad+snake.radius) {
    food.newfood();
    
    snake.add();
  }

  for (int i=1; i<snake.len; i++) {
    if (dist(snake.xPos.get(0), snake.yPos.get(0), snake.xPos.get(i), snake.yPos.get(i))<snake.rectLen) {
      lose = true;
    }
  }

  if (lose) {
    snake.lose();
    ismoved = false;
    textSize(65);
    text("GAME OVER", 330, 300);
    textSize(40);
    text("press 'r'to replay", 350, 400);
  }
}


void keyPressed() {
  ismoved=true;

  if (key=='w')
  {
    isUp=true;
    isDown=false;
    isRight=false;
    isLeft=false;
  }

  if (key=='s')
  {
    isDown=true;
    isUp=false;
    isRight=false;
    isLeft=false;
  }

  if (key=='a')
  {
    isLeft=true;
    isUp=false;
    isDown=false;
    isRight=false;
  }

  if (key=='d')
  {
    isRight=true;
    isUp=false;
    isDown=false;
    isLeft=false;
  }

  if (lose) {
    if (key=='r') {
      lose = false;
    }
  }
}
