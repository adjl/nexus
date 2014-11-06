final color[] COLOURS = {#FF0000, #00FF00, #0000FF, #FFFF00};
final color BACKGROUND = #232830;
final float BEAM_MAX_LENGTH = 25.0;
final int BEAM_CHANCE_OF_FIRING = 20; // 1 in 20

NexusBeams beams;
boolean running;

void setup() {
    size(displayWidth, displayHeight, P2D);
    noStroke();
    beams = new NexusBeams();
    running = true;
}

void draw() {
    background(BACKGROUND);
    if (running) {
        beams.update();
    }
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
