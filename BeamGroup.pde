class BeamGroup {

  Beam[] beams = new Beam[int(random(NUMBER_OF_BEAMS)) + 1];
  Beam[] mouseBeams = new Beam[4];
  boolean mouseBeamsActive = false;

  Class[] beamDirections = {
    UpwardsBeam.class, DownwardsBeam.class, LeftwardsBeam.class, RightwardsBeam.class
  };

  void setup() {
    for (int i = 0; i < beams.length; i++) {
      int randomDirection = int(random(beamDirections.length));
      int randomDistance = int(random(Distance.values().length));

      if (beamDirections[randomDirection] == UpwardsBeam.class) {
        beams[i] = new UpwardsBeam(Distance.values()[randomDistance], millis());
      } else if (beamDirections[randomDirection] == DownwardsBeam.class) {
        beams[i] = new DownwardsBeam(Distance.values()[randomDistance], millis());
      } else if (beamDirections[randomDirection] == LeftwardsBeam.class) {
        beams[i] = new LeftwardsBeam(Distance.values()[randomDistance], millis());
      } else if (beamDirections[randomDirection] == RightwardsBeam.class) {
        beams[i] = new RightwardsBeam(Distance.values()[randomDistance], millis());
      } else {
        println("Error: Invalid direction. Aborting...");
        exit();
      }
    }
  }

  void draw() {
    for (int i = 0; i < beams.length; i++) {
      if (beams[i].isActive()) {
        beams[i].move();
        beams[i].draw();
      } else {
        if (beams[i].canActivate(millis())) beams[i].activate();
        if (beams[i].isActive()) beams[i].draw();
      }
    }

    boolean allMouseBeamsInactive = true; // Hack for mouse press beams
    if (mouseBeamsActive) {
      for (int i = 0; i < mouseBeams.length; i++) {
        mouseBeams[i].move();
        mouseBeams[i].draw();
        if (mouseBeams[i].isActive()) allMouseBeamsInactive = false;
      }
    }
    if (allMouseBeamsInactive) mouseBeamsActive = false;
  }

  void mousePressed() {
    IntList beamColours = new IntList();
    for (int i = 0; i < mouseBeams.length; i++) {
      beamColours.append(i);
    }
    beamColours.shuffle();
    mouseBeamsActive = true;
    mouseBeams[0] = new UpwardsBeam(Distance.NEAR, mouseX, mouseY, beamColours.get(0));
    mouseBeams[1] = new DownwardsBeam(Distance.NEAR, mouseX, mouseY, beamColours.get(1));
    mouseBeams[2] = new LeftwardsBeam(Distance.NEAR, mouseX, mouseY, beamColours.get(2));
    mouseBeams[3] = new RightwardsBeam(Distance.NEAR, mouseX, mouseY, beamColours.get(3));
    mouseBeams[0].draw();
    mouseBeams[1].draw();
    mouseBeams[2].draw();
    mouseBeams[3].draw();
  }
}