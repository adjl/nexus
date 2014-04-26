class RightwardsBeam extends Beam {

  RightwardsBeam(Distance distance) {
    super(distance);
    originX = positionX = 0;
    originY = positionY = int(random(height));
    angle = HALF_PI;
  }

  RightwardsBeam(Distance distance, int originX, int originY, int colour) {
    super(distance, originX, originY, colour);
    angle = HALF_PI;
  }

  boolean isGone() {
    return positionX - length * size >= width;
  }

  void move() {
    positionX += speed;
    length = min((positionX - originX) / size + 1, maxLength);
  }

  void draw() {
    super.drawBeam(positionX + size * 0.5, positionY - size * 0.5);
  }
}