enum BeamType {

  FAR(1f, 0.5f, 5f),
  MIDDLE(2f, 0.5f, 7f),
  NEAR(3f, 0.5f, 9f);

  final float acceleration;
  final float opacity;
  final float size;

  BeamType(float acceleration, float opacity, float size) {
    this.acceleration = acceleration;
    this.opacity = opacity * 255;
    this.size = size;
  }

  float getAcceleration() {
    return acceleration;
  }

  float getOpacity() {
    return opacity;
  }

  float getSize() {
    return size;
  }
}