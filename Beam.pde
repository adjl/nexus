class Beam {

  Direction direction;
  Distance distance;
  int x;
  int y;
  int size;
  int speed;
  boolean active;
  color colour;

  color[] colours = {
    color(255, 0, 0),
    color(0, 255, 0),
    color(0, 0, 255),
    color(255, 255, 0)
  };

  Beam(Direction direction, Distance distance) {
    this.direction = direction;
    this.distance = distance;

    if (direction == Direction.UP) {
      x = int(random(width));
      y = height - 1;
    } else if (direction == Direction.RIGHT) {
      x = 0;
      y = int(random(height));
    } else if (direction == Direction.DOWN) {
      x = int(random(width));
      y = 0;
    } else if (direction == Direction.LEFT) {
      x = width - 1;
      y = int(random(height));
    } else {
      println("Error: Invalid direction. Exiting...");
      exit();
    }

    if (distance == Distance.NEAR) {
      size = 7;
      speed = 4;
    } else if (distance == Distance.MIDDLE) {
      size = 6;
      speed = 2;
    } else if (distance == Distance.FAR) {
      size = 5;
      speed = 1;
    } else {
      println("Error: Invalid distance. Exiting...");
      exit();
    }

    active = true;
    colour = colours[int(random(4))];
  }

  boolean isActive() {
    return active;
  }

  void move() {
    if (direction == Direction.UP) {
      y -= speed;
      if (y + size * 20 < 0) active = false; // Include tail length
    } else if (direction == Direction.RIGHT) {
      x += speed;
      if (x - size * 20 >= width) active = false;
    } else if (direction == Direction.DOWN) {
      y += speed;
      if (y - size * 20 >= height) active = false;
    } else if (direction == Direction.LEFT) {
      x -= speed;
      if (x + size * 20 < 0) active = false;
    } else {
      println("Error: Invalid direction. Exiting...");
      exit();
    }
  }

  void draw() {
    fill(colour, 127.5); // Temporary colour, only for transparency

    pushMatrix();

    if (direction == Direction.UP) {
      translate(x, y);
    } else if (direction == Direction.RIGHT) {
      translate(x + size, y);
      rotate(HALF_PI);
    } else if (direction == Direction.DOWN) {
      translate(x + size, y + size);
      rotate(PI);
    } else if (direction == Direction.LEFT) {
      translate(x, y + size);
      rotate(PI + HALF_PI);
    } else {
      println("Error: Invalid direction. Exiting...");
      exit();
    }

    rect(0, 0, size, size * 20); // Tail
    rect(0, 0, size, size); // Head
    ellipse(size / 2.0, size / 2.0, size * 1.5, size * 1.5); // Halo

    popMatrix();
  }
}