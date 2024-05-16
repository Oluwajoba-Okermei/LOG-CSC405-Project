void setup(){
 System.out.print("Hello world");
}

void draw() {


}

Card[] cardList() {
    int[] shuffled = new int[81];
    int[] nonShuffled = new int[81];

    for(int i = 0; i<nonShuffled.length; i++) {
        nonShuffled[i] = i;
    }

    for(int i = 0; i<shuffled.length; i++) {
        double random = Math.random(0,80);
        if (nonShuffled[round(random)] != -1) {
            shuffled[i] = nonShuffled[round(random)];
            nonShuffled[round(random)] = -1;
        }
        
    }
    
}