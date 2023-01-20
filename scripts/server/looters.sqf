sleep 1;

private _driver = createAgent ["rhs_msv_combatcrew", [0, 0, 0], [], 0, "NONE"];
_driver moveInDriver lootBmp;
_driver setBehaviour "SAFE";
_driver setSpeedMode "LIMITED";
_driver linkItem 'murshun_cigs_cig0';
[_driver] spawn murshun_cigs_fnc_start_cig;
_driver forceAddUniform "rhs_uniform_afghanka_winter_vsr";

private _gunner = createAgent ["rhs_msv_officer_armored", [0, 0, 0], [], 0, "NONE"];
_gunner moveInGunner lootBmp;
_gunner setBehaviour "SAFE";
_gunner setSpeedMode "LIMITED";
_gunner linkItem 'murshun_cigs_cig0';
_gunner addHeadgear "rhs_ushanka";
_gunner forceAddUniform "rhs_uniform_afghanka_winter_vsr";

[_gunner] spawn {
	params ["_gunner"];

	waitUntil {
		sleep 0.1;

		_gunner distance lootWp_6 < 10
	};

	[_gunner] spawn murshun_cigs_fnc_start_cig;
};

private _path = [
	[lootWp_1, 10],
	[lootWp_2, 10],
	[lootWp_3, 9],
	[lootWp_4, 8],
	[lootWp_5, 8],
	[lootWp_6, 6],
	[lootWp_7, 5],
	[lootWp_8, 5],
	[lootWp_9, 5],
	[lootWp_10, 1]
] apply {
	(getPos (_x select 0)) + [_x select 1]
};

lootBmp setDriveOnPath _path;
lootBmp forceFlagTexture "ca\data\flag_rus_co.paa";

[] spawn {
	sleep 15;

	private _i = 1;

	while {alive lootBmp} do {
		if (canMove lootBmp) then {
			[lootBmp, "grupa_krovi"] remoteExec ["say3D"];
			_i = _i + 1;
		};

		sleep (94 + 94 * _i);
	};
};

[] spawn {
	private _timeout = time + 60;

	waitUntil {
		sleep 1;

		time >= _timeout || lootBmp distance lootWP_10 < 10
	};

	private _crewmen = crew lootBmp;

	{
		doStop _x;
		sleep 1;
		moveOut _x;
		sleep 1;
		_x setDestination [lootDrop getPos [1 + random 2, random 360], "LEADER PLANNED", true];
		_x forceWalk true;
	} forEach _crewmen;

	lootBmp engineOn false;

	{
		_x lookAt lootBmp;
	} forEach _crewmen;

	{
		detach _x;
		_x setPos (lootDrop getPos [random 5, random 360]);
		_x setDir random 360;
		sleep 2;
	} forEach attachedObjects lootBmp;
	lootBmp forceFlagTexture "";
	
	waitUntil {
		sleep 0.1;

		selectMax (_crewmen apply {speed _x}) < 1
	};

	{
		_x lookAt lootBmp;
	} forEach _crewmen;
};
