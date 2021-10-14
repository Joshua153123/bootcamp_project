class Snake {
  int len;
  ArrayList<Float> xPos = new ArrayList();
  ArrayList<Float> yPos = new ArrayList();
  float rectLen;
  float radius;
  boolean islose;


  Snake() {
    len = 1;
    xPos.add(random(width));
    yPos.add(random(height));
    rectLen = 20;
    rectMode(CENTER);
    radius=20;
    islose = false;
  }

  void draw() {


    for (int i=0; i<len; i++) {
      fill(90, 185, 255);

      rect (xPos.get(i), yPos.get(i), rectLen, rectLen);
    }
    circle(xPos.get(0), yPos.get(0), 2*radius);
  }

  void move() {
    for (int i = len - 1; i > 0; i -- ) {
      xPos.set(i, xPos.get(i - 1));
      yPos.set(i, yPos.get(i - 1));
    }

    if (isUp) {
      yPos.set(0, yPos.get(0) - rectLen);
    }
    if (isDown) {
      yPos.set(0, yPos.get(0) + rectLen);
    }
    if (isRight) {
      xPos.set(0, xPos.get(0) + rectLen);
    }
    if (isLeft) {
      xPos.set(0, xPos.get(0) -rectLen);
    }
    xPos.set(0, (xPos.get(0)+width)%width);
    yPos.set(0, (yPos.get(0)+height)%height);

    
  }

  void add() {
    xPos.add(xPos.get(len-1));
    yPos.add(yPos.get(len-1)+rectLen);
    len++;
  }

  void lose() {
    len=1;
    float x= xPos.get(0);
    float y = yPos.get(0);
    xPos.clear();
    yPos.clear();
    xPos.add(x);
    yPos.add(y);
  }
}
