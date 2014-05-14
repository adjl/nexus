final int width = 1366;
final int height = 768;
final color black = color(0, 0, 0);

NexusBeams beams;
boolean isRunning;

void setup() {
  size(width, height, P2D);
  noStroke();
  beams = new NexusBeams();
  isRunning = true;
}

void draw() {
  background(black);
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