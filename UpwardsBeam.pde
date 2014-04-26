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
    return positionY + length * size < 0;
  }

  void move() {
    positionY -= speed;
    length = min((originY - positionY) / size + 1, maxLength);
  }

  void draw() {
    float tailTransparency = map(maxLength - length, 0, maxLength, 0, headTransparency);
    pushMatrix();
    translate(positionX - size * 0.5, positionY - size * 0.5);
    scale(size);
    beginShape(QUADS);
    fill(colour, headTransparency);
    vertex(0, 0);
    vertex(1, 0);
    fill(colour, tailTransparency);
    vertex(1, length);
    vertex(0, length);
    endShape(CLOSE);
    popMatrix();
  }
}