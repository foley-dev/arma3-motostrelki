call compile preprocessFileLineNumbers "scripts\common\params.sqf";

if (isServer) then {
	call compile preprocessFileLineNumbers "scripts\server\tasks.sqf";
	call compile preprocessFileLineNumbers "scripts\server\ai.sqf";
	execVM "scripts\server\armbands.sqf";
	execVM "scripts\server\endings.sqf";
	execVM "scripts\server\looters.sqf";
};

if (hasInterface) then {
	waitUntil {
		!isNull player
	};

	call compile preprocessFileLineNumbers "scripts\player\briefing.sqf";
	call compile preprocessFileLineNumbers "scripts\player\loadout.sqf";
	call compile preprocessFileLineNumbers "scripts\player\postProcessing.sqf";
	execVM "scripts\player\playerMisc.sqf";
	execVM "scripts\player\eventHandlers.sqf";
};

[TOUR_respawnTickets, TOUR_respawnTime] execVM "scripts\TOUR_RC\init.sqf";

[
	{
		"surrender" call BIS_fnc_endMissionServer;
	}
] execVM "scripts\Foley_surrender.sqf";

if (!isMultiplayer) then {
	execVM "scripts\common\singleplayerSetup.sqf";
};
