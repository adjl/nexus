import java.util.Random;

enum BeamType {

    FAR(1.0f, 0.1f, 3.0f, 0.5f, 5.0f),
    MIDDLE(2.0f, 0.2f, 6.0f, 0.7f, 7.0f),
    NEAR(3.0f, 0.3f, 9.0f, 0.9f, 9.0f);

    private static final BeamType[] VALUES = BeamType.values();
    private static final Random RANDOM = new Random();
    private static final int OPAQUE = 255;

    private final float mVelocity;
    private final float mAcceleration;
    private final float mTerminalVelocity;
    private final float mAlpha;
    private final float mSize;

    BeamType(float velocity, float acceleration, float terminalVelocity, float alpha, float size) {
        mVelocity = velocity;
        mAcceleration = acceleration;
        mTerminalVelocity = terminalVelocity;
        mAlpha = alpha * OPAQUE;
        mSize = size;
    }

    static BeamType getRandomBeamType() {
        return VALUES[RANDOM.nextInt(VALUES.length)];
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

    float getAlpha() {
        return mAlpha;
    }

    float getSize() {
        return mSize;
    }
}
