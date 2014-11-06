class NexusBeams {

    ArrayList<Beam> mBeams;
    IntList mColours;

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
        Beam[] touchBeams = createNewTouchBeams(touchX, touchY);
        for (int i = 0; i < touchBeams.length; i++) {
            mBeams.add(touchBeams[i]);
        }
    }

    Beam createNewBeam() {
        switch (int(random(4))) { // Number of directions
            case 0: // Up
                return (Beam) new UpwardsBeam(getRandomBeamType());
            case 1: // Down
                return (Beam) new DownwardsBeam(getRandomBeamType());
            case 2: // Left
                return (Beam) new LeftwardsBeam(getRandomBeamType());
            case 3: // Right
                return (Beam) new RightwardsBeam(getRandomBeamType());
            default:
                return null;
        }
    }

    Beam[] createNewTouchBeams(int touchX, int touchY) {
        mColours.shuffle();
        BeamType beamtype = getRandomBeamType();
        return new Beam[] {
            new UpwardsBeam(beamtype, touchX, touchY, mColours.get(0)),
            new DownwardsBeam(beamtype, touchX, touchY, mColours.get(1)),
            new LeftwardsBeam(beamtype, touchX, touchY, mColours.get(2)),
            new RightwardsBeam(beamtype, touchX, touchY, mColours.get(3))
        };
    }

    BeamType getRandomBeamType() {
        return BeamType.values()[int(random(BeamType.values().length))];
    }
}
