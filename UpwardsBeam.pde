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
