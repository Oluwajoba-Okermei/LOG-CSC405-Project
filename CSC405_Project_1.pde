Card[] cardList = cardList();
Card[] onScreen = new Card[21];
int[] selectedCards = new int[3];
int[] takenCards = new int[81];
int[] completeSet = new int[3];
int[] failedSet = new int[3];
boolean mouseReleased;
boolean noSetColor = false;
int noSetTime = 0;
boolean setColor = false;
int setTime = 0;
int score = 0;
int time = 0;
boolean gameHasntStarted = true;
int colorCounter = 0;
boolean hardMode = false;
int hardModeTime = 0;


void setup() {
  size(640, 480);
  //System.out.println("Hello world");
  //int counter = 0;
  //for (int i = 0; i < cardList.length; i++) {
  //  counter++;
  //  System.out.println(27 * cardList[i].shape + 9 * cardList[i].hueInt + 3 * cardList[i].shading + cardList[i].number - 1);
  //  //cardList[0].cardDrawer(width/2,height/2,100);
  //}
  //System.out.println(counter);
  //System.out.println(onScreen[1]);
  for (int i = 0; i < 12; i++) {
    onScreen[i] = cardList[i];
    takenCards[i] = i;
  }
  mouseReleased = false;

  for (int i = 0; i < selectedCards.length; i++) {
    selectedCards[i] = -1;
  }
  for (int i = 12; i < takenCards.length; i++) {
    takenCards[i] = -1;
  }
}

void keyPressed() {
  if (key == 'h' || key == 'H') {
    gameHasntStarted = false;
    hardMode = true;
  }
  if (key == 's' || key == 'S') {
    gameHasntStarted = false;
  }
}

void mouseReleased() {
  mouseReleased = true;
}

boolean endGame() {
  return ((firstNotTaken() >= 81) && (! setCheck(realOnScreen())));
}

void draw() {
  if (gameHasntStarted) {
    background(255);
    fill(0);
    textSize(60);
    String s = "Welcome! Click the s key for a normal game of set or h for hard mode!";
    text(s, 100, 75, width - 100, height - 100);
    return;
  }

  if (endGame()) {
    background(255);
    fill(0);
    textSize(100);
    String s = "You Win! Time: " + time/60 + " seconds";
    text(s, 125, 75, width - 100, height - 100);
    return;
  }

  time ++;
  colorCounter ++;
  if (colorCounter > 15 * 255) {
    colorCounter = 0;
  }
  background(255, 255 - colorCounter * 0.03, 255-(colorCounter * 0.04));
  updateOnScreen();
  drawGrid(countOnScreen()/3, 3);
  for (int i = 0; i < selectedCards.length; i++) {
    if (selectedCards[i] != -1) {
      color lightblue = color(215, 215, 255);
      shadeRect(selectedCards[i], 3, countOnScreen()/3, lightblue);
    }
  }
  if (setColor && setTime < 30) {
    color lightgreen = color(200, 255, 200);
    for (int i = 0; i < 3; i++) {
      shadeRect(completeSet[i], 3, countOnScreen()/3, lightgreen);
    }
    setTime ++;
  } else {
    setTime = 0;
    setColor = false;
  }

  if (noSetColor && (noSetTime < 30)) {
    color lightred = color(255, 200, 200);
    for (int i = 0; i < 3; i++) {
      shadeRect(failedSet[i], 3, countOnScreen()/3, lightred);
    }
    noSetTime ++;
  } else {
    noSetTime = 0;
    noSetColor = false;
  }
  cardGrid(3, countOnScreen()/3);

  if (hardMode) {
    if (hardModeTime >= 60 * 15) {
      hardModeTime = 0;
      colorCounter = 0;
      cardList = cardList();
      for (int i = 0; i < onScreen.length; i++) {
        onScreen[i] = null;
      }
      for (int i = 0; i < 12; i++) {
        onScreen[i] = cardList[i];
        takenCards[i] = i;
      }
      mouseReleased = false;

      for (int i = 0; i < selectedCards.length; i++) {
        selectedCards[i] = -1;
      }
      for (int i = 12; i < takenCards.length; i++) {
        takenCards[i] = -1;
      }
    }

    hardModeTime ++;
  }

  if (mouseReleased) {
    int closestCenter = closestCenter(mouseX, mouseY, 3, countOnScreen()/3);
    boolean isChosenTwice = false;
    for (int i = 0; i < 3; i++) {
      if (closestCenter == selectedCards[i]) {
        System.out.println("No choosing the same card twice");
        isChosenTwice = true;
      }
    }
    if (!isChosenTwice) {
      selectedCards[countSelected()] = closestCenter;
    }
    mouseReleased = false;
  }
  if (countSelected() == 3) {
    Card[] chosenCards = new Card[3];
    for (int i = 0; i < 3; i++) {
      chosenCards[i] = onScreen[selectedCards[i]];
    }
    if (setCheck(chosenCards)) {
      score++;
      hardModeTime = 0;
      colorCounter = 0;
      if (score == 1) {
        System.out.println("1 set found!");
      } else {
        System.out.println(score + " sets found!");
      }

      int firstNotTaken = 0;
      if ((countOnScreen() == 12) && (firstNotTaken() <= 80)) {
        for (int i = 0; i < selectedCards.length; i++) {
          firstNotTaken = firstNotTaken();
          onScreen[selectedCards[i]] = cardList[firstNotTaken];
          takenCards[firstNotTaken] = firstNotTaken;
        }
      } else {
        for (int i = 0; i < selectedCards.length; i++) {
          onScreen[selectedCards[i]] = null;
        }

        Card[] realOnScreen = realOnScreen();

        for (int i = 0; i < onScreen.length; i++) {
          onScreen[i] = null;
        }
        for (int i = 0; i < realOnScreen.length; i++) {
          onScreen[i] = realOnScreen[i];
        }
      }
      setColor = true;
      setTime = 0;
      for (int i = 0; i < 3; i++) {
        completeSet[i] = selectedCards[i];
      }
      setPrint(realOnScreen());
    } else {
      System.out.println("Not a set");
      noSetColor = true;
      noSetTime = 0;
      for (int i = 0; i < 3; i++) {
        failedSet[i] = selectedCards[i];
      }
    }
    for (int i = 0; i < selectedCards.length; i++) {
      selectedCards[i] = -1;
    }
  }
}

