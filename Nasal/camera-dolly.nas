
#Camera dolly for Walker-mp
#moves view from fron to back of cabin

var running = 0;
var light = 0;
var pilot_index = 0;
var numplay = 0;
var path = "";
var z_pos= -6.0;
var updown = 0;
var eye_height = 0.0;

print("camera-dolly.nas");

eye_height = getprop("sim/current-view/y-offset-m");

#find id of the player with callsign == "Y-pilot"
# and save it to pilot_index
var find_pilot = func(){

	numplay = getprop("/ai/models/num-players");
	printf("/ai/models/count=%d",numplay);

	for (var i=0; i < numplay; i = i+1) {

		path = sprintf("/ai/models/multiplayer[%d]/callsign",i);
		var callsign = getprop(path);
		#print (callsign);
		result = string.icmp("Y-pilot",callsign);
		#print(result);
		if (result == 0)		{
			printf("found Y-pilot:%d",i);
			pilot_index = i;
		}
		
	}

	if ((pilot_index >=0) and(running==0)){
		poll_yellow();
		}
	#else{
		# this will only happen when pilot_index is initialized with -1
	#	print ("Y-pilot not found");
	#}
}


# wait for changes of num-players
setlistener("/ai/models/num-players",find_pilot, 1);

var poll_yellow = func(){
	running=1;
	path = sprintf("/ai/models/multiplayer[%d]/sim/multiplay/generic/int[4]",pilot_index);
	light = getprop(path);
	#printf ("pilot_index=%d",pilot_index);
	
	# walk while light is yellow and z_pos <= -2.0m
	# 0.2m per 0.1 seconds
	if (light == 2){
		
			if (z_pos <= -2.0){
				z_pos = z_pos + 0.2;
				setprop("sim/current-view/z-offset-m",z_pos);
				if (updown){
					eye_height = eye_height + 0.02;
					setprop("sim/current-view/y-offset-m",eye_height);
				}
				else{
					eye_height = eye_height - 0.02;
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




#print("camera-dolly EOF");
