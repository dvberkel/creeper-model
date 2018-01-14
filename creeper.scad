module creeper(size=1) {
    foot(size);
}

module foot(size=1) {
    cube([2*size, size, 2*size], true);
}

creeper(size=10);