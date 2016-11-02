
SIM_HZ=20
MP_HZ=20
MP_SERVER=mpserver01.flightgear.org

unset LANG

#FG_HOME=/SDB2/dot-fgfs fgfs --prop:/sim/frame-rate-throttle-hz=$SIM_HZ  --fg-aircraft=/mh/submodules/Aircraft --aircraft=Walker-mp --airport=ZHCC --timeofday=noon --fg-scenery=/mh/scenery/2.0 --multiplay=in,$MP_HZ,,5001 --multiplay=out,$MP_HZ,$MP_SERVER,5000 --callsign=p1 --altitude=5000 &

FG_HOME=/mh/dot-fgfs2  fgfs --prop:/sim/frame-rate-throttle-hz=$SIM_HZ  --fg-aircraft=/mh/submodules/Aircraft --aircraft=Walker-mp --airport=ZHCC --timeofday=noon --fg-scenery=/mh/scenery/2.0 --multiplay=in,$MP_HZ,,5002 --multiplay=out,$MP_HZ,$MP_SERVER,5000 --callsign=p2 --altitude=5003 &

#FG_HOME=/mh/dot-fgfs3  fgfs --prop:/sim/frame-rate-throttle-hz=$SIM_HZ  --fg-aircraft=/mh/submodules/Aircraft --aircraft=Walker-mp --airport=ZHCC --timeofday=noon --fg-scenery=/mh/scenery/2.0 --multiplay=in,$MP_HZ,,5003 --multiplay=out,$MP_HZ,$MP_SERVER,5000 --callsign=p3 --altitude=5006 &

#FG_HOME=/mh/dot-fgfs4  fgfs --fov=90 --disable-ai-traffic --prop:/sim/frame-rate-throttle-hz=$SIM_HZ --fg-aircraft=/mh/submodules/Aircraft --aircraft=Walker-mp  --airport=ZHCC --timeofday=noon --fg-scenery=/mh/scenery/2.0 --multiplay=in,$MP_HZ,,5004 --multiplay=out,$MP_HZ,$MP_SERVER,5000 --callsign=p4 --altitude=5009 &

