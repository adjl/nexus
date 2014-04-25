enum Distance {

  // Modify these as preferred:
  // --------------------------
  FAR(2, 2),
  MIDDLE(4, 4),
  NEAR(8, 8);
  // --------------------------

  final int size;
  final int speed;

  Distance(int size, int speed) {
    this.size = size;
    this.speed = speed;
  }

  int getSize() {
    return size;
  }

  int getSpeed() {
    return speed;
  }
}