class UpwardsBeam extends Beam {

  UpwardsBeam(Distance distance, int creationTime) {
    super(distance, creationTime);
    originX = positionX = int(random(width));
    originY = positionY = height - 1;
  }

  UpwardsBeam(Distance distance, int originX, int originY, int colour) {
    super(distance, originX, originY, colour);
  }

  boolean isGone() {
    return positionY + tailLength * size < 0;
  }

  void move() {
    positionY -= speed;
    tailLength = min((originY - positionY) / size, 20);
  }

  void draw() {
    fill(colour, BEAM_TRANSPARENCY);
    pushMatrix();
    translate(positionX - size * 0.5, positionY - size * 0.5);
    scale(size);
    rect(0, 0, 1, tailLength); // Tail
    ellipse(0.5, 0.5, 1.5, 1.5); // Halo
    popMatrix();
  }
}