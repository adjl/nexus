enum Distance {

  FAR(5, 1, 0.5f),
  MIDDLE(7, 2, 0.5f),
  NEAR(9, 3, 0.5f);

  final int size;
  final int speed;
  final float opacity;

  Distance(int size, int speed, float opacity) {
    this.size = size;
    this.speed = speed;
    this.opacity = opacity;
  }

  int getSize() {
    return size;
  }

  int getSpeed() {
    return speed;
  }

  float getOpacity() {
    return opacity;
  }
}