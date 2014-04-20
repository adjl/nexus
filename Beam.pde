class Beam {

  static final float ALPHA = 127.5;

  final color RED = color(255, 0, 0);
  final color GREEN = color(0, 255, 0);
  final color BLUE = color(0, 0, 255);
  final color YELLOW = color(255, 255, 0);
  final color[] COLOURS = {RED, GREEN, BLUE, YELLOW};

  Direction direction;
  int headX, headY, headSize, speed;
  int tailLength, haloX, haloY;
  float haloSize;
  color colour;
  boolean active;

  Beam(Direction direction, Distance distance) {
    this.direction = direction;
    setHeadXYCoordinates();
    setHeadSizeAndSpeed(distance);
    setTailAndHaloAttributes();
    setRandomColour();
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
  }

  void setHeadSizeAndSpeed(Distance distance) {
    if (distance == Distance.NEAR) {
      headSize = 9;
      speed = 5;
    } else if (distance == Distance.MIDDLE) {
      headSize = 7;
      speed = 4;
    } else if (distance == Distance.FAR) {
      headSize = 5;
      speed = 3;
    } else {
      println("Error: Invalid distance. Exiting...");
      exit();
    }
  }

  void setTailAndHaloAttributes() {
    tailLength = headSize * 20;
    haloX = haloY = headSize / 2;
    haloSize = headSize * 1.5;
  }

  void setRandomColour() {
    colour = COLOURS[int(random(COLOURS.length))];
  }

  boolean isActive() {
    return active;
  }

  void move() {
    if (direction == Direction.UP) {
      headY -= speed;
      if (headY + tailLength < 0) active = false;
    } else if (direction == Direction.RIGHT) {
      headX += speed;
      if (headX - tailLength >= width) active = false;
    } else if (direction == Direction.DOWN) {
      headY += speed;
      if (headY - tailLength >= height) active = false;
    } else if (direction == Direction.LEFT) {
      headX -= speed;
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

    rect(0, 0, headSize, tailLength); // Tail
    rect(0, 0, headSize, headSize); // Head
    ellipse(haloX, haloY, haloSize, haloSize); // Halo

    popMatrix();
  }
}