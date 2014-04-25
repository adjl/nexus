class LeftwardsBeam extends Beam {

  LeftwardsBeam(Distance distance) {
    super(distance);
    originX = positionX = width - 1;
    originY = positionY = int(random(height));
  }

  LeftwardsBeam(Distance distance, int originX, int originY, int colour) {
    super(distance, originX, originY, colour);
  }

  boolean isGone() {
    return positionX + length * size < 0;
  }

  void move() {
    positionX -= speed;
    length = min((originX - positionX) / size + 1, 20);
  }

  void draw() {
    fill(colour, BEAM_TRANSPARENCY);
    pushMatrix();
    translate(positionX - size * 0.5, positionY + size * 0.5);
    rotate(PI + HALF_PI);
    scale(size);
    beginShape(QUADS);
    fill(colour, 255);
    vertex(0, 0);
    vertex(1, 0);
    fill(colour, 0);
    vertex(1, length);
    vertex(0, length);
    endShape(CLOSE);
    popMatrix();
  }
}