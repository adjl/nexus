final int BEAM_CHANCE_OF_FIRING = 20; // 1 in 20
final int COLOURS_COUNT = 4; // Number of colours
final float BEAM_MAX_LENGTH = 25.0;
final color[] COLOURS = {#FF0000, #00FF00, #0000FF, #FFFF00};

NexusBeams beams;
boolean running;

void setup() {
    size(displayWidth, displayHeight, P2D);
    noStroke();
    beams = new NexusBeams();
    running = true;
}

void draw() {
    background(#232830);
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
