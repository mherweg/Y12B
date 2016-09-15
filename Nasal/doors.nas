### doors 

var toggle_door0 = func {
	door0 = aircraft.door.new ("/controls/doors/door0",3);
	if(getprop("/controls/doors/door0/position-norm") > 0) {
		door0.close();
	} else {
		door0.open();
	}
}

var toggle_door1 = func {
	door1 = aircraft.door.new ("/controls/doors/door1",3);
	if(getprop("/controls/doors/door1/position-norm") > 0) {
		door1.close();
	} else {
		door1.open();
	}
}
