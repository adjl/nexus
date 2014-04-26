enum Distance {

  FAR(2, 1, 0.5f),
  MIDDLE(5, 3, 0.7f),
  NEAR(9, 5, 0.9f);

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