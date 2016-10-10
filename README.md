# Harbin Y-12B

Harbin Y-12 for FlightGear with UFO FDM as a test and development platform for Walker, WalkView and parachute jumping.

https://en.wikipedia.org/wiki/Harbin_Y-12
 
## keys:
v,sh-V and ctrl-v to choose the view
o to jump outside and get back into cabin
j to open parachute

## Y12B-pax1 (mostly depricated, use Walker-mp for multiplayer-fun! )
Y12B-pax1 is a passenger/parachute jumper that can connect to the Y12B aircraft via "dual-control" protocol.

More than one passengers can connect to the same aircraft.

"inside cabin view": use w to walk forward , control walking direction with view(hold right mouse button)  

Known issue: It uses WalkView and Walker Milestone 4 - Players can not see each other.


## Walker-mp
The multiplayer walker. Can connect to the Y12B aircraft. 

"o" toggles outside/inside cabin. set to invisible when inside cabin due to network jitter/lag

"j" to open parachute

When not falling(controlled by walk-mp.nas) then he can be moved like a UFO.
Auto-disconnects and reconnect to Y12B aircraft when toggled outside/inside 

## step by step instructions (2016-10-09)

Start the mp server:

    ./fgms -c fgms_local.skel.conf

Start the Y12B aircraft, enable the autopilot in the Y12B-set.xml file if you like.

    fgfs --aircraft=Y12B --altitude=3000 --lon=113.872558 --lat=31.12665764 --heading=90 --multiplay=out,25,SERVER-IP,5000 --multiplay=in,25,,5001 --callsign=Y-pilot

Start parachutist 1:

    fgfs --aircraft=Walker-mp --altitude=3000 --lon=113.872558 --lat=31.12665764 --heading=90 --multiplay=out,25,SERVER-IP,5000 --multiplay=in,25,,5002 --callsign=one

Start parachutist 2 (on the same PC, if you like):

    export FG_HOME=/home/user/dot-fgfs2
    
    fgfs --aircraft=Walker-mp --altitude=3000 --lon=113.872558 --lat=31.12665764 --heading=90 --multiplay=out,25,SERVER-IP,5000   --multiplay=in,25,,5003 --callsign=two


(One home folder for each running FlightGear.
see: http://wiki.flightgear.org/$FG_HOME  )


Start parachutist 3 :

    fgfs --aircraft=Walker-mp --altitude=3000 --lon=113.872558 --lat=31.12665764 --heading=90 --multiplay=out,25,SERVER-IP,5000  --multiplay=in,25,,5004 --callsign=three


If you do not like long command lines you can put all the options into the fgfsrc file, see http://wiki.flightgear.org/Fgfsrc

Parachuters usually auto-connect to the aircraft with callsign "Y-pilot". If not, then use the menu to connect.

Parachuters are not visible after loading (outside=0) you only see the yellow callsign label.

When you press "o" to jump outside they disconnect from aircraft, become visible until you press o again,
then they re-connect to the aircraft.

## Workaround for slow scenery loading
Put the .ac file and textures into the Scenery folder of the aircraft, then uncomment and edit the following line in the Walker-mp-set.xml file:

    geo.put_model("Scenery/planes_and_flat_houses_bingHD.ac",31.12676931,113.90421222,  44.3, 272.0 , 0, 0);	
    
    
Values are: (object-filename, lat, lon, elevation, heading* , 0,0);

* take the heading from the stg file and add 180 to it. If you use this workaround do not forget to remove the STATIC_OBJECT line from the stg file.
    

Parachuters(Walker-mp) use Human/Nasal/walk-mp.nas, not walk.nas! Put all your custom code into walk-mp.nas!






