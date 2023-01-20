Foley_fnc_setPostProcessing = {
	params ["_t", ["_commitTime", 0]];

	"colorCorrections" ppEffectAdjust [
		(linearConversion [0, 1, 1 - _t, 0.7, 1.0, true]),
		(linearConversion [0, 1, _t, 1.0, 1.0, true]), 
		0.0,
		[
			1.0,
			1.0, 
			1.0, 
			0
		],
		[
			(linearConversion [0, 1, 1 - _t, 0.7, 1.0, true]), 
			(linearConversion [0, 1, 1 - _t, 0.7, 1.0, true]), 
			(linearConversion [0, 1, 1 - _t, 1.0, 1.0, true]), 
			(linearConversion [0, 1, 1 - _t, 0.35, 1.0, true])
		],
		[
			0.3,
			0.3,
			0.3,
			0.5
		]
	];
	"colorCorrections" ppEffectCommit _commitTime;
};

[] spawn {
	sleep 5;

	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [
		1,
		1,
		0,
		[0, 0, 0, 0],
		[1, 1, 1, 1],
		[0.299, 0.587, 0.114, 0]
	];
	"colorCorrections" ppEffectCommit 0;

	sleep 5;

	[overcast, 30] call Foley_fnc_setPostProcessing;
	sleep 30;

	while {true} do {
		[overcast, 10] call Foley_fnc_setPostProcessing;
		sleep 10;
	};
};
