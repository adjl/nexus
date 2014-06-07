enum BeamType {

  FAR(1.0f, 0.1f, 3.0f, 0.5f, 5.0f),
  MIDDLE(2.0f, 0.2f, 6.0f, 0.7f, 7.0f),
  NEAR(3.0f, 0.3f, 9.0f, 0.9f, 9.0f);

  final float velocity;
  final float acceleration;
  final float terminalVelocity;
  final float opacity;
  final float size;

  BeamType(float velocity, float acceleration, float terminalVelocity, float opacity, float size) {
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.terminalVelocity = terminalVelocity;
    this.opacity = opacity * 255;
    this.size = size;
  }

  float velocity() {
    return velocity;
  }

  float acceleration() {
    return acceleration;
  }

  float terminalVelocity() {
    return terminalVelocity;
  }

  float opacity() {
    return opacity;
  }

  float size() {
    return size;
  }
}