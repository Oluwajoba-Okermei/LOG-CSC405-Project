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
            hue = color(60, 179, 113);
        }
        if (hueInt == 2) {
            hue = color(63, 171, 217);
        }
    }
    
    
    int cardID() {
      return 27 * this.shape + 9 * this.hueInt + 3 * this.shading + this.number - 1;
    }

    
    void squareCard(PVector location, float size) {
        rectMode(CENTER);
        stroke(this.hue);
        strokeWeight(4);
        if (shading == 0) {
            noFill();
            rect(location.x, location.y, size / 2, size / 2);
        } 
        if (shading == 1) {
            strokeWeight(2);
            noFill();
            line(location.x, location.y - size / 2 , location.x , location.y + size / 2);
            line(location.x - size / 2, location.y, location.x + size / 2, location.y);
            
            strokeWeight(4);
            rect(location.x, location.y, size, size);
        }
        if (shading == 2) {
            fill(this.hue);
            rect(location.x, location.y, size / 2, size / 2);
        }
    }

    void circleCard(PVector location, float size) {
        stroke(this.hue);
        strokeWeight(4);
        if (shading == 0) {
            noFill();
            circle(location.x, location.y, size);
        } 
        if (shading == 1) {
            strokeWeight(2);
            noFill();
            line(location.x - size / 2, location.y, location.x + size / 2, location.y);
            line(location.x, location.y - size / 2, location.x, location.y + size / 2);
            strokeWeight(4);
            circle(location.x, location.y, size);
        }
        if (shading == 2) {
            fill(this.hue);
            circle(location.x, location.y, size);
        }
    }

    void rhombus(PVector location, float size) {
        stroke(this.hue);
        strokeWeight(4);
        if (shading == 0) {
            noFill();
            beginShape();
            vertex(location.x, location.y + size / 2);
            vertex(location.x + size / 2, location.y);
            vertex(location.x, location.y - size / 2);
            vertex(location.x - size / 2, location.y);
            endShape(CLOSE);
        } 
        if (shading == 1) {
            strokeWeight(2);
            line(location.x, location.y - size / 2 , location.x , location.y + size / 2);
            line(location.x - size / 2, location.y, location.x + size / 2, location.y);
            noFill();
            strokeWeight(4);
            beginShape();
            vertex(location.x, location.y + size / 2);
            vertex(location.x + size / 2, location.y);
            vertex(location.x, location.y - size / 2);
            vertex(location.x - size / 2, location.y);
            endShape(CLOSE);
        }
        if (shading == 2) {
            fill(this.hue);
            beginShape();
            vertex(location.x, location.y + size / 2);
            vertex(location.x + size / 2, location.y);
            vertex(location.x, location.y - size / 2);
            vertex(location.x - size / 2, location.y);
            endShape(CLOSE);
        }
    }

    void cardDrawer(PVector location, float sizeX) {
        
        if (number == 1) {
            if (shape == 0) {

                squareCard(location, sizeX / 2);
            }
            if (shape == 1) {
              
                circleCard(location, sizeX / 2);
            }
            if (shape == 2) {
             
                rhombus(location, sizeX / 2);
            }
        }

        if (number == 2) {
            if (shape == 0) {
                location.x -= sizeX/2.5;
                squareCard(location, sizeX / 3);
                location.x += 2 * sizeX/2.5;
                squareCard(location, sizeX / 3);
            }
            if (shape == 1) {
                location.x -= sizeX/2.5;
                circleCard(location, sizeX / 3);
                location.x += 2 * sizeX/2.5;
                circleCard(location, sizeX / 3);
            }
            if (shape == 2) {
                location.x -= sizeX/2.5;
                rhombus(location, sizeX / 3);
                location.x += 2 * sizeX/2.5;
                rhombus(location, sizeX / 3);
            }
        }

        if (number == 3) {
            if (shape == 0) {
                location.x -= sizeX / 1.66;
                squareCard(location, sizeX / 4);
                location.x += sizeX / 1.66;
                squareCard(location, sizeX / 4);
                location.x += sizeX / 1.66;
                squareCard(location, sizeX / 4);
            }
            if (shape == 1) {
                location.x -= sizeX / 1.66;
                circleCard(location, sizeX / 4);
                location.x += sizeX / 1.66;
                circleCard(location, sizeX / 4);
                location.x += sizeX / 1.66;
                circleCard(location, sizeX / 4);
            }
            if (shape == 2) {
                location.x -= sizeX / 1.66;
                rhombus(location, sizeX / 4);
                location.x += sizeX / 1.66;
                rhombus(location, sizeX / 4);
                location.x += sizeX / 1.66;
                rhombus(location, sizeX / 4);
            }
        }
    }


    
    
    
    }
