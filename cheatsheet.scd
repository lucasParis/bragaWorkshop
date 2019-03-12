/* getting started */
// 1. boot server from menu (server -> boot server) or shortcut : cmd + b
//



// Basic Cheatsheet

// Oscilators
LFSaw
VarSaw
LFPulse
LFTri
SinOsc
WhiteNoise
// & and more


//language syntax
// this is a comment
"hello".postln;//print "hello"
a = "hello"//store "hello" in a variable
a.postln;



//exercice sketch
{Limiter.ar(SineShaper.ar(LFSaw.ar(-10).range(0,1).pow(100).linlin(0,1,0,200) + SinOsc.ar(40)*LFSaw.ar(40.3).range(-5,10) + ClipNoise.ar(0.3), LFSaw.ar(-00.1).range(0.2,5)))!2}.play;

//multiple lines
(
a = {
	Limiter.ar(
		SineShaper.ar(
			LFSaw.ar(-10).range(0,1).pow(100).linlin(0,1,0,200) + SinOsc.ar(40)*LFSaw.ar(40.3).range(-5,10) + ClipNoise.ar(0.3),
			LFSaw.ar(-00.1).range(0.2,5)
		)
	)!2;
}.play;
)



//OSC
OSCFunc.new(func: {arg msg; msg.postln}, path: '/my/osc/address' );
MIDIFunc.cc({arg value; value.postln}, ccNum:0, chan:0);


// Advanced cheatsheet
// Advanced cheatsheet

//oscilators
LFSaw
Saw
VarSaw
Osc
Pulse
SawDPW
SyncSaw
WaveTerrain

// dynamics/utilitites
LeakDC
Compander
Limiter
Normalizer
SelectX
Splay
LocalBuf
AmpCompA

//filters
LPF
SVF
DFM1
BBandPass
BMoog
ComplexRes
MidEQ
VocodeBand
Vocoder
Vocode
MoogLadder
LRLowCut
LRHiCut
BRF
LRHiCut
LRLowCut

//fx/sat/weird
Squiz
WaveLoss
PitchShift
FreqShift
SineShaper
InsideOut
Slope

//verbs
CheapVerb
Greyhole
JPverb
NHHall

//seq
Latch
Gate
PulseCount
Stepper
PulseDivider
ToggleFF
Sweep

//envelopes
Env.perc
Env.adsr
Env.linen
Env.pairs
Env.xyc


//Synthdef
(
SynthDef(
	\mysynth,
	{
		arg freq = 400, amp = 1, out = 0, gate = 1;
		var src, env;
		env = Env.adsr().ar(2,gate);
		src = SinOsc.ar(freq, mul:amp* env);
		Out.ar(out, src!2);
	}
).add;
)

//playing a sound
Synth.new(\mysynth)

//playing a note
(\instrument: \mysynth, \dur: 1, \legato: 0.5).play;

//with pattern
(
Pbind(
	\instrument, \mysynth,
	\dur, 1,
	\legato, 0.5
).play;
)



