import java.util.Random;

enum Direction {

    UP, DOWN, LEFT, RIGHT;

    private static final Direction[] VALUES = Direction.values();
    private static final Random RANDOM = new Random();

    static Direction getRandomDirection() {
        return VALUES[RANDOM.nextInt(VALUES.length)];
    }
}
