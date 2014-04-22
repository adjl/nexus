abstract class Beam {

  final color red = color(255, 0, 0); // Set 255 as constant
  final color green = color(0, 255, 0);
  final color blue = color(0, 0, 255);
  final color yellow = color(255, 255, 0);
  final color[] colours = {red, green, blue, yellow};

  int creationTime, activationTime;
  int headSize, tailLength;
  int originX, originY;
  int positionX, positionY;
  int haloX, haloY;
  float haloSize;
  boolean active;
  color colour;

  Beam(Distance distance, int creationTime) {
    this.creationTime = creationTime;
    activationTime = int(random(MAX_ACTIVATION_TIME));
    headSize = distance.getDistance();
    tailLength = 0;
    originX = positionX = 0;
    originY = positionY = 0;
    haloX = haloY = headSize / 2; // Why not 2.0, a float? Set as constant?
    haloSize = headSize * 1.5; // Set as constant
    active = false;
    colour = colours[int(random(colours.length))];
  }

  Beam(Distance distance, int originX, int originY, int colour) {
    this.originX = positionX = originX;
    this.originY = positionY = originY;
    this.colour = colours[colour];
    creationTime = activationTime = 0;
    headSize = distance.getDistance();
    tailLength = 0;
    haloX = haloY = headSize / 2;
    haloSize = headSize * 1.5;
    active = true;
  }

  boolean isActive() {
    return active;
  }

  void activate() {
    active = true;
  }

  boolean canActivate(int currentTime) {
    return currentTime - creationTime >= activationTime;
  }

  abstract void move();
  abstract void draw();
}