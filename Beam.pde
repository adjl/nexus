class Beam {

  static final float ALPHA = 127.5;
  static final int START_TIME = 10000;

  final color RED = color(255, 0, 0);
  final color GREEN = color(0, 255, 0);
  final color BLUE = color(0, 0, 255);
  final color YELLOW = color(255, 255, 0);
  final color[] COLOURS = {RED, GREEN, BLUE, YELLOW};

  Direction direction;
  int headX, headY, headSize;
  int tailLength, haloX, haloY;
  float haloSize;
  color colour;
  int timeCreated, startTime;
  boolean active;
  int originX, originY;

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

  Beam(Direction direction, Distance distance, int colour, int headX, int headY) {
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

  void setHeadXYCoordinates() {
    if (direction == Direction.UP) {
      headX = int(random(width));
      headY = height - 1;
    } else if (direction == Direction.RIGHT) {
      headX = 0;
      headY = int(random(height));
    } else if (direction == Direction.DOWN) {
      headX = int(random(width));
      headY = 0;
    } else if (direction == Direction.LEFT) {
      headX = width - 1;
      headY = int(random(height));
    } else {
      println("Error: Invalid direction. Exiting...");
      exit();
    }
    originX = headX;
    originY = headY;
  }

  void setHeadSizeAndSpeed(Distance distance) {
    if (distance == Distance.NEAR) {
      headSize = 9;
    } else if (distance == Distance.MIDDLE) {
      headSize = 7;
    } else if (distance == Distance.FAR) {
      headSize = 5;
    } else {
      println("Error: Invalid distance. Exiting...");
      exit();
    }
  }

  void setTailAndHaloAttributes() {
    haloX = haloY = headSize / 2;
    haloSize = headSize * 1.5;
  }

  void randomiseColour() {
    colour = COLOURS[int(random(COLOURS.length))];
  }

  void randomiseStartTime() {
    startTime = int(random(START_TIME + 1));
  }

  boolean isActive() {
    return active;
  }

  void ready(int milliseconds) {
    if (milliseconds - timeCreated >= startTime) active = true;
  }

  void move() {
    if (direction == Direction.UP) {
      headY -= headSize;
      if (headY + tailLength < 0) active = false;
    } else if (direction == Direction.RIGHT) {
      headX += headSize;
      if (headX - tailLength >= width) active = false;
    } else if (direction == Direction.DOWN) {
      headY += headSize;
      if (headY - tailLength >= height) active = false;
    } else if (direction == Direction.LEFT) {
      headX -= headSize;
      if (headX + tailLength < 0) active = false;
    } else {
      println("Error: Invalid direction. Exiting...");
      exit();
    }
  }

  void draw() {
    fill(colour, ALPHA);
    pushMatrix();

    if (direction == Direction.UP) {
      translate(headX, headY);
    } else if (direction == Direction.RIGHT) {
      translate(headX + headSize, headY);
      rotate(HALF_PI);
    } else if (direction == Direction.DOWN) {
      translate(headX + headSize, headY + headSize);
      rotate(PI);
    } else if (direction == Direction.LEFT) {
      translate(headX, headY + headSize);
      rotate(PI + HALF_PI);
    } else {
      println("Error: Invalid direction. Exiting...");
      exit();
    }

    if (direction == Direction.UP) {
      tailLength = min(originY - headY, headSize * 20);
    } else if (direction == Direction.RIGHT) {
      tailLength = min(headX - originX, headSize * 20);
    } else if (direction == Direction.DOWN) {
      tailLength = min(headY - originY, headSize * 20);
    } else if (direction == Direction.LEFT) {
      tailLength = min(originX - headX, headSize * 20);
    } else {
      println("Error: Invalid direction. Exiting...");
      exit();
    }

    rect(0, 0, headSize, tailLength); // Tail
    rect(0, 0, headSize, headSize); // Head
    ellipse(haloX, haloY, haloSize, haloSize); // Halo

    popMatrix();
  }
}