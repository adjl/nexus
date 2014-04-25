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

  void update(int currentTime) {
    int newBeams = int(random(MAX_BEAMS - beams.size()));
    for (int i = 0; i < newBeams; i++) {
      beams.add(newBeam(currentTime));
    }
    for (int i = beams.size() - 1; i >= 0; i--) {
      if (beams.get(i).isFired()) {
        beams.get(i).move();
        if (beams.get(i).isGone()) beams.remove(i);
      } else if (beams.get(i).canFire(currentTime)) {
        beams.get(i).fire();
      }
    }
  }

  void draw(int currentTime) {
    for (Beam beam : beams) {
      if (beam.isFired()) beam.draw();
    }
  }

  void createTouchBeams(int touchX, int touchY) {
    Beam[] touchBeams = newTouchBeams(touchX, touchY);
    for (int i = 0; i < touchBeams.length; i++) {
      beams.add(touchBeams[i]);
    }
  }

  Beam newBeam(int currentTime) {
    Beam beam = null;
    int direction = int(random(NUMBER_OF_DIRECTIONS));
    switch (direction) {
      case 0: // Up
        beam = new UpwardsBeam(getRandomDistance(), currentTime);
        break;
      case 1: // Down
        beam = new DownwardsBeam(getRandomDistance(), currentTime);
        break;
      case 2: // Left
        beam = new LeftwardsBeam(getRandomDistance(), currentTime);
        break;
      case 3: // Right
        beam = new RightwardsBeam(getRandomDistance(), currentTime);
        break;
    }
    return beam;
  }

  Beam[] newTouchBeams(int touchX, int touchY) {
    Distance distance = getRandomDistance();
    colours.shuffle();
    return new Beam[] {
      new UpwardsBeam(distance, mouseX, mouseY, colours.get(0)),
      new DownwardsBeam(distance, mouseX, mouseY, colours.get(1)),
      new LeftwardsBeam(distance, mouseX, mouseY, colours.get(2)),
      new RightwardsBeam(distance, mouseX, mouseY, colours.get(3))
    };
  }

  Distance getRandomDistance() {
    return Distance.values()[int(random(Distance.values().length))];
  }
}