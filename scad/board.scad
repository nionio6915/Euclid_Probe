$fn=120;
use <./threads_v2p1.scad>
difference(){
hull() {
// nose
    translate ([0,8.32,0]) cylinder (h=1.6, r=5.1, center=true);
// back corners
    translate ([5.5,-11.25,0]) cylinder (h=1.6, r=2, center=true);
    translate ([-5.5,-11.25,0]) cylinder (h=1.6, r=2, center=true);
// side fillets
    translate ([2.5,2.25,0]) cylinder (h=1.6, r=5, center=true);
    translate ([-2.5,2.25,0]) cylinder (h=1.6, r=5, center=true);
}
translate ([0,0,0]) cylinder (h=6, r=0.6, center=true);
translate ([0,5.08,0]) cylinder (h=6, r=0.6, center=true);
translate ([0,-5.08,0]) cylinder (h=6, r=0.6, center=true);
translate ([0,2.54,0]) cylinder (h=6, r=0.6, center=true);
translate ([0,10.16,0]) cylinder (h=6, r=0.6, center=true);
translate ([0,-10.16,0]) cylinder (h=6, r=0.6, center=true);
translate ([5.08,-6.33, 0]) cylinder (h=6, r=1.25, center=true);
translate ([-5.08,-6.33, 0]) cylinder (h=6, r=1.25, center=true);

// ScrewHole(outer_diam=2.0, height=5, position=[0,10.16,-3], rotation=[0,0,0], pitch=0.4, tolerance=0.4) children();
// ScrewHole(outer_diam=2.0, height=5, position=[0,-10.16,-3], rotation=[0,0,0], pitch=0.4, tolerance=0.4) children();
// ScrewHole(outer_diam=3, height=5, position=[5.08,-6.33,-3], rotation=[0,0,0], pitch=0.5, tolerance=0.4) children();
// ScrewHole(outer_diam=3, height=5, position=[-5.08,-6.33,-3], rotation=[0,0,0], pitch=0.5, tolerance=0.4) children();
}