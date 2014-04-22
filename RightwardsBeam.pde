class RightwardsBeam extends Beam {

  RightwardsBeam(Distance distance, int creationTime) {
    super(distance, creationTime);
    originX = positionX = 0;
    originY = positionY = int(random(height));
  }

  RightwardsBeam(Distance distance, int originX, int originY, int colour) {
    super(distance, originX, originY, colour);
  }

  void move() {
    positionX += headSize;
    if (positionX - tailLength >= width) active = false;
  }

  void draw() {
    tailLength = min(positionX - originX, headSize * 20);
    fill(colour, BEAM_TRANSPARENCY);
    pushMatrix();
    translate(positionX + headSize, positionY);
    rotate(HALF_PI);
    rect(0, 0, headSize, tailLength); // Tail
    rect(0, 0, headSize, headSize); // Head
    ellipse(haloX, haloY, haloSize, haloSize); // Halo
    popMatrix();
  }
}