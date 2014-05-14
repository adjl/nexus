enum BeamType {

  FAR(1f, 0.5f, 5f),
  MIDDLE(2f, 0.5f, 7f),
  NEAR(3f, 0.5f, 9f);

  final float velocity;
  final float transparency;
  final float size;

  BeamType(float velocity, float transparency, float size) {
    this.velocity = velocity;
    this.transparency = transparency * 255;
    this.size = size;
  }

  float getVelocity() {
    return velocity;
  }

  float getTransparency() {
    return transparency;
  }

  float getSize() {
    return size;
  }
}