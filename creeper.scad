module creeper(size=1) {
    union() {
        head(size);
        body(size);
        feet(size);
    }
}

module head(size=1) {
    translate([0, 2*size, (8+(3+4)/2)*size]) cube([4*size, 4*size, 4*size], true); 
}

module body(size=1) {
    translate([0, 2*size, (3+8)/2*size]) cube([4*size, 2*size, 8*size], true);
}

module feet(size=1) {
    union() {
        translate([0, 0     , 0]) foot(size);
        translate([0, 4*size, 0]) foot(size);
    }
}

module foot(size=1) {
    cube([4*size, 2*size, 3*size], true);
}

creeper(size=5);