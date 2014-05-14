abstract class Beam {

  final float maxLength = 25;
  final color red = color(255, 0, 0);
  final color green = color(0, 255, 0);
  final color blue = color(0, 0, 255);
  final color yellow = color(255, 255, 0);
  final color[] colours = {red, green, blue, yellow};

  PVector origin, position, velocity;
  float angle, length, transparency;
  int size;
  color colour;

  Beam(Distance distance) {
    transparency = distance.getTransparency();
    size = distance.getSize();
    colour = colours[int(random(colours.length))];
  }

  Beam(Distance distance, float originX, float originY, int colourID) {
    origin = new PVector(originX, originY);
    position = new PVector(originX, originY);
    transparency = distance.getTransparency();
    size = distance.getSize();
    colour = colours[colourID];
  }

  void drawBeam(float positionX, float positionY) {
    float tailTransparency = map(maxLength - length, 0, maxLength, 0, transparency);
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    scale(size);
    beginShape(QUADS);
    fill(colour, transparency); // Body
    vertex(0, 0);
    vertex(1, 0);
    fill(colour, tailTransparency); // Tail
    vertex(1, length);
    vertex(0, length);
    fill(colour, transparency * 2); // Head
    vertex(0, 0);
    vertex(1, 0);
    fill(colour, 0);
    vertex(1, 1);
    vertex(0, 1);
    endShape(CLOSE);
    popMatrix();
  }

  abstract boolean isGone();
  abstract void move();
  abstract void draw();
}