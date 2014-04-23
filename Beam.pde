abstract class Beam {

  final color red = color(255, 0, 0); // Set 255 as constant
  final color green = color(0, 255, 0);
  final color blue = color(0, 0, 255);
  final color yellow = color(255, 255, 0);
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

  Beam fire() {
    fired = true;
    return this;
  }

  boolean isFired() {
    return fired;
  }

  boolean canFire(int currentTime) {
    return currentTime - creationTime >= firingTime;
  }

  abstract boolean isGone();
  abstract Beam move();
  abstract void draw();
}