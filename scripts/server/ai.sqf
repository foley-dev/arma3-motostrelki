private _groupsInObjectives = 8 * (Foley_param_regularInfantryMultiplier / 100);
private _groupsInCamps = 6 * (Foley_param_regularInfantryMultiplier / 100);
private _vehicleGroups = 6 * (Foley_param_vehiclesMultiplier / 100);
private _volunteerGroups = 4 * (Foley_param_volunteersMultiplier / 100);

Foley_fnc_deployCamp = {
	params ["_group", "_center", "_area"];

	if (isNil "lambs_wp_fnc_taskCamp") exitWith {};

	[_group, _center, 0, _area, true, false] call lambs_wp_fnc_taskCamp;
};

Foley_fnc_deployToBuildings = {
	params ["_group", "_center", "_area", ["_exitTrigger", -2]];
	
	if (isNil "lambs_wp_fnc_taskGarrison") exitWith {};

	private _range = (_area select 0) max (_area select 1);

	[_group, _center, _range, _area, true, false, _exitTrigger, false] call lambs_wp_fnc_taskGarrison;
};

Foley_fnc_deployPatrol = {
	params ["_group", "_center", "_area"];

	if (isNil "lambs_wp_fnc_taskPatrol") exitWith {};

	private _range = (_area select 0) max (_area select 1);

	[_group, _center, _range, 4, _area, true, true] call lambs_wp_fnc_taskPatrol;
};

private _hqGroups = [Foley_hqGroup1, Foley_hqGroup2, Foley_hqGroup3, Foley_hqGroup4];
private _objectives = ((entities "Logic") select {_x getVariable ["Foley_objective", false]}) apply {synchronizedObjects _x};
private _campAreas = synchronizedObjects Foley_camps;

{
	[_x, getPos leader _x, [10, 10, 0, false, 10]] call Foley_fnc_deployCamp;
} forEach _hqGroups;

private _objectiveAreas = [];

{
	_objectiveAreas = _objectiveAreas + _x;
} forEach _objectives;

_objectiveAreas = _objectiveAreas call BIS_fnc_arrayShuffle;

private _coreObjectiveAreas = [];

{
	private _sorted = [synchronizedObjects _x, [_x], {_input0 distance _x}, "ASCEND"] call BIS_fnc_sortBy;
	_coreObjectiveAreas pushBackUnique (_sorted select 0);
} forEach ((entities "Logic") select {_x getVariable ["Foley_objective", false]});

obj = _coreObjectiveAreas;

_objectiveAreas = _coreObjectiveAreas + (_objectiveAreas - _coreObjectiveAreas);

for "_i" from 0 to _groupsInObjectives - 1 do {
	private _area = _objectiveAreas select (_i % count _objectiveAreas);
    private _group = [
		getPos _area,
		blufor,
		[
			"rhsgref_cdf_b_reg_squadleader",
			"rhsgref_cdf_b_reg_machinegunner",
			"rhsgref_cdf_b_reg_grenadier_rpg",
			"rhsgref_cdf_b_reg_grenadier",
			"rhsgref_cdf_b_reg_rifleman_rpg75",
			"rhsgref_cdf_b_reg_arifleman_rpk",
			"rhsgref_cdf_b_reg_rifleman",
			"rhsgref_cdf_b_reg_rifleman_rpg75",
			"rhsgref_cdf_b_reg_rifleman",
			"rhsgref_cdf_b_reg_medic"
		]
	] call BIS_fnc_spawnGroup;

	[_group, _area] spawn {
		params ["_group", "_area"];
		
		sleep 1 + random 5;
		
		_group setCombatMode "RED";

		private _fnc = selectRandomWeighted [
			Foley_fnc_deployToBuildings,
			85,
			Foley_fnc_deployPatrol,
			15
		];

		[_group, getPos _area, triggerArea _area] call _fnc;

		_group setBehaviour "AWARE";
		sleep 1;
		_group setBehaviour "SAFE";
	};
};

for "_i" from _groupsInObjectives to _groupsInObjectives + _volunteerGroups do {
	private _area = _objectiveAreas select (_i % count _objectiveAreas);
    private _group = [
		getPos _area,
		blufor,
		[
			"UK3CB_CCM_B_AT",
			"UK3CB_CCM_B_DEM",
			"UK3CB_CCM_B_MK"
		]
	] call BIS_fnc_spawnGroup;

	[_group, _area] spawn {
		params ["_group", "_area"];
		
		sleep 1 + random 5;

		[_group, getPos _area, triggerArea _area, -1] call Foley_fnc_deployToBuildings;

		_group setBehaviour "AWARE";
		sleep 1;
		_group setBehaviour "SAFE";
	};
};

