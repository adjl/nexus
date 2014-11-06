enum BeamType {

    FAR(1.0f, 0.1f, 3.0f, 0.5f, 5.0f),
    MIDDLE(2.0f, 0.2f, 6.0f, 0.7f, 7.0f),
    NEAR(3.0f, 0.3f, 9.0f, 0.9f, 9.0f);

    final float mVelocity;
    final float mAcceleration;
    final float mTerminalVelocity;
    final float mOpacity;
    final float mSize;

    BeamType(float velocity, float acceleration, float terminalVelocity,
             float opacity, float size) {
        mVelocity = velocity;
        mAcceleration = acceleration;
        mTerminalVelocity = terminalVelocity;
        mOpacity = opacity * 255;
        mSize = size;
    }

    float getVelocity() {
        return mVelocity;
    }

    float getAcceleration() {
        return mAcceleration;
    }

    float getTerminalVelocity() {
        return mTerminalVelocity;
    }

    float getOpacity() {
        return mOpacity;
    }

    float getSize() {
        return mSize;
    }
}
