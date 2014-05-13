class LeftwardsBeam extends Beam {

  LeftwardsBeam(Distance distance) {
    super(distance);
    origin = new PVector(width - 1, int(random(height)));
    position = new PVector(origin.x, origin.y);
    angle = PI + HALF_PI;
  }

  LeftwardsBeam(Distance distance, float originX, float originY, int colour) {
    super(distance, originX, originY, colour);
    angle = PI + HALF_PI;
  }

  boolean isGone() {
    return position.x + length * size < 0;
  }

  void move() {
    position.x -= speed;
    length = min((origin.x - position.x) / size + 1, maxLength);
  }

  void draw() {
    drawBeam(position.x - size * 0.5, position.y + size * 0.5);
  }
}