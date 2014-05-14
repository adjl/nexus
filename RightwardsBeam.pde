class RightwardsBeam extends Beam {

  RightwardsBeam(Distance distance) {
    super(distance);
    origin = new PVector(0, int(random(height)));
    position = new PVector(origin.x, origin.y);
    velocity = new PVector(distance.getVelocity(), 0);
    angle = HALF_PI;
  }

  RightwardsBeam(Distance distance, float originX, float originY, int colourID) {
    super(distance, originX, originY, colourID);
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