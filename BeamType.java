enum BeamType {

  FAR(1f, 0.5f, 5f),
  MIDDLE(2f, 0.5f, 7f),
  NEAR(3f, 0.5f, 9f);

  final float velocity;
  final float opacity;
  final float size;

  BeamType(float velocity, float opacity, float size) {
    this.velocity = velocity;
    this.opacity = opacity * 255;
    this.size = size;
  }

  float velocity() {
    return velocity;
  }

  float opacity() {
    return opacity;
  }

  float size() {
    return size;
  }
}