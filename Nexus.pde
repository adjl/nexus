final int SCREEN_WIDTH = 1366;
final int SCREEN_HEIGHT = 768;

final color BLACK = color(0, 0, 0);

NexusBeams beams;
boolean isRunning;

void setup() {
  size(SCREEN_WIDTH, SCREEN_HEIGHT, P2D);
  noStroke();
  beams = new NexusBeams();
  isRunning = true;
}

void draw() {
  background(BLACK);
  if (isRunning) beams.update();
  beams.draw();
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