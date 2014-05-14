class UpwardsBeam extends Beam {

  UpwardsBeam(Distance distance) {
    super(distance);
    origin = new PVector(int(random(width)), height - 1);
    position = new PVector(origin.x, origin.y);
    velocity = new PVector(0, -distance.getVelocity());
    angle = 0;
  }

  UpwardsBeam(Distance distance, float originX, float originY, int colourID) {
    super(distance, originX, originY, colourID);
    velocity = new PVector(0, -distance.getVelocity());
    angle = 0;
  }

  boolean isGone() {
    return position.y + length * size < 0;
  }

  void move() {
    position.add(velocity);
    length = min((origin.y - position.y) / size + 1, maxLength);
  }

  void draw() {
    drawBeam(position.x - size * 0.5, position.y - size * 0.5);
  }
}