class DownwardsBeam extends Beam {

  DownwardsBeam(Distance distance) {
    super(distance);
    originX = positionX = int(random(width));
    originY = positionY = 0;
    angle = PI;
  }

  DownwardsBeam(Distance distance, int originX, int originY, int colour) {
    super(distance, originX, originY, colour);
    angle = PI;
  }

  boolean isGone() {
    return positionY - length * size >= height;
  }

  void move() {
    positionY += speed;
    length = min((positionY - originY) / size + 1, maxLength);
  }

  void draw() {
    super.drawBeam(positionX + size * 0.5, positionY + size * 0.5);
  }
}