_campAreas = _campAreas call BIS_fnc_arrayShuffle;

for "_i" from 1 to _groupsInCamps do {
	private _area = _campAreas select _i;
    private _group = [
		getPos _area,
		blufor,
		[
			"rhsgref_cdf_b_reg_squadleader",
			"rhsgref_cdf_b_reg_machinegunner",
			"rhsgref_cdf_b_reg_grenadier_rpg",
			"rhsgref_cdf_b_reg_grenadier",
			"rhsgref_cdf_b_reg_rifleman_rpg75",
			"rhsgref_cdf_b_reg_machinegunner",
			"rhsgref_cdf_b_reg_grenadier_rpg",
			"rhsgref_cdf_b_reg_rifleman",
			"rhsgref_cdf_b_reg_rifleman",
			"rhsgref_cdf_b_reg_medic"
		]
	] call BIS_fnc_spawnGroup;
	_group setVariable ["lambs_danger_enableGroupReinforce", true, true];

	[_group, _area] spawn {
		params ["_group", "_area"];
		
		sleep 1 + random 5;

		{
			_x doFollow leader _group;
		} forEach units _group;

		_group setCombatMode "RED";

		private _fnc = selectRandomWeighted [
			Foley_fnc_deployCamp,
			10,
			Foley_fnc_deployPatrol,
			90
		];

		[_group, getPos _area, triggerArea _area] call _fnc;

		_group setBehaviour "AWARE";
		sleep 1;
		_group setBehaviour "SAFE";
	};
};

private _vehicleSpawnpoints = (entities "Logic") select {_x getVariable ["Foley_staticPosition", false]};
_vehicleSpawnpoints = _vehicleSpawnpoints apply {[getPos _x, getDir _x]};
_vehicleSpawnpoints = _vehicleSpawnpoints call BIS_fnc_arrayShuffle;

private _vehicleDefinitions = [
	[
		"rhsgref_cdf_b_t80bv_tv"
	],
	5,
	[
		"UK3CB_B_T55_CDF"
	],
	10,
	[
		"rhsgref_cdf_b_bmd2k"
	],
	10,
	[
		"rhsgref_cdf_b_bmp1"
	],
	15,
	[
		"rhsgref_cdf_b_btr70"
	],
	15,
	[
		"rhsgref_BRDM2_b"
	],
	15,
	[
		"rhsgref_cdf_b_reg_uaz_spg9"
	],
	10,
	[
		"rhsgref_cdf_b_reg_uaz_ags"
	],
	10,
	[
		"rhsgref_cdf_b_reg_uaz_dshkm"
	],
	10
];

for "_i" from 1 to _vehicleGroups do {
	(_vehicleSpawnpoints select _i) params ["_pos", "_dir"];
	private _adjustedPos = _pos findEmptyPosition [0, 5, "rhsgref_cdf_b_t72ba_tv"];

	if (_adjustedPos isEqualTo []) then {
		_adjustedPos = _pos findEmptyPosition [0, 25, "rhsgref_cdf_b_t72ba_tv"];
	};

    private _group = [
		_adjustedPos,
		blufor,
		selectRandomWeighted _vehicleDefinitions
	] call BIS_fnc_spawnGroup;
	
	private _vic = vehicle leader _group;
	_vic setPos _adjustedPos;
	_vic setDir _dir;
	clearMagazineCargoGlobal _vic;
	clearWeaponCargoGlobal _vic;
	clearItemCargoGlobal _vic;

	_group setVariable ["lambs_danger_enableGroupReinforce", true, true];
	_group setCombatMode "RED";
	_group setBehaviour selectRandomWeighted ["SAFE", 30, "AWARE", 70];
};

Foley_fnc_nearestPosition = {
	params ["_pos", "_positions"];

	if (count _positions == 0) exitWith {
		nil
	};

	private _distances = _positions apply {_pos distance _x};
	private _index = _distances find (selectMin _distances);

	_positions select _index
};

