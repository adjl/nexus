class DownwardsBeam extends Beam {

  DownwardsBeam(Distance distance, int creationTime) {
    super(distance, creationTime);
    originX = positionX = int(random(width));
    originY = positionY = 0;
  }

  DownwardsBeam(Distance distance, int originX, int originY, int colour) {
    super(distance, originX, originY, colour);
  }

  boolean isGone() {
    return positionY - tailLength >= height;
  }

  void move() {
    positionY += speed;
  }

  void draw() {
    tailLength = min(positionY - originY, headSize * 20);
    fill(colour, BEAM_TRANSPARENCY);
    pushMatrix();
    translate(positionX + headSize, positionY + headSize);
    rotate(PI);
    rect(0, 0, headSize, tailLength); // Tail
    rect(0, 0, headSize, headSize); // Head
    ellipse(haloX, haloY, haloSize, haloSize); // Halo
    popMatrix();
  }
}