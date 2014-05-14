class RightwardsBeam extends Beam {

  PVector velocity;

  RightwardsBeam(Distance distance) {
    super(distance);
    origin = new PVector(0, int(random(height)));
    position = new PVector(origin.x, origin.y);
    velocity = new PVector(distance.getVelocity(), 0);
    angle = HALF_PI;
  }

  RightwardsBeam(Distance distance, float originX, float originY, int colour) {
    super(distance, originX, originY, colour);
    velocity = new PVector(distance.getVelocity(), 0);
    angle = HALF_PI;
  }

  boolean isGone() {
    return position.x - length * size >= width;
  }

  void move() {
    position.add(velocity);
    length = min((position.x - origin.x) / size + 1, maxLength);
  }

  void draw() {
    drawBeam(position.x + size * 0.5, position.y - size * 0.5);
  }
}