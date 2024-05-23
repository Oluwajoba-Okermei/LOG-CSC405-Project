public class Card {
    public int shape;
    public int hueInt;
    public color hue;
    public int shading;
    public int number;
    public Card(int shape, int hueInt, int shading, int number) {
        this.shape = shape;
        this.hueInt = hueInt;
        this.shading = shading;
        this.number = number;
        this.number ++;
        if (hueInt == 0) {
            hue = color(135, 44, 40);
        }
        if (hueInt == 1) {
            hue = color(16, 22, 53);
        }
        if (hueInt == 2) {
            hue = color(82, 135, 105);
        }
    }
    
    
    

    
    void square(float x, float y, float size) {
        rectMode(CENTER);
        stroke(this.hue);
        strokeWeight(8);
        if (shading == 0) {
            noFill();
            rect(x, y, size / 2, size / 2);
        } 
        if (shading == 1) {
            noFill();
            line(x, y - size / 2 , x , y + size / 2);
            line(x - size / 2, y, x + size / 2, y);
            rect(x, y, size / 2, size / 2);
        }
        if (shading == 2) {
            fill(this.hue);
            rect(x, y, size / 2, size / 2);
        }
    }

    void circle(float x, float y, float size) {
        stroke(this.hue);
        strokeWeight(8);
        if (shading == 0) {
            noFill();
            circle(x, y, size);
        } 
        if (shading == 1) {
            line(x, y - size / 2 , x , y + size / 2);
            noFill();
            line(x - size / 2, y, x + size / 2, y);
            circle(x, y, size);
        }
        if (shading == 2) {
            fill(this.hue);
            circle(x, y, size);
        }
    }

    void rhombus(float x, float y, float size) {
        stroke(this.hue);
        strokeWeight(8);
        if (shading == 0) {
            noFill();
            beginShape();
            vertex(x, y + size / 2);
            vertex(x + size / 2, y);
            vertex(x, y - size / 2);
            vertex(x - size / 2, y);
            endShape(CLOSE);
        } 
        if (shading == 1) {
            line(x, y - size / 2 , x , y + size / 2);
            line(x - size / 2, y, x + size / 2, y);
            noFill();
            beginShape();
            vertex(x, y + size / 2);
            vertex(x + size / 2, y);
            vertex(x, y - size / 2);
            vertex(x - size / 2, y);
            endShape(CLOSE);
        }
        if (shading == 2) {
            fill(this.hue);
            beginShape();
            vertex(x, y + size / 2);
            vertex(x + size / 2, y);
            vertex(x, y - size / 2);
            vertex(x - size / 2, y);
            endShape(CLOSE);
        }
    }

    void cardDrawer(float x, float y, float sizeX) {
        if (number == 1) {
            if (shape == 0) {
                square(x, y, sizeX / 2);
            }
            if (shape == 1) {
                circle(x, y, sizeX / 2);
            }
            if (shape == 2) {
                rhombus(x, y, sizeX / 2);
            }
        }

        if (number == 2) {
            if (shape == 0) {
                square(x-sizeX/2.5, y, sizeX / 3);
                square(x+sizeX/2.5, y, sizeX / 3);
            }
            if (shape == 1) {
               circle(x-sizeX/2.5, y, sizeX / 3);
               circle(x+sizeX/2.5, y, sizeX / 3);
            }
            if (shape == 2) {
                rhombus(x-sizeX/2.5, y, sizeX / 3);
                rhombus(x+sizeX/2.5, y, sizeX / 3);
            }
        }

        if (number == 3) {
            if (shape == 0) {
                square(x-sizeX/1.66, y, sizeX / 4);
                square(x, y, sizeX / 4);
                square(x+sizeX/1.66, y, sizeX / 4);
            }
            if (shape == 1) {
                circle(x-sizeX/1.66, y, sizeX / 4);
                circle(x, y, sizeX / 4);
                circle(x+sizeX/1.66, y, sizeX / 4);
            }
            if (shape == 2) {
                rhombus(x-sizeX/1.66, y, sizeX / 4);
                rhombus(x, y, sizeX / 4);
                rhombus(x+sizeX/1.66, y, sizeX / 4);
            }
        }
    }


    
    
    
    }
