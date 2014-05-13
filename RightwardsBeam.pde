class RightwardsBeam extends Beam {

  RightwardsBeam(Distance distance) {
    super(distance);
    origin = new PVector(0, int(random(height)));
    position = new PVector(origin.x, origin.y);
    angle = HALF_PI;
  }

  RightwardsBeam(Distance distance, float originX, float originY, int colour) {
    super(distance, originX, originY, colour);
    angle = HALF_PI;
  }

  boolean isGone() {
    return position.x - length * size >= width;
  }

  void move() {
    position.x += speed;
    length = min((position.x - origin.x) / size + 1, maxLength);
  }

  void draw() {
    drawBeam(position.x + size * 0.5, position.y - size * 0.5);
  }
}