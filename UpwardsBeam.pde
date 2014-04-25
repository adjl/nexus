class UpwardsBeam extends Beam {

  UpwardsBeam(Distance distance) {
    super(distance);
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
    tailLength = min((originY - positionY) / size + 1, 20);
  }

  void draw() {
    pushMatrix();
    translate(positionX - size * 0.5, positionY - size * 0.5);
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