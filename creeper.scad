module creeper(size=1) {
    feet(size);
}

module feet(size=1) {
    union() {
        translate([0,0,0]) foot(size);
        translate([0,2*size,0]) foot(size);
    }
}

module foot(size=1) {
    cube([2*size, size, 2*size], true);
}

creeper(size=10);