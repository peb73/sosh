$fn=16;
//cosPi6 = 0.866;
cosPi3 = 0.5;
fingerHeight= cosPi3*60+5;

//finger
module finger(height,radius){
	rotate(a=90,v=[0,1,0])
		minkowski(){
			intersection_for(i = [[0, -1, 0],[2, 0, 0],[-2, 0, 0],[0, 1, 0]])
				translate (i) cylinder(r=radius, h=height, center = true);
			sphere(4);
		}
}

//phone
module phone(){
	phoneHeight = 20;
	translate([0,0,phoneHeight/2])
	cube([60,128,9+phoneHeight],center=true);
};

//sosh
module sosh(){
	difference(){
		union(){
			rotate(a=-45,v=[0,0,1])
				translate([fingerHeight/2,0,0])
					finger(fingerHeight,4);
			
			rotate(a=45,v=[0,0,1])
				translate([fingerHeight/2,0,0])
					finger(fingerHeight,4);
			
			rotate(a=-90,v=[0,1,0])
				translate([fingerHeight/2,0,0])
					finger(fingerHeight,4);
		}
		
		translate([0,0,45])
			rotate(a=60,v=[0,1,0])
				translate([60/2-10,0,0])
					phone();
	}
}

sosh();