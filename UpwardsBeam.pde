class UpwardsBeam extends Beam {

  UpwardsBeam(Distance distance, int creationTime) {
    super(distance, creationTime);
    originX = positionX = int(random(width));
    originY = positionY = height - 1;
  }

  UpwardsBeam(Distance distance, int originX, int originY, int colour) { // Do I need this explicit constructor?
    super(distance, originX, originY, colour);
  }

  boolean isGone() {
    return positionY + tailLength < 0;
  }

  Beam move() {
    positionY -= headSize; // Use speed variable (for readability)?
    return this;
  }

  void draw() {
    tailLength = min(originY - positionY, headSize * 20); // Can I rewrite this? Set tailLength as constant
    fill(colour, BEAM_TRANSPARENCY);
    pushMatrix();
    translate(positionX, positionY);
    rect(0, 0, headSize, tailLength); // Tail
    rect(0, 0, headSize, headSize); // Head
    ellipse(haloX, haloY, haloSize, haloSize); // Halo
    popMatrix();
  }
}