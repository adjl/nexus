private class UpwardsBeam extends Beam {

    UpwardsBeam(BeamType beamType) {
        super(beamType);
        mOrigin = new PVector(int(random(width)), height - 1);
        mPosition = new PVector(mOrigin.x, mOrigin.y);
        mVelocity = new PVector(0, -beamType.getVelocity());
        mAcceleration = new PVector(0, -beamType.getAcceleration());
    }

    UpwardsBeam(BeamType beamType, float originX, float originY, int colourId) {
        super(beamType, originX, originY, colourId);
        mVelocity = new PVector(0, -beamType.getVelocity());
        mAcceleration = new PVector(0, -beamType.getAcceleration());
    }

    boolean isGone() {
        return mPosition.y + mLength * mSize < 0;
    }

    void move() {
        moveBeam();
        mLength = min((mOrigin.y - mPosition.y) / mSize + 1, BEAM_MAX_LENGTH);
    }

    void draw() {
        drawBeam(mPosition.x - mSize * 0.5, mPosition.y - mSize * 0.5);
    }
}

private class DownwardsBeam extends Beam {

    DownwardsBeam(BeamType beamType) {
        super(beamType);
        mOrigin = new PVector(int(random(width)), 0);
        mPosition = new PVector(mOrigin.x, mOrigin.y);
        mVelocity = new PVector(0, beamType.getVelocity());
        mAcceleration = new PVector(0, beamType.getAcceleration());
        mAngle = PI;
    }

    DownwardsBeam(BeamType beamType, float originX, float originY, int colourId) {
        super(beamType, originX, originY, colourId);
        mVelocity = new PVector(0, beamType.getVelocity());
        mAcceleration = new PVector(0, beamType.getAcceleration());
        mAngle = PI;
    }

    boolean isGone() {
        return mPosition.y - mLength * mSize >= height;
    }

    void move() {
        moveBeam();
        mLength = min((mPosition.y - mOrigin.y) / mSize + 1, BEAM_MAX_LENGTH);
    }

    void draw() {
        drawBeam(mPosition.x + mSize * 0.5, mPosition.y + mSize * 0.5);
    }
}

private class LeftwardsBeam extends Beam {

    LeftwardsBeam(BeamType beamType) {
        super(beamType);
        mOrigin = new PVector(width - 1, int(random(height)));
        mPosition = new PVector(mOrigin.x, mOrigin.y);
        mVelocity = new PVector(-beamType.getVelocity(), 0);
        mAcceleration = new PVector(-beamType.getAcceleration(), 0);
        mAngle = PI + HALF_PI;
    }

    LeftwardsBeam(BeamType beamType, float originX, float originY, int colourId) {
        super(beamType, originX, originY, colourId);
        mVelocity = new PVector(-beamType.getVelocity(), 0);
        mAcceleration = new PVector(-beamType.getAcceleration(), 0);
        mAngle = PI + HALF_PI;
    }

    boolean isGone() {
        return mPosition.x + mLength * mSize < 0;
    }

    void move() {
        moveBeam();
        mLength = min((mOrigin.x - mPosition.x) / mSize + 1, BEAM_MAX_LENGTH);
    }

    void draw() {
        drawBeam(mPosition.x - mSize * 0.5, mPosition.y + mSize * 0.5);
    }
}

private class RightwardsBeam extends Beam {

    RightwardsBeam(BeamType beamType) {
        super(beamType);
        mOrigin = new PVector(0, int(random(height)));
        mPosition = new PVector(mOrigin.x, mOrigin.y);
        mVelocity = new PVector(beamType.getVelocity(), 0);
        mAcceleration = new PVector(beamType.getAcceleration(), 0);
        mAngle = HALF_PI;
    }

    RightwardsBeam(BeamType beamType, float originX, float originY, int colourId) {
        super(beamType, originX, originY, colourId);
        mVelocity = new PVector(beamType.getVelocity(), 0);
        mAcceleration = new PVector(beamType.getAcceleration(), 0);
        mAngle = HALF_PI;
    }

    boolean isGone() {
        return mPosition.x - mLength * mSize >= width;
    }

    void move() {
        moveBeam();
        mLength = min((mPosition.x - mOrigin.x) / mSize + 1, BEAM_MAX_LENGTH);
    }

    void draw() {
        drawBeam(mPosition.x + mSize * 0.5, mPosition.y - mSize * 0.5);
    }
}
