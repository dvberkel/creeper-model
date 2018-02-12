module connectors(tolerance= 0.1, base_size=10, wall_thickness=1, plate_height=1, slit_depth=1, stem_height=5, stem_radius=2, knob_height=3, knob_radius=2.5) {
    height = plate_height + stem_height + knob_height + 2*wall_thickness;
    translate([0, 0, 0]) female_connector(base_size, height, wall_thickness, stem_radius+tolerance, stem_height-tolerance);
    translate([2*base_size, 0, 0]) male_connector(base_size, plate_height, slit_depth, stem_height, stem_radius, knob_height, knob_radius);
}

module female_connector(base_size=10, height=10, wall_thickness=1, hole_radius=2, bottom_height=5) {
    translate([-base_size/2, -base_size/2, 0]) difference() {
        cube([base_size, base_size, height]);
        union(){
            well_size = base_size - 2*wall_thickness;
            translate([wall_thickness, wall_thickness, bottom_height]) cube([well_size, well_size, height - bottom_height]);
            translate([base_size/2, base_size/2, -height/2]) cylinder(2*height, r=hole_radius);
        }
    }
}

module male_connector(plate_size=10, plate_height=1, slit_depth=1, stem_height=5, stem_radius=2, knob_height=3, knob_radius=2.5){
    union () {
        translate([0, 0, 0]) plate(plate_size, plate_height);
        translate([0, 0, plate_height]) knob(slit_depth, stem_height, stem_radius, knob_height, knob_radius);
    }
}

module knob(slit_depth=1, stem_height=5, stem_radius=2, knob_height=3, knob_radius=2.5) {
    epsilon = 2;
    slit_width = 2*(max(stem_radius, knob_radius) + epsilon);
    slit_height = stem_height + knob_height + 2*epsilon;
    difference() {
        union() {
            translate([0,0,0]) cylinder(stem_height, r=stem_radius, true);
            translate([0,0,stem_height]) cylinder(knob_height, r=knob_radius, true);
        }
        translate([-slit_width/2, -slit_depth/2, -epsilon]) cube([
            slit_width, 
            slit_depth,
            slit_height
        ]);
    }
}

module plate(size=10, height=1) {
    translate([-size/2, -size/2, 0]) cube([size, size, height]);
}

for (index=[0:1:3]) {
    translate([0, 20*index, 0]) connectors(tolerance=0.1*(index + 1));
}