class UpwardsBeam extends Beam {

  UpwardsBeam(Distance distance) {
    super(distance);
    position = new PVector(int(random(width)), height - 1);
    originX = position.x;
    originY = position.y;
  }

  UpwardsBeam(Distance distance, float originX, float originY, int colour) {
    super(distance, originX, originY, colour);
  }

  boolean isGone() {
    return position.y + length * size < 0;
  }

  void move() {
    position.y -= speed;
    length = min((originY - position.y) / size + 1, maxLength);
  }

  void draw() {
    drawBeam(position.x - size * 0.5, position.y - size * 0.5);
  }
}