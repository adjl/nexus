class UpwardsBeam extends Beam {

  UpwardsBeam(BeamType beamType) {
    super(beamType);
    origin = new PVector(int(random(width)), height - 1);
    position = new PVector(origin.x, origin.y);
    velocity = new PVector(0, -beamType.velocity());
    acceleration = new PVector(0, -beamType.acceleration());
    angle = 0.0;
  }

  UpwardsBeam(BeamType beamType, float originX, float originY, int colourID) {
    super(beamType, originX, originY, colourID);
    velocity = new PVector(0, -beamType.velocity());
    acceleration = new PVector(0, -beamType.acceleration());
    angle = 0.0;
  }

  boolean isGone() {
    return position.y + length * size < 0;
  }

  void move() {
    moveBeam();
    length = min((origin.y - position.y) / size + 1, BEAM_MAX_LENGTH);
  }

  void draw() {
    drawBeam(position.x - size * 0.5, position.y - size * 0.5);
  }
}
