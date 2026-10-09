//Carli Christensen | 15 Sep 2026 | Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
float l, r, result;
char op;
boolean left;
String displayVal;
boolean newEntry;

void setup() {
  size(163, 250);

  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  displayVal = "0.0";
  newEntry = true;

  numButtons[0] = new Button(65, 130, 20, 20, '0');
  numButtons[1] = new Button(27, 70, 20, 20, '1');
  numButtons[2] = new Button(65, 70, 20, 20, '2');
  numButtons[3] = new Button(103, 70, 20, 20, '3');
  numButtons[4] = new Button(138, 70, 20, 20, '4');
  numButtons[5] = new Button(27, 100, 20, 20, '5');
  numButtons[6] = new Button(65, 100, 20, 20, '6');
  numButtons[7] = new Button(103, 100, 20, 20, '7');
  numButtons[8] = new Button(138, 100, 20, 20, '8');
  numButtons[9] = new Button(27, 130, 20, 20, '9');
  opButtons[0] = new Button(27, 160, 20, 20, '+');
  opButtons[1] = new Button(65, 160, 20, 20, '-');
  opButtons[2] = new Button(27, 190, 20, 20, 'x');
  opButtons[3] = new Button(65, 190, 20, 20, '÷');
  opButtons[4] = new Button(120, 130, 56, 20, 'C');
  opButtons[5] = new Button(120, 160, 56, 20, '=');
  opButtons[6] = new Button(103, 190, 20, 20, '.');
  opButtons[7] = new Button(27, 220, 20, 20, ' ');
  opButtons[8] = new Button(65, 220, 20, 20, ' ');
  opButtons[9] = new Button(103, 220, 20, 20, '√');
  opButtons[10] = new Button(138, 220, 20, 20, '±');
  opButtons[11] = new Button(138, 190, 20, 20, '%');
}

void draw() {
  background(#9D8477);
  drawDisplay();
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display ();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void drawDisplay() {
  rectMode(CENTER);
  fill(#F5F5EB);
  rect(width/2, 25, 110, 40);
  fill (0);
  textAlign(RIGHT);
  textSize(30);
  text(displayVal, width-25, 30);
}

void mouseReleased() {


  //Update display with button cliked by user
  //for (int i = 0; i < numButtons.length; i++) {
  //  if (numButtons[i].hover == true) {
  //    if (displayVal.equals("0.0")) {
  //      if (left == true) {
  //        displayVal = str(numButtons[i].val);
  //        l = float(displayVal);
  //      } else {
  //        displayVal = displayVal + str(numButtons[i].val);
  //        r = float(displayVal);
  //      }
  //    } else {
  //      if (left == true) {
  //        displayVal = str(numButtons[i].val);
  //        l = float(displayVal);
  //      } else {
  //        displayVal = displayVal + str(numButtons[i].val);
  //        l = float(displayVal);
  //      }
  //    }
  //  }
  //}
  // Loop through opButtons
  //for (int i = 0; i < opButtons.length; i++) {
  //  if (opButtons[i].hover == true) {
  //    if (opButtons[i].val == '=') {
  //      // Perform a calculation
  //      performCalc();
  //    } else if (opButtons[i].val == '+') {
  //      displayVal = str(opButtons[i].val);
  //      left =!left;
  //      op = opButtons[i].val;
  //    } else if (opButtons[i].val == '-') {
  //      displayVal = str(opButtons[i].val);
  //      left =!left;
  //      op = opButtons[i].val;
  //    }
  //  }
  //}
  // Display variables
  println("L:" + l);
  println("R:" + r);
  println("Result:" + result);
  println("Left:" + left);
  println("Op:" + op);


  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover) {
      handleEvent(numButtons[i].val, true);
      String digit = str(numButtons[i].val);

      if (newEntry || displayVal.equals("0.0")) {
        displayVal = digit;
        newEntry = false;
      } else {
        displayVal += digit;
      }

      if (left) {
        l = float(displayVal);
      } else {
        r = float(displayVal);
      }
    }
  }

  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover) {
    }
  }
}




void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == 'x') {
    result = l * r;
  }
  displayVal = str(result);
  left = !left;
  l = result;
}

void keyPressed() {
  println("keyCode: " +keyCode);
  displayVal = str(key);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent('1', true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent('2', true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent('3', true);
  }else if (keyCode == 52 || keyCode == 100) {
    handleEvent('4', true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent('5', true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent('6', true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent('7', true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent('8', true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent('9', true);
  } else if (keyCode == 58 || keyCode == 106) {
    handleEvent('0', true);
  } 
}

void handleEvent(char val, boolean isNum) {
  if (isNum == true) {
    // do number stuff
    char clicked = val;
    

    if (clicked == '=') {
      performCalc();
    } else if (clicked == '+' || clicked == '-' ||
      clicked == 'x' || clicked == '÷') {
      op = clicked;
      left = false;
      newEntry = true;
      displayVal = str(op);
    } else if (clicked == '±') {
      if (left == true) {
        l *= -1;
        displayVal = str(l);
      } else {
        r *= -1;
        displayVal = str(r);
      }
      //togglesign();
    } else if (clicked == 'C') {
      //reset all variables
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      left = true;
      displayVal = "0.0";
      newEntry = true;
    } else if (clicked == '√') {
      //reset all variables
      if (left == true) {
        l = sqrt(l);
        displayVal = str(l);
      } else {
        r = sqrt(r);
        displayVal = str(r);
      }
    } else if (clicked == '%') {
      //reset all variables
      if (left == true) {
        l = l * 0.01;
        displayVal = str(l);
      } else {
        r = r * 0.01;
        displayVal = str(r);
      }
    } else if (clicked == '.') {
      if (!displayVal.contains(".")) {
        displayVal += ".";
      }
    }
  } else {
    // operator stuff
  }
}
