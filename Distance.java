enum Distance {

  // Modify these as preferred:
  // --------------------------
  FAR(5),
  MIDDLE(7),
  NEAR(9);
  // --------------------------

  final int distance;

  Distance(int distance) {
    this.distance = distance;
  }

  int getDistance() {
    return distance;
  }
}