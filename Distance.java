enum Distance {

  // Modify these as preferred:
  // --------------------------
  FAR(2),
  MIDDLE(4),
  NEAR(8);
  // --------------------------

  final int distance;

  Distance(int distance) {
    this.distance = distance;
  }

  int getDistance() {
    return distance;
  }
}