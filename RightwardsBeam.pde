class RightwardsBeam extends Beam {

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
