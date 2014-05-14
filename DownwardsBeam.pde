class DownwardsBeam extends Beam {

  DownwardsBeam(Distance distance) {
    super(distance);
    origin = new PVector(int(random(width)), 0);
    position = new PVector(origin.x, origin.y);
    velocity = new PVector(0, distance.getVelocity());
    angle = PI;
  }

  DownwardsBeam(Distance distance, float originX, float originY, int colourID) {
    super(distance, originX, originY, colourID);
    velocity = new PVector(0, distance.getVelocity());
    angle = PI;
  }

  boolean isGone() {
    return position.y - length * size >= height;
  }

  void move() {
    position.add(velocity);
    length = min((position.y - origin.y) / size + 1, maxLength);
  }

  void draw() {
    drawBeam(position.x + size * 0.5, position.y + size * 0.5);
  }
}