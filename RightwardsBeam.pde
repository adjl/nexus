class RightwardsBeam extends Beam {

  RightwardsBeam(Distance distance) {
    super(distance);
    originX = positionX = 0;
    originY = positionY = int(random(height));
  }

  RightwardsBeam(Distance distance, int originX, int originY, int colour) {
    super(distance, originX, originY, colour);
  }

  boolean isGone() {
    return positionX - tailLength * size >= width;
  }

  void move() {
    positionX += speed;
    tailLength = min((positionX - originX) / size, 20);
  }

  void draw() {
    fill(colour, BEAM_TRANSPARENCY);
    pushMatrix();
    translate(positionX + size * 0.5, positionY - size * 0.5);
    rotate(HALF_PI);
    scale(size);
    rect(0, 0, 1, tailLength); // Tail
    ellipse(0.5, 0.5, 1.5, 1.5); // Halo
    popMatrix();
  }
}