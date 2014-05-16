enum BeamType {

  FAR(1f, 0.1f, 0.5f, 5f),
  MIDDLE(2f, 0.2f, 0.7f, 7f),
  NEAR(3f, 0.3f, 0.9f, 9f);

  final float velocity;
  final float acceleration;
  final float opacity;
  final float size;

  BeamType(float velocity, float acceleration, float opacity, float size) {
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.opacity = opacity * 255;
    this.size = size;
  }

  float velocity() {
    return velocity;
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