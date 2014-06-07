final int width = 1366;
final int height = 768;

NexusBeams beams;
boolean running;

void setup() {
  size(width, height, P2D);
  noStroke();
  beams = new NexusBeams();
  running = true;
}

void draw() {
  background(#000000);
  if (running) beams.update();
  beams.draw();
}

void keyPressed() {
  switch (key) {
    case 'p': // Pause/resume
      running = !running;
      break;
    case 'q': // Quit
      exit();
      break;
  }
}

void mousePressed() {
  beams.createTouchBeams(mouseX, mouseY);
}