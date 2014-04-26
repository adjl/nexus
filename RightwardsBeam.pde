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
    return positionX - length * size >= width;
  }

  void move() {
    positionX += speed;
    length = min((positionX - originX) / size + 1, maxLength);
  }

  void draw() {
    float tailTransparency = map(maxLength - length, 0, maxLength, 0, headTransparency);
    pushMatrix();
    translate(positionX + size * 0.5, positionY - size * 0.5);
    rotate(HALF_PI);
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