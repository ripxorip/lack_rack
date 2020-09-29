$fa = 1;
$fs = 0.4;

leg_width = 51.00; // Assumes that width and length are equal
sup_length = 40.00; // This might need to be checked...
sup_height = 30.00; // This as well
sup_wall_thick = 4.00;

hole_diam = 5.00;
hole_thick = 3.00;
screw_diam = 3.00;

union() {
    /* Wedge */
    difference () {
        difference () {
            cube([sup_length, leg_width+sup_wall_thick, sup_height]);
            rotate([0, -atan(sup_height/sup_length), 0]) translate ([0, -leg_width/2, -sup_height]) cube([sup_length*2, leg_width*2, sup_height], center=false);
        }
        /* Screw hole */
        translate([0, leg_width/2.00, sup_height/2.00]) rotate([0, 90, 0]) cylinder(h=sup_length*3, r=screw_diam, center=true);
        translate([hole_thick, leg_width/2.00, sup_height/2.00]) rotate([0, 90, 0]) cylinder(h=sup_length*3, r=hole_diam);
    }

    /* Support wall */
    translate([-leg_width, leg_width, 0]) cube([leg_width, sup_wall_thick, sup_height]);
}
