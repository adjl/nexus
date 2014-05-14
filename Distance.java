enum Distance {

  FAR(5, 1, 0.5f),
  MIDDLE(7, 2, 0.5f),
  NEAR(9, 3, 0.5f);

  final int size;
  final int velocity;
  final float transparency;

  Distance(int size, int velocity, float transparency) {
    this.size = size;
    this.velocity = velocity;
    this.transparency = transparency * 255;
  }

  int getSize() {
    return size;
  }

  int getVelocity() {
    return velocity;
  }

  float getTransparency() {
    return transparency;
  }
}