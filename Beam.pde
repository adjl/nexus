abstract class Beam {

  final float maxLength = 25;
  final color red = color(255, 0, 0);
  final color green = color(0, 255, 0);
  final color blue = color(0, 0, 255);
  final color yellow = color(255, 255, 0);
  final color[] colours = {red, green, blue, yellow};

  PVector position;
  int size, speed;
  float transparency;
  float originX, originY;
  float length;
  float angle;
  color colour;

  Beam(Distance distance) {
    size = distance.getSize();
    speed = distance.getSpeed();
    transparency = distance.getOpacity() * 255;
    position = new PVector();
    originX = originY = 0;
    length = 0;
    angle = 0;
    colour = colours[int(random(colours.length))];
  }

  Beam(Distance distance, float originX, float originY, int colour) {
    size = distance.getSize();
    speed = distance.getSpeed();
    transparency = distance.getOpacity() * 255;
    this.originX = originX;
    this.originY = originY;
    this.colour = colours[colour];
    position = new PVector(originX, originY);
    length = 0;
    angle = 0;
  }

  void drawBeam(float positionX, float positionY) {
    float tailTransparency = map(maxLength - length, 0, maxLength, 0, transparency);
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    scale(size);
    beginShape(QUADS);
    fill(colour, transparency);
    vertex(0, 0);
    vertex(1, 0);
    fill(colour, tailTransparency);
    vertex(1, length);
    vertex(0, length);
    fill(colour, transparency * 2);
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