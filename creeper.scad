module creeper(size=1) {
    union() {
        head(size);
        body(size);
        feet(size);
    }
}

module head(size=1) {
    translate([0, size, 6*size]) cube([2*size, 2*size, 2*size], true); 
}

module body(size=1) {
    translate([0, size, 3*size]) cube([2*size, size, 4*size], true);
}

module feet(size=1) {
    union() {
        translate([0, 0     , 0]) foot(size);
        translate([0, 2*size, 0]) foot(size);
    }
}

module foot(size=1) {
    cube([2*size, size, 2*size], true);
}

creeper(size=10);