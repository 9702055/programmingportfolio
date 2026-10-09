class Button {
  // Member Variables
  float x, y, w, h;
  char val;
  boolean hover;
  color c1, c2, c3;
 
  //Constructor
  Button(float x, float y, float w, float h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    w = 100;
    h = 30;
    this.val = val;
    hover = false;
    c1 = color(#9CB293);
    c2 = color(#B8D3AD);
    c3 = color(200);
  }

  //Member Methods
  void display() {
    if (hover == true) {
      fill(c2);
    } else {
      fill(c1);
    }
    
    rectMode(CENTER);
    rect(x, y, w, h, 3);
    fill(255);
    textAlign(CENTER);
    textSize(18);
    text(val, x, y+5);
  }

  void mouseOver(float tempX, float tempY) {
    if (tempX>x-w/2 && tempX<x+w/2 && tempY > y-h/2 && tempY < y+h/2) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
