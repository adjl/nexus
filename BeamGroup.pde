class BeamGroup {

  ArrayList<Beam> beams;
  IntList colours;

  BeamGroup() {
    beams = new ArrayList<Beam>();
    colours = new IntList();
    for (int i = 0; i < 4; i++) { // See if there is a better way to do this
      colours.append(i);
    }
  }

  void draw(int currentTime) {
    int newBeams = int(random(MAX_BEAMS - beams.size()));
    for (int i = 0; i < newBeams; i++) {
      beams.add(newBeam(currentTime));
    }
    for (Beam beam : beams) {
      if (beam.isFired()) {
        beam.move().draw();
      } else if (beam.canFire(currentTime)) {
        beam.fire().draw();
      }
    }
    for (int i = beams.size() - 1; i >= 0; i--) {
      if (beams.get(i).isGone()) beams.remove(i);
    }
  }

  void mousePressed(int mouseX, int mouseY) {
    Beam[] touchBeams = newTouchBeams(mouseX, mouseY);
    for (int i = 0; i < touchBeams.length; i++) {
      beams.add(touchBeams[i]);
    }
  }

  Beam newBeam(int currentTime) {
    Beam beam = null;
    int direction = int(random(4));
    switch (direction) {
      case 0: // Upwards beam
        beam = new UpwardsBeam(getRandomDistance(), currentTime);
        break;
      case 1: // Downwards beam
        beam = new DownwardsBeam(getRandomDistance(), currentTime);
        break;
      case 2: // Leftwards beam
        beam = new LeftwardsBeam(getRandomDistance(), currentTime);
        break;
      case 3: // Rightwards beam
        beam = new RightwardsBeam(getRandomDistance(), currentTime);
        break;
    }
    return beam;
  }

  Beam[] newTouchBeams(int mouseX, int mouseY) {
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