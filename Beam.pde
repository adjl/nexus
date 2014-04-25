abstract class Beam {

  final color red = color(255, 0, 0);
  final color green = color(0, 255, 0);
  final color blue = color(0, 0, 255);
  final color yellow = color(255, 255, 0);
  final color[] colours = {red, green, blue, yellow};

  int size, speed, tailLength;
  int originX, originY;
  int positionX, positionY;
  color colour;

  Beam(Distance distance) {
    this.size = distance.getSize();
    this.speed = distance.getSpeed();
    tailLength = 0;
    originX = positionX = 0;
    originY = positionY = 0;
    colour = colours[int(random(colours.length))];
  }

  Beam(Distance distance, int originX, int originY, int colour) {
    this.size = distance.getSize();
    this.speed = distance.getSpeed();
    this.originX = positionX = originX;
    this.originY = positionY = originY;
    this.colour = colours[colour];
    tailLength = 0;
  }

  abstract boolean isGone();
  abstract void move();
  abstract void draw();
}