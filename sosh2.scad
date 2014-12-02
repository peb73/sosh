$fn=8;
use <./pieces/phone.scad>;

module dock(height){

difference(){

	polyhedron(
		points = [[35,30,0],[-35,30,0],[-35,-30,0],[35,-30,0],[35,-30,height],[-35,-30,height]],
		faces = [[0,1,2],[0,2,3],[0,3,4],[2,1,5],[0,4,5],[1,0,5],[2,5,4],[3,2,4]],
	convexity=300
	);

	//TODO adapte value
	translate([0,-12,height/2+16])
	rotate([-atan2(height,60),0,0])
	union(){ 
		color("silver")
		minkowski()
		{
			cube(size=[60,125,8], center=true);
			sphere(r=2);
		}
		color("red")
		translate([0,(125+20)/2,0])
		cube(size=[15,50,10],center=true);	
	}

	translate([0,-10,((height-10)/2)+10])
	cube(size=[50,45,height-10],center=true);
	translate([0,-6.5,5])
	cube(size=[50,38,11],center=true);
/*
	for(x=[-24:6:24]){
	for(y=[-24:6:12]){
		translate([x,y,50])
		cube(size=[4,4,100],center=true);
	}
	}
*/
}	
	//phone();	
};

dock(100);