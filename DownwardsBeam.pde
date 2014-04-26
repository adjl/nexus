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
    return positionY - length * size >= height;
  }

  void move() {
    positionY += speed;
    length = min((positionY - originY) / size + 1, maxLength);
  }

  void draw() {
    float tailTransparency = map(maxLength - length, 0, maxLength, 0, headTransparency);
    pushMatrix();
    translate(positionX + size * 0.5, positionY + size * 0.5);
    rotate(PI);
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