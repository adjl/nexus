private static final color[] COLOURS = {#FF0000, #00FF00, #0000FF, #FFFF00};
private static final color BACKGROUND = #232830;
private static final float BEAM_MAX_LENGTH = 25.0;
private static final int BEAM_CHANCE_OF_FIRING = 20; // 1 in 20

private NexusBeams mBeams;
private boolean mRunning;

@Override
void setup() {
    size(displayWidth, displayHeight, P2D);
    noStroke();
    mBeams = new NexusBeams();
    mRunning = true;
}

@Override
void draw() {
    background(BACKGROUND);
    if (mRunning) {
        mBeams.update();
    }
    mBeams.draw();
}

@Override
void keyPressed() {
    switch (key) {
        case 'p': // Pause/resume
            mRunning = !mRunning;
            break;
        case 'q': // Quit
            exit();
            break;
    }
}

@Override
void mousePressed() {
    mBeams.createTouchBeams(mouseX, mouseY);
}
