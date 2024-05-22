void setup(){
 System.out.println("Hello world");
 Card[] cardList = cardList();
 for(int i = 0; i < cardList.length; i++) {
   System.out.println(27 * cardList[i].shape + 9 * cardList[i].hue + 3 * cardList[i].shading + cardList[i].number);
 }
}

void draw() {


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

void setup(){
 System.out.print("Hello world");
 int x;
}

void draw() {

}
