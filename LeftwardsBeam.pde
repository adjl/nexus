class LeftwardsBeam extends Beam {

  LeftwardsBeam(Distance distance) {
    super(distance);
    originX = positionX = width - 1;
    originY = positionY = int(random(height));
    angle = PI + HALF_PI;
  }

  LeftwardsBeam(Distance distance, int originX, int originY, int colour) {
    super(distance, originX, originY, colour);
    angle = PI + HALF_PI;
  }

  boolean isGone() {
    return positionX + length * size < 0;
  }

  void move() {
    positionX -= speed;
    length = min((originX - positionX) / size + 1, maxLength);
  }

  void draw() {
    super.drawBeam(positionX - size * 0.5, positionY + size * 0.5);
  }
}