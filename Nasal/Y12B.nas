

# maximum speed -----------------------------------------------------------------------------------

var maxspeed = props.globals.getNode("engines/engine/speed-max-mps");
var speed = [10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000];
var current = 7;


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


var init_prop = func(prop, value) {
	if (prop.getValue() != nil)
		value = prop.getValue();

	prop.setDoubleValue(value);
	return value;
}


var vert_factor = 1;
var up = func(dir) {
	if (!dir)
		return vert_factor = 1;
	var alt = "position/altitude-ft";
	setprop(alt, getprop(alt) + 0.15 * vert_factor * dir);
	vert_factor += 0.25;
}