public int countOnScreen() {
  int counter = 0;
  for (int i = 0; i < onScreen.length; i++ ) {
    if (onScreen[i] != null) {
      counter++;
    }
  }
  return counter;
}

public int countSelected() {
  int counter = 0;
  for (int i = 0; i < selectedCards.length; i++ ) {
    if (selectedCards[i] != -1) {
      counter++;
    }
  }
  return counter;
}

public Card[] realOnScreen() {
  Card[] realOnScreen = new Card[countOnScreen()];
  int j = 0;
  for (int i = 0; i < realOnScreen.length; i++) {
    if (onScreen[i] != null) {
      realOnScreen[j] = onScreen[i];
      j++;
    }
  }
  return realOnScreen;
}


public void updateOnScreen() {
  boolean isSet = setCheck(realOnScreen());
  if (isSet) {
    return;
  } else {
    int idx = countOnScreen();
    onScreen[idx] = cardList[firstNotTaken()];
    takenCards[firstNotTaken()] = firstNotTaken();
    onScreen[idx + 1] = cardList[firstNotTaken()];
    takenCards[firstNotTaken()] = firstNotTaken();
    onScreen[idx + 2] = cardList[firstNotTaken()];
    takenCards[firstNotTaken()] = firstNotTaken();
    updateOnScreen();
  }
}


boolean isTaken(int i) {
  for (int j = 0; j < takenCards.length; j++) {
    if (i == takenCards[j]) {
      return true;
    }
  }
  return false;
}

int firstNotTaken() {
  int i = 0;
  while (isTaken(i)) {
    i++;
  }
  return i;
}


public PVector[] centers(int cols, int rows) {
  PVector[] centers = new PVector[cols*rows];
  for (int i = 0; i < centers.length; i++) {
    int remainder = i % cols;
    int quotient = i  / cols;
    centers[i] = new PVector(0.5 * (width / cols) + (width / cols) * remainder, 0.5 * (height / rows) + (height / rows) * quotient);
  }
  return centers;
}

int closestCenter(int x, int y, int cols, int rows) {
  PVector[] centers = centers(cols, rows);
  float closestDist = width * width + height * height;
  int closestIdx = 0;
  for (int i = 0; i < centers.length; i++) {
    float d = (centers[i].x - x) * (centers[i].x - x) + (centers[i].y - y) * (centers[i].y - y);
    if (d < closestDist) {
      closestDist = d;
      closestIdx = i;
    }
  }
  return closestIdx;
}

