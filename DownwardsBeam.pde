class DownwardsBeam extends Beam {

  DownwardsBeam(Distance distance) {
    super(distance);
    position = new PVector(int(random(width)), 0);
    originX = position.x;
    originY = position.y;
    angle = PI;
  }

  DownwardsBeam(Distance distance, float originX, float originY, int colour) {
    super(distance, originX, originY, colour);
    angle = PI;
  }

  boolean isGone() {
    return position.y - length * size >= height;
  }

  void move() {
    position.y += speed;
    length = min((position.y - originY) / size + 1, maxLength);
  }

  void draw() {
    drawBeam(position.x + size * 0.5, position.y + size * 0.5);
  }
}