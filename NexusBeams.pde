class NexusBeams {

  static final int NUMBER_OF_COLOURS = 4;
  static final int NUMBER_OF_DIRECTIONS = 4;

  ArrayList<Beam> beams;
  IntList colours;

  NexusBeams() {
    beams = new ArrayList<Beam>();
    colours = new IntList();
    for (int i = 0; i < NUMBER_OF_COLOURS; i++) {
      colours.append(i);
    }
  }

  void update() {
    beams.add(newBeam());
    for (int i = beams.size() - 1; i >= 0; i--) {
      beams.get(i).move();
      if (beams.get(i).isGone()) beams.remove(i);
    }
  }

  void draw() {
    for (Beam beam : beams) {
      beam.draw();
    }
  }

  void createTouchBeams(int touchX, int touchY) {
    Beam[] touchBeams = newTouchBeams(touchX, touchY);
    for (int i = 0; i < touchBeams.length; i++) {
      beams.add(touchBeams[i]);
    }
  }

  Beam newBeam() {
    Beam beam = null;
    int direction = int(random(NUMBER_OF_DIRECTIONS));
    switch (direction) {
      case 0: // Up
        beam = new UpwardsBeam(getRandomDistance());
        break;
      case 1: // Down
        beam = new DownwardsBeam(getRandomDistance());
        break;
      case 2: // Left
        beam = new LeftwardsBeam(getRandomDistance());
        break;
      case 3: // Right
        beam = new RightwardsBeam(getRandomDistance());
        break;
    }
    return beam;
  }

  Beam[] newTouchBeams(int touchX, int touchY) {
    Distance distance = getRandomDistance();
    colours.shuffle();
    return new Beam[] {
      new UpwardsBeam(distance, touchX, touchY, colours.get(0)),
      new DownwardsBeam(distance, touchX, touchY, colours.get(1)),
      new LeftwardsBeam(distance, touchX, touchY, colours.get(2)),
      new RightwardsBeam(distance, touchX, touchY, colours.get(3))
    };
  }

  Distance getRandomDistance() {
    return Distance.values()[int(random(Distance.values().length))];
  }
}