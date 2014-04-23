// Modify these as preferred:
// --------------------------
final int SCREEN_WIDTH = 1366;
final int SCREEN_HEIGHT = 768;
final int NUMBER_OF_BEAMS = 1000;
final int MAX_ACTIVATION_TIME = 10001; // 10000 inclusive
final float BEAM_TRANSPARENCY = 127.5;
// --------------------------

final color BLACK = color(0, 0, 0);
BeamGroup beams;

void setup() {
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
  noStroke();
  beams = new BeamGroup();
  beams.setup();
}

void draw() {
  background(BLACK);
  beams.draw();
}

void keyPressed() {
  switch (key) {
    case 'q': // Quit
      exit();
      break;
  }
}

void mousePressed() {
  beams.mousePressed();
}