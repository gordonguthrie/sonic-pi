(
SynthDef("hihat", {arg out = 0, amp = 0.5, att = 0.01, rel = 0.2, ffreq = 6000, pan = 0, out_bus = 0;
	var snd = WhiteNoise.ar(amp);
	var env = Env.perc(att, rel).kr(doneAction: 2);
	snd = HPF.ar(snd * env, ffreq);
	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "https://raw.githubusercontent.com/everythingwillbetakenaway/Synthdefs/master/drumkit1.scd",
	category: \kick
)
).writeDefFile("/Users/gordonguthrie/.synthdefs"))
