enum BeamType {

  FAR(0.1f, 0.5f, 5f),
  MIDDLE(0.2f, 0.7f, 7f),
  NEAR(0.3f, 0.9f, 9f);

  final float acceleration;
  final float opacity;
  final float size;

  BeamType(float acceleration, float opacity, float size) {
    this.acceleration = acceleration;
    this.opacity = opacity * 255;
    this.size = size;
  }

  float acceleration() {
    return acceleration;
  }

  float opacity() {
    return opacity;
  }

  float size() {
    return size;
  }
}