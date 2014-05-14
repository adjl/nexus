class UpwardsBeam extends Beam {

  UpwardsBeam(BeamType beamType) {
    super(beamType);
    origin = new PVector(int(random(width)), height - 1);
    position = new PVector(origin.x, origin.y);
    acceleration = new PVector(0, -beamType.getAcceleration());
    angle = 0;
  }

  UpwardsBeam(BeamType beamType, float originX, float originY, int colourID) {
    super(beamType, originX, originY, colourID);
    acceleration = new PVector(0, -beamType.getAcceleration());
    angle = 0;
  }

  boolean isGone() {
    return position.y + length * size < 0;
  }

  void move() {
    velocity.add(acceleration);
    position.add(velocity);
    length = min((origin.y - position.y) / size + 1, maxLength);
  }

  void draw() {
    drawBeam(position.x - size * 0.5, position.y - size * 0.5);
  }
}