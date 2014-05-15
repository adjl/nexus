class RightwardsBeam extends Beam {

  RightwardsBeam(BeamType beamType) {
    super(beamType);
    origin = new PVector(0, int(random(height)));
    position = new PVector(origin.x, origin.y);
    acceleration = new PVector(beamType.acceleration(), 0);
    angle = HALF_PI;
  }

  RightwardsBeam(BeamType beamType, float originX, float originY, int colourID) {
    super(beamType, originX, originY, colourID);
    acceleration = new PVector(beamType.acceleration(), 0);
    angle = HALF_PI;
  }

  boolean isGone() {
    return position.x - length * size >= width;
  }

  void move() {
    velocity.add(acceleration);
    position.add(velocity);
    length = min((position.x - origin.x) / size + 1, maxLength);
  }

  void draw() {
    drawBeam(position.x + size * 0.5, position.y - size * 0.5);
  }
}