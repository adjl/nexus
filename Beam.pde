private abstract class Beam {

    private final float mTerminalVelocity;
    private final float mAlpha;

    private color mColour;

    final float mSize;

    PVector mOrigin;
    PVector mPosition;
    PVector mVelocity;
    PVector mAcceleration;

    float mAngle;
    float mLength;

    Beam(BeamType beamType) {
        mTerminalVelocity = beamType.getTerminalVelocity();
        mAlpha = beamType.getAlpha();
        mSize = beamType.getSize();
        mColour = COLOURS[int(random(COLOURS.length))];
    }

    Beam(BeamType beamType, float originX, float originY, int colourId) {
        this(beamType);
        mOrigin = new PVector(originX, originY);
        mPosition = mOrigin.get();
        mColour = COLOURS[colourId];
    }

    void moveBeam() {
        mVelocity.add(mAcceleration);
        mVelocity.limit(mTerminalVelocity);
        mPosition.add(mVelocity);
    }

    void drawBeam(float positionX, float positionY) {
        float tailAlpha = map(BEAM_MAX_LENGTH - mLength, 0, BEAM_MAX_LENGTH, 0, mAlpha);
        pushMatrix();
        translate(positionX, positionY);
        rotate(mAngle);
        scale(mSize);
        beginShape(QUADS);
        fill(mColour, mAlpha); // Body
        vertex(0, 0);
        vertex(1, 0);
        fill(mColour, tailAlpha); // Tail
        vertex(1, mLength);
        vertex(0, mLength);
        fill(mColour, mAlpha * 2); // Head
        vertex(0, 0);
        vertex(1, 0);
        fill(mColour, 0);
        vertex(1, 1);
        vertex(0, 1);
        endShape(CLOSE);
        popMatrix();
    }

    abstract boolean isGone();

    abstract void move();

    abstract void draw();
}
