class LeftwardsBeam extends Beam {

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
