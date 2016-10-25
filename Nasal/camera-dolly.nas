
#Camera dolly for Walker-mp
#moves view from fron to back of cabin
#then looks at door

var running = 0;
var light = 0;
var pilot_index = 0;
var numplay = 0;
var path = "";
var z_pos= -6.0;
var updown = 0;
var eye_height = 0.0;

print("camera-dolly.nas");
numplay = getprop("/ai/models/count");
eye_height = getprop("sim/current-view/y-offset-m");

#find id of the player with callsign == "Y-pilot"
# and save it to pilot_index
for (var i=0; i < numplay; i = i+1) {

	path = sprintf("/ai/models/multiplayer[%d]/callsign",i);
    var callsign = getprop("/ai/models/multiplayer[i]");
    if (string.icmp("Y-pilot",callsign))
    {
		#print("found:");
		#print(i);
		pilot_index = i;
    }
    
}



#var walk_forward = func(){
#	print("walk forward");
#}


var poll_yellow = func(){

	path = sprintf("/ai/models/multiplayer[%d]/sim/multiplay/generic/int[4]",pilot_index);
	light = getprop(path);
	#print (light);
	
	# walk while light is yellow and z_pos <= -2.0m
	# 0.2m per 0.1 seconds
	if (light == 2){
		
			if (z_pos <= -2.0){
				z_pos = z_pos + 0.2;
				setprop("sim/current-view/z-offset-m",z_pos);
				if (updown){
					eye_height = eye_height + 0.05;
					setprop("sim/current-view/y-offset-m",eye_height);
				}
				else{
					eye_height = eye_height - 0.05;
					setprop("sim/current-view/y-offset-m",eye_height);
				
				}
				updown= !updown;
				#print (".");
				
			}
			
	}
	# red light
	if (light==1){
		z_pos= -5.5;
		setprop("sim/current-view/z-offset-m",z_pos);
	}

	
settimer(poll_yellow, 0.1);
}



# is triggered with the update freq of the MP protocol
#setlistener("/ai/models/multiplayer[0]/sim/multiplay/generic/int[4]", move_view );

poll_yellow();



print("camera-dolly EOF");
