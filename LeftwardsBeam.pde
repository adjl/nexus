class LeftwardsBeam extends Beam {

  LeftwardsBeam(BeamType beamType) {
    super(beamType);
    origin = new PVector(width - 1, int(random(height)));
    position = new PVector(origin.x, origin.y);
    acceleration = new PVector(-beamType.getAcceleration(), 0);
    angle = PI + HALF_PI;
  }

  LeftwardsBeam(BeamType beamType, float originX, float originY, int colourID) {
    super(beamType, originX, originY, colourID);
    acceleration = new PVector(-beamType.getAcceleration(), 0);
    angle = PI + HALF_PI;
  }

  boolean isGone() {
    return position.x + length * size < 0;
  }

  void move() {
    velocity.add(acceleration);
    position.add(velocity);
    length = min((origin.x - position.x) / size + 1, maxLength);
  }

  void draw() {
    drawBeam(position.x - size * 0.5, position.y + size * 0.5);
  }
}