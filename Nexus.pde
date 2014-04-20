// Modify these as preferred:
// --------------------------
final int SCREEN_WIDTH = 1366;
final int SCREEN_HEIGHT = 768;
final int NUMBER_OF_BEAMS = 20;
// --------------------------

final color BLACK = color(0, 0, 0);
Beam[] mouseBeams = new Beam[4];
Beam[] beams;
boolean mouseBeamsActive = false;

void setup() {
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
  noStroke();
  beams = new Beam[int(random(NUMBER_OF_BEAMS)) + 1];
  for (int i = 0; i < beams.length; i++) {
    int direction = int(random(Direction.values().length));
    int distance = int(random(Distance.values().length));
    beams[i] = new Beam(Direction.values()[direction], Distance.values()[distance], millis());
  }
}

void draw() {
  background(BLACK);
  for (int i = 0; i < beams.length; i++) {
    if (beams[i].isActive()) {
      beams[i].move();
      beams[i].draw();
    } else {
      beams[i].ready(millis());
      if (beams[i].isActive()) beams[i].draw();
    }
  }
  boolean allMouseBeamsInactive = true;
  if (mouseBeamsActive) {
    for (int i = 0; i < mouseBeams.length; i++) {
      mouseBeams[i].move();
      mouseBeams[i].draw();
      if (mouseBeams[i].isActive()) allMouseBeamsInactive = false;
    }
  }
  if (allMouseBeamsInactive) mouseBeamsActive = false;
}

void keyPressed() {
  switch (key) {
    case 'q': // Quit
      exit();
      break;
  }
}

void mousePressed() {
  mouseBeamsActive = true;
  for (int i = 0; i < mouseBeams.length; i++) {
    mouseBeams[i] = new Beam(Direction.values()[i], Distance.NEAR, mouseX, mouseY);
    mouseBeams[i].draw();
  }
}