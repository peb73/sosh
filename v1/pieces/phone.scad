

//phone
module phone()
{

	union(){
		color("silver") minkowski()
		{
			cube(size=[61,125,8], center=true);
			//cylinder(r=1,h=1);
			sphere(r=1,$fn=8);
		}
		
		//usb connector
		color("red")
		translate([0,62.5,0]){
			cube(size=[8,8,2],center=true);
		}
	}
};

module dock(deep){
	phone();	
};

dock(60);
