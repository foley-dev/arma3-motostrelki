#define DOUBLES(var1,var2) var1##_##var2
#define QUOTE(var1) #var1
#define NAMESPACE Foley_surrender
#define GVAR(var1) DOUBLES(NAMESPACE,var1)
#define QGVAR(var1) QUOTE(GVAR(var1))

#define ACTION_LABEL "<t color='#FF0000'>Surrender (End Mission)</t>"
#define DROP_WEAPON_HINT "Put down your weapons first"

// Default code run after surrender (server-side)
private _defaultServerOnSurrender = {
	"EveryoneLost" call BIS_fnc_endMissionServer;  // Default Mission Failed ending
};

// Default code run after surrender (client-side)
private _defaultPlayerOnSurrender = {
	moveOut player;
	removeAllWeapons player;
	player setCaptive true;

	while {true} do {
		if (!isNil "ace_captives_fnc_setSurrendered") then {
			// Use ACE if available
			[player, true] call ace_captives_fnc_setSurrendered;
		} else {
			player action ["Surrender", player];
		};

		sleep 1;
	};
};

params [
	[
		"_serverOnSurrender",
		_defaultServerOnSurrender
	],
	[
		"_playerOnSurrender",
		_defaultPlayerOnSurrender
	]
];

if (isNil QGVAR(surrendered)) then {
	GVAR(surrendered) = false;
};

if (hasInterface) then {
	GVAR(addSurrenderAction) = {
		player addAction [
			ACTION_LABEL,
			{
				if (currentWeapon player != "") exitWith {
					hint DROP_WEAPON_HINT;
				};

				GVAR(surrendered) = true;
				publicVariable QGVAR(surrendered);
			},
			[_dropWeaponHint],
			0,
			false,
			true,
			"",
			"!" + QGVAR(surrendered) + " && rankId player >= selectMax (allPlayers apply { [0, rankId _x] select (alive _x && !(_x getVariable ['ACE_isUnconscious', false])) })",
			1,
			true
		];
	};

	call GVAR(addSurrenderAction);

	player addEventHandler [
		"respawn",
		{
			call GVAR(addSurrenderAction);
		}
	];
};

waitUntil {
	sleep 0.5;
	GVAR(surrendered)
};

if (isServer) then {
	[] spawn _serverOnSurrender;
};

if (hasInterface) then {
	[] spawn _playerOnSurrender;
};
