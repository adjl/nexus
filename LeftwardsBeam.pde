class LeftwardsBeam extends Beam {

  LeftwardsBeam(Distance distance, int creationTime) {
    super(distance, creationTime);
    originX = positionX = width - 1;
    originY = positionY = int(random(height));
  }

  LeftwardsBeam(Distance distance, int originX, int originY, int colour) {
    super(distance, originX, originY, colour);
  }

  boolean isGone() {
    return positionX + tailLength * size < 0;
  }

  void move() {
    positionX -= speed;
    tailLength = min((originX - positionX) / size, 20);
  }

  void draw() {
    fill(colour, BEAM_TRANSPARENCY);
    pushMatrix();
    translate(positionX - size * 0.5, positionY + size * 0.5);
    rotate(PI + HALF_PI);
    scale(size);
    rect(0, 0, 1, tailLength); // Tail
    ellipse(0.5, 0.5, 1.5, 1.5); // Halo
    popMatrix();
  }
}