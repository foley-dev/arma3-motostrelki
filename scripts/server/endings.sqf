#define TIME_TO_LET_THINGS_SETTLE 15

if (!isServer) exitWith {};

sleep TIME_TO_LET_THINGS_SETTLE;
waitUntil {
	time > 0 && ({alive _x && faction _x != "CIV_F"} count allPlayers) > 0
};

while {true} do {
	private _anyPlayerAlive = {alive _x && faction _x != "CIV_F"} count allPlayers > 0;

	if (!_anyPlayerAlive) exitWith {
		sleep 3;
		"loser" call BIS_fnc_endMissionServer;
	};

	if ((["assault"] call BIS_fnc_taskState) == "SUCCEEDED") exitWith {
		sleep 15;
		"win" call BIS_fnc_endMissionServer;
	};

	sleep 1;
};
