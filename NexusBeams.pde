import java.util.List;

private class NexusBeams {

    private final List<Beam> mBeams;
    private final IntList mColours;

    NexusBeams() {
        mBeams = new ArrayList<Beam>();
        mColours = new IntList();
        for (int i = 0; i < COLOURS.length; i++) {
            mColours.append(i);
        }
    }

    void update() {
        if (int(random(BEAM_CHANCE_OF_FIRING)) == 0) {
            mBeams.add(createNewBeam());
        }
        for (int i = mBeams.size() - 1; i >= 0; i--) {
            mBeams.get(i).move();
            if (mBeams.get(i).isGone()) {
                mBeams.remove(i);
            }
        }
    }

    void draw() {
        for (Beam beam : mBeams) {
            beam.draw();
        }
    }

    void createTouchBeams(int touchX, int touchY) {
        for (Beam touchBeam : createNewTouchBeams(touchX, touchY)) {
            mBeams.add(touchBeam);
        }
    }

    private Beam createNewBeam() {
        switch (Direction.getRandomDirection()) {
            case UP:
                return new UpwardsBeam(BeamType.getRandomBeamType());
            case DOWN:
                return new DownwardsBeam(BeamType.getRandomBeamType());
            case LEFT:
                return new LeftwardsBeam(BeamType.getRandomBeamType());
            case RIGHT:
                return new RightwardsBeam(BeamType.getRandomBeamType());
            default: // Should never happen
                println("Fatal error: Returned an invalid beam direction");
                exit();
                return null;
        }
    }

    private Beam[] createNewTouchBeams(int touchX, int touchY) {
        mColours.shuffle();
        BeamType beamtype = BeamType.getRandomBeamType();
        return new Beam[] {
            new UpwardsBeam(beamtype, touchX, touchY, mColours.get(UP)),
            new DownwardsBeam(beamtype, touchX, touchY, mColours.get(DOWN)),
            new LeftwardsBeam(beamtype, touchX, touchY, mColours.get(LEFT)),
            new RightwardsBeam(beamtype, touchX, touchY, mColours.get(RIGHT))
        };
    }
}
