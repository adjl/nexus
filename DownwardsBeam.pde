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
