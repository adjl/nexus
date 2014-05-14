class DownwardsBeam extends Beam {

  DownwardsBeam(BeamType beamType) {
    super(beamType);
    origin = new PVector(int(random(width)), 0);
    position = new PVector(origin.x, origin.y);
    acceleration = new PVector(0, beamType.getAcceleration());
    angle = PI;
  }

  DownwardsBeam(BeamType beamType, float originX, float originY, int colourID) {
    super(beamType, originX, originY, colourID);
    acceleration = new PVector(0, beamType.getAcceleration());
    angle = PI;
  }

  boolean isGone() {
    return position.y - length * size >= height;
  }

  void move() {
    velocity.add(acceleration);
    position.add(velocity);
    length = min((position.y - origin.y) / size + 1, maxLength);
  }

  void draw() {
    drawBeam(position.x + size * 0.5, position.y + size * 0.5);
  }
}