#define TIME_TO_LET_THINGS_SETTLE 15

if (!isServer) exitWith {};

[
	true,
	"assault",
	[
		"Assault through the objectives and destroy all resistance you encounter.",
		"Assault through"
	],
	objNull,
	"ASSIGNED",
	10,
	false,
	"destroy"
] call BIS_fnc_taskCreate;

[
	true,
	["assault_1", "assault"],
	[
		"Secure objective 1 - <marker name='objective_area_marker_1'>Dubrovka Stables</marker>",
		"Dubrovka"
	],
	objNull,
	"CREATED",
	100,
	false,
	"move1"
] call BIS_fnc_taskCreate;

[
	true,
	["assault_2", "assault"],
	[
		"Secure objective 2 - <marker name='objective_area_marker_2'>Polana Supermarket</marker>",
		"Polana"
	],
	objNull,
	"CREATED",
	90,
	false,
	"move2"
] call BIS_fnc_taskCreate;

[
	true,
	["assault_3", "assault"],
	[
		"Secure objective 3 - <marker name='objective_area_marker_3'>Dolina Administration Center</marker>",
		"Dolina"
	],
	objNull,
	"CREATED",
	80,
	false,
	"move3"
] call BIS_fnc_taskCreate;

[
	true,
	["assault_4", "assault"],
	[
		"Secure objective 4 - <marker name='objective_area_marker_4'>Solnichniy Rail Station</marker>",
		"Solnichniy"
	],
	objNull,
	"CREATED",
	70,
	false,
	"move4"
] call BIS_fnc_taskCreate;

for "_i" from 1 to 4 do {
	[_i] spawn {
		params ["_i"];

		sleep TIME_TO_LET_THINGS_SETTLE;

		waitUntil {
			sleep 1;
			private _enemyCount = {side _x == blufor && alive _x} count (allUnits inAreaArray ("objective_area_marker_" + str _i));
			private _friendlyCount = {side _x == opfor && alive _x} count (allUnits inAreaArray ("objective_area_marker_" + str _i));

			_friendlyCount > 0 && _enemyCount <= 1
		};

		private _radio = missionNamespace getVariable ("objectiveRadio_" + str _i);

		sleep (12 + random 15);

		if (!isNil "_radio") then {
			[_radio, "grupa_krovi"] remoteExec ["say3D"];
		};

		sleep 3;

		["assault_" + str _i, "SUCCEEDED", true] call BIS_fnc_taskSetState;

		{
    		[_x, "colorOPFOR"] remoteExecCall ["setMarkerColorLocal", 0, true];
		} forEach ["objective_area_marker_" + str _i, "objective_marker_" + str _i];

		private _flag = missionNamespace getVariable ("objectiveFlag_" + str _i);

		if (!isNil "_flag") then {
			_flag setFlagTexture "ca\data\flag_rus_co.paa";
		};
	};
};

[] spawn {
	sleep TIME_TO_LET_THINGS_SETTLE;

	waitUntil {
		sleep 1;

		private _taskCount = count ("assault" call BIS_fnc_taskChildren);
		private _completedTaskCount = {[_x] call BIS_fnc_taskState == "SUCCEEDED"} count ("assault" call BIS_fnc_taskChildren);
		
		_taskCount == _completedTaskCount
	};

	sleep 5;

	["assault", "SUCCEEDED", true] call BIS_fnc_taskSetState;
};
