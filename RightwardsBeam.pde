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
    tailLength = min((positionX - originX) / size + 1, 20);
  }

  void draw() {
    fill(colour, BEAM_TRANSPARENCY);
    pushMatrix();
    translate(positionX + size * 0.5, positionY - size * 0.5);
    rotate(HALF_PI);
    scale(size);
    beginShape(QUADS);
    fill(colour, 255);
    vertex(0, 0);
    vertex(1, 0);
    fill(colour, 0);
    vertex(1, tailLength);
    vertex(0, tailLength);
    endShape(CLOSE);
    popMatrix();
  }
}