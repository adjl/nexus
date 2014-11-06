abstract class Beam {

    PVector mOrigin;
    PVector mPosition;
    PVector mVelocity;
    PVector mAcceleration;

    float mTerminalVelocity;
    float mAngle;
    float mLength;
    float mOpacity;
    float mSize;

    color mColour;

    Beam(BeamType beamType) {
        mTerminalVelocity = beamType.getTerminalVelocity();
        mOpacity = beamType.getOpacity();
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
        float tailOpacity = map(BEAM_MAX_LENGTH - mLength, 0, BEAM_MAX_LENGTH, 0, mOpacity);
        pushMatrix();
        translate(positionX, positionY);
        rotate(mAngle);
        scale(mSize);
        beginShape(QUADS);
        fill(mColour, mOpacity); // Body
        vertex(0, 0);
        vertex(1, 0);
        fill(mColour, tailOpacity); // Tail
        vertex(1, mLength);
        vertex(0, mLength);
        fill(mColour, mOpacity * 2); // Head
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
