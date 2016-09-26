### doors 

# cabin door
var toggle_door0 = func {
	door0 = aircraft.door.new ("/controls/doors/door0",2);
	if(getprop("/controls/doors/door0/position-norm") > 0) {
		door0.close();
	} else {
		door0.open();
	}
}

# seat 5
var toggle_door1 = func {
	door1 = aircraft.door.new ("/controls/doors/door1",2);
	if(getprop("/controls/doors/door1/position-norm") > 0) {
		door1.close();
	} else {
		door1.open();
	}
}

# cockpit to cabin door
var toggle_door2 = func {
	door2 = aircraft.door.new ("/controls/doors/door2",1);
	if(getprop("/controls/doors/door2/position-norm") > 0) {
		door2.close();
	} else {
		door2.open();
	}
}

# commander right arm
var toggle_right_arm = func {
	door3 = aircraft.door.new ("/controls/doors/door3",1);
	if(getprop("/controls/doors/door3/position-norm") > 0) {
		door3.close();
	} else {
		door3.open();
	}
}

# commander left arm
var toggle_door4 = func {
	door4 = aircraft.door.new ("/controls/doors/door4",1);
	if(getprop("/controls/doors/door4/position-norm") > 0) {
		door4.close();
	} else {
		door4.open();
	}
}
