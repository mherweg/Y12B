

# maximum speed -----------------------------------------------------------------------------------

var maxspeed = props.globals.getNode("engines/engine/speed-max-mps");
var speed = [10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000];
var current = 3;


controls.flapsDown = func(x) {
	if (!x)
		return;
	elsif (x < 0 and current > 0)
		current -= 1;
	elsif (x > 0 and current < size(speed) - 1)
		current += 1;

	var s = speed[current];
	maxspeed.setDoubleValue(s);
	gui.popupTip("Max. Speed " ~ s ~ " m/s");
}

# library stuff -----------------------------------------------------------------------------------

var ERAD = geo.ERAD;		# Earth radius (m)

var normdeg = geo.normdeg;
var npow = func(v, w) v == 0 ? 0 : math.exp(math.ln(abs(v)) * w) * (v < 0 ? -1 : 1);

#from ufo
var init_prop = func(prop, value) {
	if (prop.getValue() != nil)
		value = prop.getValue();
	prop.setDoubleValue(value);
	return value;
}

#Hover up & down from ufo
var vert_factor = 1;
var up = func(dir) {
	if (!dir)
		return vert_factor = 1;
	var alt = "position/altitude-ft";
	setprop(alt, getprop(alt) + 0.15 * vert_factor * dir);
	vert_factor += 0.25;
}

#UFO: slide left or right
var hor_factor = 1;
var leftright = func(dir) {
	if (!dir)
		return hor_factor = 1;
	var lat = getprop("position/latitude-deg");
    var lon = getprop("position/longitude-deg");
    var alt = getprop("position/altitude-ft");
    var heading = getprop("orientation/heading-deg");
  	var ep = geo.Coord.new();
	ep.set_latlon(lat, lon,alt);
	ep.apply_course_distance(heading+90, 0.15 * hor_factor * dir);
	setprop("/position/latitude-deg", ep.lat());
	setprop("/position/longitude-deg", ep.lon());
	hor_factor += 0.50;
}


# avoid going under ground
var update_main = func {
	var init_agl= -0.3;
	var gnd_elev = getprop("position/ground-elev-ft");  # ground elevation
	var altitude = getprop("position/altitude-ft");  # aircraft altitude
	if (altitude < (gnd_elev -1) ){
		altitude = gnd_elev + init_agl;
		#altitude_ft_Node.setDoubleValue(altitude);
		setprop("position/altitude-ft", altitude);
	}
	#auto gear
	var agl= altitude-gnd_elev;
	print (agl);
	if (agl > 300){
			setprop("/controls/gear/gear-down", 0);
		}	else {
			setprop("/controls/gear/gear-down", 1);
		}	
	
	
settimer(update_main, 1);
}

# is this needed ??
var prestart_main = func {
	var gnd_elev = getprop("position/ground-elev-ft");
	var altitude = getprop("position/altitude-ft");
	if ((gnd_elev == nil) or (altitude == nil)) {
		main_loop_id += 1;
		settimer(prestart_main, 0.1);
	} else {
		print ("Y-12B.nas - prestart_main");
		update_main();
	}
}

setlistener("sim/signals/fdm-initialized", func {
	
	if (getprop("sim/ai-traffic/enabled") or getprop("sim/multiplay/rxport")) {
		setprop("instrumentation/tracking/enabled", 1);
	}
	setprop("sim/atc/enabled", 0);
	setprop("sim/sound/chatter", 0);
	var t = getprop("/sim/description");
	print (t);
	prestart_main();
});

