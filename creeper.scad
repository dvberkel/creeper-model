module creeper(size=1) {
    head_height = 4;
    body_height = 8;
    feet_height  = 3;
    union() {
        head(size, head_height, body_height, feet_height);
        body(size, body_height, feet_height);
        feet(size, feet_height);
    }
}

module head(size=1, head_height, body_height, feet_height) {
    translate([0, 2*size, (body_height+(feet_height+head_height)/2)*size]) cube([head_height*size, head_height*size, head_height*size], true); 
}

module body(size=1, body_height, feet_height) {
    translate([0, 2*size, (feet_height+body_height)/2*size]) cube([4*size, 2*size, body_height*size], true);
}

module feet(size=1, feet_height) {
    union() {
        translate([0, 0     , 0]) foot(size, feet_height);
        translate([0, 4*size, 0]) foot(size, feet_height);
    }
}

module foot(size=1, foot_height) {
    cube([4*size, 2*size, foot_height*size], true);
}

creeper(size=5);