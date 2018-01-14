module creeper(size=1) {
    head_height = 4;
    body_height = 6;
    feet_height  = 3;
    epsilon = 2;
    union() {
        head(size, head_height, body_height, feet_height, epsilon);
        body(size, head_height, body_height, feet_height, epsilon);
        feet(size, head_height, body_height, feet_height, epsilon);
    }
}

module head(size=1, head_height, body_height, feet_height, epsilon) {
    translate([0, 2*size, (body_height+(feet_height+head_height)/2)*size]) 
    cube([
        head_height*size, 
        head_height*size + epsilon, 
        head_height*size + epsilon
    ], true); 
}

module body(size=1, head_height, body_height, feet_height, epsilon) {
    translate([0, 2*size, (feet_height+body_height)/2*size]) 
    cube([
        4*size, 
        2*size + epsilon,
        body_height*size + epsilon 
    ], true);
}

module feet(size=1, head_height, body_height, feet_height, epsilon) {
    union() {
        translate([0, 0     , 0]) foot(size, feet_height, epsilon);
        translate([0, 4*size, 0]) foot(size, feet_height, epsilon);
    }
}

module foot(size=1, foot_height, epsilon) {
    cube([
        4*size, 
        2*size + epsilon, 
        foot_height*size + epsilon
    ], true);
}

creeper(size=5);