private _farmers = [Foley_tractorman_1, Foley_tractorman_2, Foley_tractorman_3];
private _farmerOverwatchPoints = _vehicleSpawnpoints select [_vehicleGroups + 2, count _vehicleSpawnpoints];
_farmerOverwatchPoints = _farmerOverwatchPoints apply {_x select 0};

{
	private _farmer = _x;

	_farmer setVariable ["Foley_targetVehicle", objNull];

	// Target assignment
	[_farmer, _farmerOverwatchPoints] spawn {
		params ["_farmer", "_farmerOverwatchPoints"];

		private _targets = [];

		waitUntil {
			sleep (10 + random 10);

			_targets = vehicles select {
				(faction _x) isEqualTo "rhs_faction_vmf" &&
				!alive (_x getVariable ["Foley_assignedFarmer", objNull]) && 
				(getPos _x) distance (
					[getPos _x, _farmerOverwatchPoints] call Foley_fnc_nearestPosition
				) < 500
			};

			count _targets > 0
		};

		private _target = selectRandom _targets;

		_target setVariable ["Foley_assignedFarmer", _farmer];
		_farmer setVariable ["Foley_targetVehicle", _target];
	};

	// Target following
	[_farmer, _farmerOverwatchPoints] spawn {
		params ["_farmer", "_farmerOverwatchPoints"];
		
		private _target = objNull;

		waitUntil {
			sleep 1;

			_target = _farmer getVariable ["Foley_targetVehicle", objNull];

			!isNull _target
		};

		while {alive _farmer} do {
			private _wpPos = getPos _farmer;

			if (alive _target && canMove _target && fuel _target > 0) then {
				// Stalk
				private _overwatch = [
					getPos _target,
					_farmerOverwatchPoints select {
						private _candidatePoint = _x;

						{_x != vehicle _farmer} count (_candidatePoint nearObjects ["UK3CB_C_Tractor", 50]) == 0 &&
						{_x distance _candidatePoint < 200} count allPlayers == 0
					}
				] call Foley_fnc_nearestPosition;

				if (!isNil "_overwatch") then {
					_wpPos = _overwatch getPos [0.1 * (_overwatch distance _target), _overwatch getDir _target];
				};
			} else {
				// Approach
				_wpPos = _target getPos [5 + random 15, random 360];
			};
			
			(group _farmer) move _wpPos;
			_farmer lookAt _target;

			sleep 30;
		};
	};

	// Behaviour
	[_farmer] spawn {
		params ["_farmer"];

		_farmer setBehaviour "CARELESS";
		_farmer setCombatBehaviour "CARELESS";

		waitUntil {
			vehicle _farmer == _farmer || !alive _farmer
		};

		_farmer setBehaviour "COMBAT";
		_farmer setCombatBehaviour "COMBAT";
		_farmer setCombatMode "RED";
	};
} forEach _farmers;

// Reinforce objectives

for "_i" from 1 to 4 do {

	[_i] spawn {
		params ["_i"];

		private _areaMarker = "objective_area_marker_" + str _i;

		waitUntil {
			sleep 1;

			["assault_" + str _i] call BIS_fnc_taskState == "SUCCEEDED"
		};

		private _pool = missionNamespace getVariable ("Foley_reinforcementPool_" + str _i);
		private _reinforcements = allGroups select {
			side _x == blufor &&
			(leader _x) inArea _pool &&
			!((leader _x) inArea _areaMarker)
		};
		
		_reinforcements = _reinforcements apply {
			sleep 1;

			if (vehicle leader _x == leader _x) then {
				[_x] call lambs_wp_fnc_taskReset
			} else {
				_x
			};
		};

		sleep 5;

		{
			sleep 5;
			(leader _x) doFollow (leader _x);
			private _wp = _x addWaypoint [getPos leader _x, 10];
			_wp setWaypointType "MOVE";

			private _wp = _x addWaypoint [_areaMarker call BIS_fnc_randomPosTrigger, 0];
			_wp setWaypointType "SENTRY";
			_wp setWaypointCombatMode "RED";
			_wp setWaypointBehaviour "AWARE";
			_wp setWaypointSpeed "NORMAL";
		} forEach _reinforcements;

		sleep 5;

		{
			sleep 5;
			_x setVariable ["lambs_danger_enableGroupReinforce", true, true];
		} forEach _reinforcements;
	};
};