public void cardGrid(int cols, int rows) {
  PVector[] centers = centers(cols, rows);
  for (int i = 0; i<centers.length; i++) {
    onScreen[i].cardDrawer(centers[i], 100);
  }
}


boolean setCheck(Card[] cardGroup) {
  for (int i = 0; i < cardGroup.length - 2; i++) {
    for (int j = i + 1; j < cardGroup.length - 1; j++) {
      for (int k = j + 1; k < cardGroup.length; k++) {
        if (((cardGroup[i].number + cardGroup[j].number + cardGroup[k].number) % 3 == 0)
          &&  ((cardGroup[i].shape + cardGroup[j].shape + cardGroup[k].shape) % 3 == 0)
          &&  ((cardGroup[i].shading + cardGroup[j].shading + cardGroup[k].shading) % 3 == 0)
          &&  ((cardGroup[i].hueInt + cardGroup[j].hueInt + cardGroup[k].hueInt) % 3 == 0)
          ) {


          return true;
        }
      }
    }
  }
  return false;
}


void setPrint(Card[] cardGroup) {
  for (int i = 0; i < cardGroup.length - 2; i++) {
    for (int j = i + 1; j < cardGroup.length - 1; j++) {
      for (int k = j + 1; k < cardGroup.length; k++) {
        if (((cardGroup[i].number + cardGroup[j].number + cardGroup[k].number) % 3 == 0)
          &&  ((cardGroup[i].shape + cardGroup[j].shape + cardGroup[k].shape) % 3 == 0)
          &&  ((cardGroup[i].shading + cardGroup[j].shading + cardGroup[k].shading) % 3 == 0)
          &&  ((cardGroup[i].hueInt + cardGroup[j].hueInt + cardGroup[k].hueInt) % 3 == 0)
          ) {
          System.out.println(i + ", " + j + ", " + k);
          return;
        }
      }
    }
  }
}

Card[] cardList() {
  int[] cardIndexList = new int[81];
  Card[] cardList = new Card[81];

  for (int i = 0; i < cardIndexList.length; i++) {
    cardIndexList[i] = i;
  }

  for (int i = cardIndexList.length - 1; i > 0; i--) {
    int index = round(random(0, 80.45));

    int temp = cardIndexList[i];
    cardIndexList[i] = cardIndexList[index];
    cardIndexList[index] = temp;
  }

  for (int i = 0; i < cardIndexList.length; i++) {
    int cardNumber = cardIndexList[i];

    int number = cardNumber % 3;
    cardNumber = cardNumber / 3;
    int shading = cardNumber % 3;
    cardNumber = cardNumber / 3;
    int hue = cardNumber % 3;
    cardNumber = cardNumber / 3;
    int shape = cardNumber % 3;

    cardList[i] = new Card(shape, hue, shading, number);
  }
  return cardList;
}

void shadeRect(int center, int cols, int rows, color c) {
  int centerX = center % cols;
  int centerY = center / cols;

  rectMode(CORNER);
  float canvasWidth = width;
  float canvasHeight = height;
  stroke(0);
  fill(c);
  float spacing = 10; // Spacing between rectangles and edges

  float rectWidth = (canvasWidth - (cols + 1) * spacing) / cols;
  float rectHeight = (canvasHeight - (rows + 1) * spacing) / rows;

  float x = centerX * (rectWidth + spacing) + spacing;
  float y = centerY * (rectHeight + spacing) + spacing;
  rect(x, y, rectWidth, rectHeight);
  noFill();
}




void drawGrid(int rows, int cols) {
  rectMode(CORNER);
  float canvasWidth = width;
  float canvasHeight = height;
  stroke(0);
  noFill();
  float spacing = 10; // Spacing between rectangles and edges

  float rectWidth = (canvasWidth - (cols + 1) * spacing) / cols;
  float rectHeight = (canvasHeight - (rows + 1) * spacing) / rows;

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      float x = j * (rectWidth + spacing) + spacing;
      float y = i * (rectHeight + spacing) + spacing;
      rect(x, y, rectWidth, rectHeight);
    }
  }
  int closestCenter = closestCenter(mouseX, mouseY, cols, rows);
  color lightgrey = color(220);
  shadeRect(closestCenter, cols, rows, lightgrey);
}
