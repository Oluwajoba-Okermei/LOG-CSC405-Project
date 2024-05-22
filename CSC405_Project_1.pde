void setup(){
    size(640, 480);
    background(255);
 System.out.println("Hello world");
 Card[] cardList = cardList();

 System.out.println(cardList[1].number);
 System.out.println(cardList[1].hueInt);
 System.out.println(cardList[1].shape);
 System.out.println(cardList[1].shading);
 cardList[1].cardDrawer(width/2, height/2, 100);
}

void draw() {
   // rectGrid(4, 3, 200, 105, 10);

}




Card[] cardList() {
    int[] cardIndexList = new int[81];

    for(int i = 0; i < cardIndexList.length; i++) {
        cardIndexList[i] = i;
    }

    for (int i = cardIndexList.length - 1; i > 0; i--) {
        int index = round(random(0, 80.45));

        int temp = cardIndexList[i];
        cardIndexList[i] = cardIndexList[index];
        cardIndexList[index] = temp;
    }

    Card[] cardList = new Card[81];

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


void rectGrid(int rows, int cols, int rectSizeX, int rectSizeY, int spacing) {
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
    rectMode(CENTER);
      int x = j * (rectSizeX + spacing) + spacing;
      int y = i * (rectSizeY + spacing) + spacing;
      rect(x, y, rectSizeX, rectSizeY);
    }
  }
}
