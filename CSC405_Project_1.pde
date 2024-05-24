Card[] cardList = cardList();

void setup() {
  size(640,480);
  System.out.println("Hello world");
  for (int i = 0; i < cardList.length; i++) {
    System.out.println(27 * cardList[i].shape + 9 * cardList[i].hueInt + 3 * cardList[i].shading + cardList[i].number);
    //cardList[0].cardDrawer(width/2,height/2,100);
  }
   drawGrid(3, 4);
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
public void cardGrid(int cols, int rows) {
    PVector[] centers = centers(cols, rows);
    for (int i = 0; i<centers.length; i++) {
      cardList[i].cardDrawer(centers[i], 100);
    }
}

void draw() {
  cardGrid(3,4);
  }

  boolean setCheck(Card[] cardGroup) {
    for (int i = 0; i < cardGroup.length - 2; i++) {
      for (int j = i +1; j < cardGroup.length - 1; j++) {
        for (int k = j +1; j < cardGroup.length; j++) {
          if ((cardGroup[i].number + cardGroup[j].number + cardGroup[k].number % 3 == 0)
            &&  (cardGroup[i].shape + cardGroup[j].shape + cardGroup[k].shape % 3 == 0)
            &&  (cardGroup[i].shading + cardGroup[j].shading + cardGroup[k].shading % 3 == 0)
            &&  (cardGroup[i].hueInt + cardGroup[j].hueInt + cardGroup[k].hueInt % 3 == 0)
            ) {
            return true;
          }
        }
      }
    }
    return false;
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

  //void drawGrid(int rows, int cols, int spacing) {
  //  background(255);
  //  stroke(0);
  //  for (int i = 0; i < rows; i++) {
  //    for (int j = 0; j < cols; j++) {
  //      int x = j * spacing;
  //      int y = i * spacing;
  //      rect(x, y, spacing, spacing);
  //    }
  //  }
  //}

//  void drawGrid(int rows, int cols) {
//  float canvasWidth = width;
//  float canvasHeight = height;
  
//  float spacing = 10; // Spacing between rectangles and edges
  
//  float rectWidth = (canvasWidth - (cols + 1) * spacing) / cols;
//  float rectHeight = (canvasHeight - (rows + 1) * spacing) / rows;
  
//  for (int i = 0; i < rows; i++) {
//    for (int j = 0; j < cols; j++) {
//      float x = j * (rectWidth + spacing) + spacing;
//      float y = i * (rectHeight + spacing) + spacing;
//      rect(x, y, rectWidth, rectHeight);
//    }
//  }
//}

void drawGrid(int rows, int cols) {
  float canvasWidth = width;
  float canvasHeight = height;
  
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
}


}
