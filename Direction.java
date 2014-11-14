import java.util.Random;

enum Direction {

    UP, DOWN, LEFT, RIGHT;

    private static final Direction[] sValues = Direction.values();
    private static final Random sRandom = new Random();

    static Direction getRandomDirection() {
        return sValues[sRandom.nextInt(sValues.length)];
    }
};
