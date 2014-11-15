private interface Beam {

    boolean isGone();

    void move();

    void draw();
}

private class BeamImpl {

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

    BeamImpl(BeamType beamType) {
        mTerminalVelocity = beamType.getTerminalVelocity();
        mAlpha = beamType.getAlpha();
        mSize = beamType.getSize();
        mColour = COLOURS[nextInt(COLOURS.length)];
    }

    BeamImpl(BeamType beamType, PVector origin, int colourId) {
        this(beamType);
        mOrigin = origin;
        mPosition = mOrigin.get();
        mColour = COLOURS[colourId];
    }

    void move() {
        mVelocity.add(mAcceleration);
        mVelocity.limit(mTerminalVelocity);
        mPosition.add(mVelocity);
    }

    void draw(float positionX, float positionY) {
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
}

private class UpwardsBeam extends BeamImpl implements Beam {

    UpwardsBeam(BeamType beamType) {
        super(beamType);
        mOrigin = new PVector(nextInt(width), height - 1);
        mPosition = mOrigin.get();
        setVectorsAndAngle(beamType);
    }

    UpwardsBeam(BeamType beamType, PVector origin, int colourId) {
        super(beamType, origin, colourId);
        setVectorsAndAngle(beamType);
    }

    private void setVectorsAndAngle(BeamType beamType) {
        mVelocity = new PVector(0, -beamType.getVelocity());
        mAcceleration = new PVector(0, -beamType.getAcceleration());
    }

    @Override
    boolean isGone() {
        return mPosition.y + mLength * mSize < 0;
    }

    @Override
    void move() {
        super.move();
        mLength = min((mOrigin.y - mPosition.y) / mSize + 1, BEAM_MAX_LENGTH);
    }

    @Override
    void draw() {
        draw(mPosition.x - mSize * 0.5, mPosition.y - mSize * 0.5);
    }
}

private class DownwardsBeam extends BeamImpl implements Beam {

    DownwardsBeam(BeamType beamType) {
        super(beamType);
        mOrigin = new PVector(nextInt(width), 0);
        mPosition = mOrigin.get();
        setVectorsAndAngle(beamType);
    }

    DownwardsBeam(BeamType beamType, PVector origin, int colourId) {
        super(beamType, origin, colourId);
        setVectorsAndAngle(beamType);
    }

    private void setVectorsAndAngle(BeamType beamType) {
        mVelocity = new PVector(0, beamType.getVelocity());
        mAcceleration = new PVector(0, beamType.getAcceleration());
        mAngle = PI;
    }

    @Override
    boolean isGone() {
        return mPosition.y - mLength * mSize >= height;
    }

    @Override
    void move() {
        super.move();
        mLength = min((mPosition.y - mOrigin.y) / mSize + 1, BEAM_MAX_LENGTH);
    }

    @Override
    void draw() {
        draw(mPosition.x + mSize * 0.5, mPosition.y + mSize * 0.5);
    }
}

private class LeftwardsBeam extends BeamImpl implements Beam {

    LeftwardsBeam(BeamType beamType) {
        super(beamType);
        mOrigin = new PVector(width - 1, nextInt(height));
        mPosition = mOrigin.get();
        setVectorsAndAngle(beamType);
    }

    LeftwardsBeam(BeamType beamType, PVector origin, int colourId) {
        super(beamType, origin, colourId);
        setVectorsAndAngle(beamType);
    }

    private void setVectorsAndAngle(BeamType beamType) {
        mVelocity = new PVector(-beamType.getVelocity(), 0);
        mAcceleration = new PVector(-beamType.getAcceleration(), 0);
        mAngle = PI + HALF_PI;
    }

    @Override
    boolean isGone() {
        return mPosition.x + mLength * mSize < 0;
    }

    @Override
    void move() {
        super.move();
        mLength = min((mOrigin.x - mPosition.x) / mSize + 1, BEAM_MAX_LENGTH);
    }

    @Override
    void draw() {
        draw(mPosition.x - mSize * 0.5, mPosition.y + mSize * 0.5);
    }
}

private class RightwardsBeam extends BeamImpl implements Beam {

    RightwardsBeam(BeamType beamType) {
        super(beamType);
        mOrigin = new PVector(0, nextInt(height));
        mPosition = mOrigin.get();
        setVectorsAndAngle(beamType);
    }

    RightwardsBeam(BeamType beamType, PVector origin, int colourId) {
        super(beamType, origin, colourId);
        setVectorsAndAngle(beamType);
    }

    private void setVectorsAndAngle(BeamType beamType) {
        mVelocity = new PVector(beamType.getVelocity(), 0);
        mAcceleration = new PVector(beamType.getAcceleration(), 0);
        mAngle = HALF_PI;
    }

    @Override
    boolean isGone() {
        return mPosition.x - mLength * mSize >= width;
    }

    @Override
    void move() {
        super.move();
        mLength = min((mPosition.x - mOrigin.x) / mSize + 1, BEAM_MAX_LENGTH);
    }

    @Override
    void draw() {
        draw(mPosition.x + mSize * 0.5, mPosition.y - mSize * 0.5);
    }
}
