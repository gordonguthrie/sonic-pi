SynthDef("sc_kick", {arg out = 0, amp = 0.3, sinfreq = 70, glissf = 0.9, att = 0.01, rel = 0.45, pan = 0, out_bus = 0;
	var gliss = XLine.kr(sinfreq, sinfreq*glissf, rel);
	var snd = SinOsc.ar(gliss);
	var env = EnvGen.kr(Env.perc(att, rel), doneAction: 2);
	snd = snd * env * amp;
	snd = Limiter.ar(snd,1,0.001);
	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "https://raw.githubusercontent.com/everythingwillbetakenaway/Synthdefs/master/drumkit1.scd",
	category: \kick
)
).writeDefFile("/Users/gordonguthrie/.synthdefs");