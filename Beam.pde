abstract class Beam {

  static final int MAX_COLOUR_VALUE = 255;

  final color red = color(MAX_COLOUR_VALUE, 0, 0);
  final color green = color(0, MAX_COLOUR_VALUE, 0);
  final color blue = color(0, 0, MAX_COLOUR_VALUE);
  final color yellow = color(MAX_COLOUR_VALUE, MAX_COLOUR_VALUE, 0);
  final color[] colours = {red, green, blue, yellow};

  int creationTime, firingTime;
  int headSize, tailLength;
  int originX, originY;
  int positionX, positionY;
  float haloX, haloY, haloSize;
  boolean fired;
  color colour;

  Beam(Distance distance, int creationTime) {
    this.creationTime = creationTime;
    firingTime = int(random(MAX_FIRING_TIME));
    headSize = distance.getDistance();
    tailLength = 0;
    originX = positionX = 0;
    originY = positionY = 0;
    haloX = haloY = headSize / 2.0; // Set as constant?
    haloSize = headSize * 1.5; // Set as constant?
    fired = false;
    colour = colours[int(random(colours.length))];
  }

  Beam(Distance distance, int originX, int originY, int colour) {
    this.originX = positionX = originX;
    this.originY = positionY = originY;
    this.colour = colours[colour];
    creationTime = firingTime = 0;
    headSize = distance.getDistance();
    tailLength = 0;
    haloX = haloY = headSize / 2.0;
    haloSize = headSize * 1.5;
    fired = true;
  }

  void fire() {
    fired = true;
  }

  boolean isFired() {
    return fired;
  }

  boolean canFire(int currentTime) {
    return currentTime - creationTime >= firingTime;
  }

  abstract boolean isGone();
  abstract void move();
  abstract void draw();
}