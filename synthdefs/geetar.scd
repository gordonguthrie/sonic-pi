(SynthDef(\surfbass, {
	arg
	//Standard Values
	out = 0, pan = 0, amp = 0.1, note = 48, rel = 4, crv = -3, dur = 8,
	// String and Plucking Hand Controls
	coef = 0.75, openStringFreq = 110, pickPos = 0.5, muteSus = 0.5,
	// Pickup Controls
	pickupPos = 0.17, pickupResfreq = 8000, pickupResrq = 0.5, pickupHPF = 250, pickupHPFrq = 0.8,
	// Distortion Controls
	preDistHPF = 600, postDistLPF = 2000, gain = 75, out_bus = 0;

	var mute, snd, delays, reverbs, freq;

	// convert values
	freq = note.midicps;
	
	// The Pick
	snd = Hasher.ar(Sweep.ar(Impulse.ar(0)));
	snd = snd - DelayN.ar(
		in: snd,
		maxdelaytime: pickPos.clip(0, 1)/freq,
		delaytime: pickPos.clip(0, 1)/freq);

	// The String
	snd = Pluck.ar(
		in: snd,
		trig: Impulse.ar(0),
		maxdelaytime: 1/freq,
		delaytime: 1/freq,
		decaytime: rel,
		coef: coef.clip(-1, 1));
	snd = LeakDC.ar(snd);

	// An Envelope for Muting the String
	mute = Env.new(
		levels: [1, 1, 0, 0],
		times: [muteSus, 0.075, 0.025]).ar(doneAction: 2);

	// Mute the String
	snd = snd * mute;
	snd = HPF.ar(
		in: snd,
		freq: LinExp.ar(
			in: mute,
			srclo: 0, srchi: 1,
			dstlo: 100, dsthi: 20));
	snd = LPF.ar(
		in: snd,
		freq: LinExp.ar(
			in: mute,
			srclo: 0, srchi: 1,
			dstlo: 20, dsthi: 10000));

	// The Pickup
	snd = snd - DelayN.ar(
		in: snd,
		maxdelaytime: pickupPos.clip(0, 1)/openStringFreq,
		delaytime: pickupPos.clip(0, 1)/openStringFreq);
	snd = RHPF.ar(
		in: snd,
		freq: pickupHPF,
		rq: pickupHPFrq);
	snd = BLowPass4.ar(
		in: snd,
		freq: pickupResfreq,
		rq: pickupResrq);

	snd = LeakDC.ar(snd);

	// The Distortion
	snd = HPF.ar(
		in: snd,
		freq: preDistHPF);
	snd = snd * gain;
	snd = snd.tanh;
	snd = LPF.ar(
		in: snd,
		freq: postDistLPF);

	// Output Stuff
	snd = snd * amp;
	snd = Limiter.ar(snd);
	
	delays = DelayN.ar(snd, 0.02);
    // 7 length modulated comb delays in parallel :
	reverbs = Mix.ar(Array.fill(7,{ CombL.ar(delays, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 15) }));
    // two parallel chains of 4 allpass delays (8 total) :
	4.do({ reverbs = AllpassN.ar(reverbs, 0.050, [0.050.rand, 0.050.rand], 1) });
    // add original sound to reverb and play it :
	snd+(0.2*reverbs);

	Out.ar(out, Pan2.ar(snd)) * Line.kr(dur: dur, doneAction: 2);
},
metadata: (
	credit: "Josh Mitchell",
	category: \guitar,
	tags: [\pitched]
)).writeDefFile("/Users/gordonguthrie/.synthdefs");)
