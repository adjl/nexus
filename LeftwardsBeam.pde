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
    return positionX + tailLength < 0;
  }

  void move() {
    positionX -= headSize;
  }

  void draw() {
    tailLength = min(originX - positionX, headSize * 20);
    fill(colour, BEAM_TRANSPARENCY);
    pushMatrix();
    translate(positionX, positionY + headSize);
    rotate(PI + HALF_PI);
    rect(0, 0, headSize, tailLength); // Tail
    rect(0, 0, headSize, headSize); // Head
    ellipse(haloX, haloY, haloSize, haloSize); // Halo
    popMatrix();
  }
}