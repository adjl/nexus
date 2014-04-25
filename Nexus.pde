// Modify these as preferred:
// --------------------------
final int SCREEN_WIDTH = 1366;
final int SCREEN_HEIGHT = 768;
final int MAX_BEAMS = 100;
final int MAX_FIRING_TIME = 20000;
final float BEAM_TRANSPARENCY = 127.5;
// --------------------------

final color BLACK = color(0, 0, 0);

NexusBeams beams;
boolean isRunning;

void setup() {
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
  noStroke();
  beams = new NexusBeams();
  isRunning = true;
}

void draw() {
  background(BLACK);
  if (isRunning) beams.update(millis());
  beams.draw(millis());
}

void keyPressed() {
  switch (key) {
    case 'p': // Pause/resume
      isRunning = !isRunning;
      break;
    case 'q': // Quit
      exit();
      break;
  }
}

void mousePressed() {
  beams.createTouchBeams(mouseX, mouseY);
}