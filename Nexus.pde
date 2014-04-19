// Modify these as preferred:
// --------------------------
final int SCREEN_WIDTH = 1366;
final int SCREEN_HEIGHT = 768;
// --------------------------


final color BLACK = color(0, 0, 0);

Beam[] beams;


void setup() {
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
  noStroke();

  beams = new Beam[int(random(100))]; // Debugging
  for (int i = 0; i < beams.length; i++) {
    int randomDirection = int(random(Direction.values().length));
    int randomDistance = int(random(Distance.values().length));
    beams[i] = new Beam(Direction.values()[randomDirection], Distance.values()[randomDistance]);
  }
}

void draw() {
  background(BLACK);

  boolean allInactive = true; // Debugging
  for (int i = 0; i < beams.length; i++) {
    if (beams[i].isActive()) {
      allInactive = false;
      break;
    }
  }
  if (allInactive) exit();

  for (int i = 0; i < beams.length; i++) {
    beams[i].move();
    beams[i].draw();
  }
}

void keyPressed() {
  switch (key) {
    case 'q': // Quit
      exit();
      break;
  }
}