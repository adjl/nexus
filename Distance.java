enum Distance {

  FAR(2, 2),
  MIDDLE(5, 5),
  NEAR(9, 9);

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