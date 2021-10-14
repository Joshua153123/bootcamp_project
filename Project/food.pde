class Food {

  float x;
  float y;
  float rad;

  Food() {

    x = random(50, width-50);
    y = random(115, height-50);
    rad=10;
  }

  void draw() {
    fill(232, 252, 105);
    circle(x, y,2* rad);
  }

  void newfood() {
    x = random(230, width-50);
    y = random(130, height-80);
  }
}
