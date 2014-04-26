enum Distance {

  FAR(2, 1, 0.5f),
  MIDDLE(5, 3, 0.7f),
  NEAR(9, 5, 0.9f);

  final int size;
  final int speed;
  final float transparency;

  Distance(int size, int speed, float transparency) {
    this.size = size;
    this.speed = speed;
    this.transparency = transparency;
  }

  int getSize() {
    return size;
  }

  int getSpeed() {
    return speed;
  }

  float getTransparency() {
    return transparency;
  }
}