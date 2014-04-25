class DownwardsBeam extends Beam {

  DownwardsBeam(Distance distance) {
    super(distance);
    originX = positionX = int(random(width));
    originY = positionY = 0;
  }

  DownwardsBeam(Distance distance, int originX, int originY, int colour) {
    super(distance, originX, originY, colour);
  }

  boolean isGone() {
    return positionY - tailLength * size >= height;
  }

  void move() {
    positionY += speed;
    tailLength = min((positionY - originY) / size, 20);
  }

  void draw() {
    fill(colour, BEAM_TRANSPARENCY);
    pushMatrix();
    translate(positionX + size * 0.5, positionY + size * 0.5);
    rotate(PI);
    scale(size);
    rect(0, 0, 1, tailLength); // Tail
    ellipse(0.5, 0.5, 1.5, 1.5); // Halo
    popMatrix();
  }
}