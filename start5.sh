

FG_HOME=/SDB2/dot-fgfs  fgfs --fg-aircraft=/mh/submodules/Aircraft --aircraft=Walker-mp --airport=ZHCC --timeofday=noon --fg-scenery=/mh/scenery/2.0 --multiplay=in,10,,5001 --multiplay=out,10,i3,5000 --callsign=1 --altitude=5000 &

FG_HOME=/mh/dot-fgfs2 taskset -c 1 fgfs --fg-aircraft=/mh/submodules/Aircraft --aircraft=Walker-mp --airport=ZHCC --timeofday=noon --fg-scenery=/mh/scenery/2.0 --multiplay=in,10,,5002 --multiplay=out,10,i3,5000 --callsign=2 --altitude=5003 &

FG_HOME=/mh/dot-fgfs3 taskset -c 2 fgfs --fg-aircraft=/mh/submodules/Aircraft --aircraft=Walker-mp --airport=ZHCC --timeofday=noon --fg-scenery=/mh/scenery/2.0 --multiplay=in,10,,5003 --multiplay=out,10,i3,5000 --callsign=3 --altitude=5006 &

FG_HOME=/mh/dot-fgfs4              fgfs --fg-aircraft=/mh/submodules/Aircraft --aircraft=Walker-mp  --airport=ZHCC --timeofday=noon --fg-scenery=/mh/scenery/2.0 --multiplay=in,10,,5004 --multiplay=out,10,i3,5000 --callsign=4 --altitude=5009 &

