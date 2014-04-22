class Beam {

  static final float TRANSPARENT = 127.5;
  static final int START_TIME = 10000; // Rename

  // Put in separate class?
  final color RED = color(255, 0, 0);
  final color GREEN = color(0, 255, 0);
  final color BLUE = color(0, 0, 255);
  final color YELLOW = color(255, 255, 0);
  final color[] COLOURS = {RED, GREEN, BLUE, YELLOW};

  // Split beams of different directions into subclasses?

  Direction direction;
  int originX, originY;
  int headX, headY, headSize;
  int tailLength;
  int haloX, haloY;
  float haloSize;
  boolean active;
  color colour;

  int timeCreated;
  int startTime; // Rename

  /* Possible variable names:
  int creationTime, waitTime;
  int originX, originY;
  int positionX, positionY;
  int haloX, haloY;
  int headSize, tailLength;
  float haloSize;
  boolean active;
  color colour; */

  Beam(Direction direction, Distance distance, int timeCreated) {
    this.direction = direction;
    this.timeCreated = timeCreated;
    setHeadXYCoordinates();
    setHeadSizeAndSpeed(distance);
    setTailAndHaloAttributes();
    randomiseColour();
    randomiseStartTime();
    active = false;
  }

  Beam(Direction direction, Distance distance, int colour, int headX, int headY) { // Create mouse press beams class?
    this.direction = direction;
    this.colour = COLOURS[colour];
    this.headX = headX;
    this.headY = headY;
    originX = headX;
    originY = headY;
    setHeadSizeAndSpeed(distance);
    setTailAndHaloAttributes();
    timeCreated = startTime = 0;
    active = true;
  }

  void setHeadXYCoordinates() { // Put in constructor
    if (direction == Direction.UP) {
      headX = int(random(width));
      headY = height - 1;
    } else if (direction == Direction.DOWN) {
      headX = int(random(width));
      headY = 0;
    } else if (direction == Direction.LEFT) {
      headX = width - 1;
      headY = int(random(height));
    } else if (direction == Direction.RIGHT) {
      headX = 0;
      headY = int(random(height));
    } else {
      println("Error: Invalid direction. Aborting...");
      exit();
    }
    originX = headX;
    originY = headY;
  }

  void setHeadSizeAndSpeed(Distance distance) { // Use Distance enum, static class, etc?. Put in constructor
    if (distance == Distance.FAR) {
      headSize = 5;
    } else if (distance == Distance.MIDDLE) {
      headSize = 7;
    } else if (distance == Distance.NEAR) {
      headSize = 9;
    } else {
      println("Error: Invalid distance. Aborting...");
      exit();
    }
  }

  void setTailAndHaloAttributes() { // Put in constructor
    haloX = haloY = headSize / 2;
    haloSize = headSize * 1.5;
  }

  void randomiseColour() { // Put in constructor
    colour = COLOURS[int(random(COLOURS.length))];
  }

  void randomiseStartTime() { // Put in constructor
    startTime = int(random(START_TIME + 1));
  }

  boolean isActive() {
    return active;
  }

  void ready(int milliseconds) { // Rename method
    if (milliseconds - timeCreated >= startTime) active = true;
  }

  void move() {
    if (direction == Direction.UP) {
      headY -= headSize;
      if (headY + tailLength < 0) active = false;
    } else if (direction == Direction.DOWN) {
      headY += headSize;
      if (headY - tailLength >= height) active = false;
    } else if (direction == Direction.LEFT) {
      headX -= headSize;
      if (headX + tailLength < 0) active = false;
    } else if (direction == Direction.RIGHT) {
      headX += headSize;
      if (headX - tailLength >= width) active = false;
    } else {
      println("Error: Invalid direction. Aborting...");
      exit();
    }
  }

  void draw() {
    fill(colour, TRANSPARENT);
    pushMatrix();

    if (direction == Direction.UP) {
      translate(headX, headY);
      tailLength = min(originY - headY, headSize * 20);
    } else if (direction == Direction.DOWN) {
      translate(headX + headSize, headY + headSize);
      rotate(PI);
      tailLength = min(headY - originY, headSize * 20);
    } else if (direction == Direction.LEFT) {
      translate(headX, headY + headSize);
      rotate(PI + HALF_PI);
      tailLength = min(originX - headX, headSize * 20);
    } else if (direction == Direction.RIGHT) {
      translate(headX + headSize, headY);
      rotate(HALF_PI);
      tailLength = min(headX - originX, headSize * 20);
    } else {
      println("Error: Invalid direction. Aborting...");
      exit();
    }

    rect(0, 0, headSize, tailLength); // Tail
    rect(0, 0, headSize, headSize); // Head
    ellipse(haloX, haloY, haloSize, haloSize); // Halo

    popMatrix();
  }
}