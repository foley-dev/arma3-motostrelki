params [["_unit", player]];

private _loadouts = createHashMapFromArray [
	[
		"rhs_vmf_flora_sergeant",
		[["rhs_weap_ak74m_gp25","rhs_acc_dtk","","",["rhs_30Rnd_545x39_7N10_AK",30],["rhs_VOG25",1],""],[],["rhs_weap_makarov_pm","","","",["rhs_mag_9x18_8_57N181S",8],[],""],["rhs_uniform_flora_patchless",[["ACE_fieldDressing",5],["ACE_morphine",1],["ACE_tourniquet",2],["ACE_EarPlugs",1],["ACRE_PRC343",1],["ACRE_PRC148",1],["UK3CB_H_Beanie_02_BLK", 1],["murshun_cigs_lighter",1,100],["murshun_cigs_cigpack",1,20]]],["rhs_6b23_6sh92_vog_headset",[["ACE_EntrenchingTool",1],["rhs_30Rnd_545x39_7N10_AK",6,30],["rhs_mag_rgd5",1,1],["rhs_mag_rdg2_white",1,1],["rhs_mag_9x18_8_57N181S",1,8],["rhs_VOG25",4,1],["rhs_GRD40_Red",2,1]]],[],"rhs_6b7_1m_flora","rhs_balaclava1_olive",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]]
	],
	[
		"rhs_vmf_flora_efreitor",
		[["rhs_weap_ak74m_gp25","rhs_acc_dtk","","",["rhs_30Rnd_545x39_7N10_AK",30],["rhs_VOG25",1],""],[],["rhs_weap_makarov_pm","","","",["rhs_mag_9x18_8_57N181S",8],[],""],["rhs_uniform_flora_patchless",[["ACE_fieldDressing",5],["ACE_morphine",1],["ACE_tourniquet",2],["ACRE_PRC343",1],["ACE_EarPlugs",1],["UK3CB_H_Beanie_02_BLK", 1],["murshun_cigs_matches",1,10],["murshun_cigs_cigpack",1,15]]],["rhs_6b23_6sh92_vog",[["ACE_EntrenchingTool",1],["rhs_mag_rgd5",1,1],["rhs_mag_rdg2_white",2,1],["rhs_30Rnd_545x39_7N10_AK",5,30],["rhs_VOG25",5,1],["rhs_GRD40_Red",2,1]]],[],"rhs_6b7_1m_flora","rhs_balaclava1_olive",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]]
	],
	[
		"rhs_vmf_flora_arifleman_rpk",
		[["rhs_weap_rpk74m","rhs_acc_dtk","","",["rhs_45Rnd_545X39_7N10_AK",45],[],""],[],[],["rhs_uniform_flora_patchless",[["ACE_fieldDressing",5],["ACE_morphine",1],["ACE_tourniquet",2],["ACRE_PRC343",1],["ACE_EarPlugs",1],["UK3CB_H_Beanie_02_BLK", 1],["murshun_cigs_matches",1,5],["murshun_cigs_cigpack",1,4]]],["rhs_6b23_6sh92",[["ACE_EntrenchingTool",1],["rhs_mag_rdg2_white",1,1],["rhs_45Rnd_545X39_7N10_AK",5,45]]],["rhs_rk_sht_30_emr",[["rhs_45Rnd_545X39_7N10_AK",5,45],["ACE_SpareBarrel",1,1]]],"rhs_6b7_1m_flora","rhs_balaclava1_olive",[],["ItemMap","","","ItemCompass","ItemWatch",""]]
	],
	[
		"rhs_vmf_flora_grenadier_rpg",
		[["rhs_weap_ak74m_pkas","rhs_acc_dtk","","",["rhs_30Rnd_545x39_7N10_AK",30],[],""],["rhs_weap_rpg7","","","rhs_acc_pgo7v",["rhs_rpg7_PG7VL_mag",1],[],""],[],["rhs_uniform_flora_patchless",[["ACE_fieldDressing",5],["ACE_morphine",1],["ACE_tourniquet",2],["ACE_EarPlugs",2],["ACRE_PRC343",1],["UK3CB_H_Beanie_02_BLK", 1],["murshun_cigs_matches",1,5],["murshun_cigs_cigpack",1,4]]],["rhs_6b23_6sh92",[["ACE_EntrenchingTool",1],["rhs_30Rnd_545x39_7N10_AK",6,30],["rhs_mag_rgd5",1,1],["rhs_mag_rdg2_white",1,1]]],["rhs_rpg_empty",[["rhs_rpg7_PG7VL_mag",1,1],["rhs_rpg7_OG7V_mag",1,1]]],"rhs_6b7_1m_flora","rhs_balaclava1_olive",[],["ItemMap","","","ItemCompass","ItemWatch",""]]
	],
	[
		"rhs_vmf_flora_strelok_rpg_assist",
		[["rhs_weap_ak74m_pkas","rhs_acc_dtk","","",["rhs_30Rnd_545x39_7N10_AK",30],[],""],[],[],["rhs_uniform_flora_patchless",[["ACE_fieldDressing",5],["ACE_morphine",1],["ACE_tourniquet",2],["ACRE_PRC343",1],["ACE_EarPlugs",1],["UK3CB_H_Beanie_02_BLK", 1],["murshun_cigs_matches",1,5],["murshun_cigs_cigpack",1,4]]],["rhs_6b23_6sh92",[["ACE_EntrenchingTool",1],["rhs_30Rnd_545x39_7N10_AK",7,30],["rhs_mag_rgd5",1,1],["rhs_mag_rdg2_white",1,1]]],["rhs_rpg_empty",[["rhs_rpg7_OG7V_mag",1,1],["rhs_rpg7_PG7VR_mag",1,1]]],"rhs_6b7_1m_flora","rhs_balaclava1_olive",[],["ItemMap","","","ItemCompass","ItemWatch",""]]
	],
	[
		"rhs_vmf_flora_rifleman",
		[["rhs_weap_ak74m_pkas","rhs_acc_dtk","","",["rhs_30Rnd_545x39_7N10_AK",30],[],""],[],[],["rhs_uniform_flora_patchless",[["ACE_fieldDressing",5],["ACE_morphine",1],["ACE_tourniquet",2],["ACRE_PRC343",1],["ACE_EarPlugs",1],["UK3CB_H_Beanie_02_BLK", 1],["murshun_cigs_matches",1,5],["murshun_cigs_cigpack",1,4]]],["rhs_6b23_6sh92",[["ACE_EntrenchingTool",1],["rhs_30Rnd_545x39_7N10_AK",7,30],["rhs_mag_rgd5",1,1],["rhs_mag_rdg2_white",1,1]]],[],"rhs_6b7_1m_flora","rhs_balaclava1_olive",[],["ItemMap","","","ItemCompass","ItemWatch",""]]
	],
	[
		"rhs_vmf_flora_combatcrew",
		[["rhs_weap_aks74u","rhs_acc_dtk","","",["rhs_30Rnd_545x39_7N10_AK",30],[],""],[],[],["rhs_uniform_flora_patchless",[["ACE_fieldDressing",5],["ACE_morphine",1],["ACE_tourniquet",2],["ACRE_PRC343",1],["ACE_EarPlugs",1],["ACRE_PRC148",1],["UK3CB_H_Beanie_02_BLK", 1],["murshun_cigs_matches",1,5],["murshun_cigs_cigpack",1,4]]],["rhs_6b23_engineer",[["rhs_30Rnd_545x39_7N10_AK",6,30],["rhs_mag_rdg2_white",1,1]]],[],"rhs_tsh4","rhs_ess_black",[],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]]
	],
	[
		"rhs_vmf_flora_crew",
		[["rhs_weap_aks74u","rhs_acc_dtk","","",["rhs_30Rnd_545x39_7N10_AK",30],[],""],[],[],["rhs_uniform_flora_patchless",[["ACE_fieldDressing",5],["ACE_morphine",1],["ACE_tourniquet",2],["ACRE_PRC343",1],["ACE_EarPlugs",1],["UK3CB_H_Beanie_02_BLK", 1],["murshun_cigs_matches",1,5],["murshun_cigs_cigpack",1,4]]],["rhs_6b23_engineer",[["rhs_30Rnd_545x39_7N10_AK",7,30]]],[],"rhs_tsh4","rhs_ess_black",[],["ItemMap","","","ItemCompass","ItemWatch",""]]
	],
	[
		"rhs_vmf_flora_officer_armored",
		[["rhs_weap_ak74m_pkas","rhs_acc_dtk","","",["rhs_30Rnd_545x39_7N10_AK",30],[],""],[],["rhs_weap_makarov_pm","","","",["rhs_mag_9x18_8_57N181S",8],[],""],["rhs_uniform_flora_patchless",[["ACE_fieldDressing",5],["ACE_morphine",1],["ACE_tourniquet",2],["ACRE_PRC343",1],["ACE_EarPlugs",1],["ACRE_PRC148",1],["UK3CB_H_Beanie_02_BLK", 1],["murshun_cigs_lighter",1,100],["murshun_cigs_cigpack",1,20]]],["rhs_6b23_crewofficer",[["rhs_30Rnd_545x39_7N10_AK",3,30],["rhs_mag_rdg2_white",2,1]]],[],"rhs_beret_mp1","G_Aviator",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]]
	],
	[
		"rhs_vmf_emr_medic",
		[["rhs_weap_ak74m_pkas","rhs_acc_dtk","","",["rhs_30Rnd_545x39_7N10_AK",30],[],""],[],[],["rhs_uniform_flora_patchless",[["ACE_EarPlugs",1],["ACRE_PRC343",1],["UK3CB_H_Beanie_02_BLK", 1],["murshun_cigs_lighter",1,100],["murshun_cigs_cigpack",1,15]]],["rhs_6b23_medic",[["ACE_morphine",20],["ACE_epinephrine",10],["ACE_EntrenchingTool",1],["rhs_30Rnd_545x39_7N10_AK",5,30],["rhs_mag_rdg2_white",3,1]]],["rhs_rk_sht_30_olive",[["ACE_fieldDressing",30],["ACE_elasticBandage",15],["ACE_packingBandage",15],["ACE_bloodIV",5],["ACE_bloodIV_500",5],["ACE_bloodIV_250",5],["ACE_splint",5],["ACE_tourniquet",20],["ACE_surgicalKit",1],["rhs_mag_rdg2_white",3,1]]],"rhs_6b7_1m_flora","rhs_balaclava1_olive",[],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]]
	],
	[
		"rhs_vmf_flora_medic",
		[["rhs_weap_ak74m_pkas","rhs_acc_dtk","","",["rhs_30Rnd_545x39_7N10_AK",30],[],""],[],[],["rhs_uniform_flora_patchless",[["ACE_EarPlugs",1],["ACRE_PRC343",1],["UK3CB_H_Beanie_02_BLK", 1],["murshun_cigs_matches",1,5],["murshun_cigs_cigpack",1,4]]],["rhs_6b23_medic",[["ACE_morphine",10],["ACE_epinephrine",5],["ACE_EntrenchingTool",1],["rhs_30Rnd_545x39_7N10_AK",7,30],["rhs_mag_rdg2_white",2,1]]],["rhs_rk_sht_30_emr",[["ACE_fieldDressing",20],["ACE_elasticBandage",10],["ACE_packingBandage",10],["ACE_bloodIV",2],["ACE_bloodIV_500",2],["ACE_bloodIV_250",2],["ACE_splint",5],["ACE_tourniquet",10],["ACE_surgicalKit",1],["rhs_mag_rdg2_white",2,1]]],"rhs_6b7_1m_flora","rhs_balaclava1_olive",[],["ItemMap","","","ItemCompass","ItemWatch",""]]
	],
	[
		"rhs_vmf_flora_marksman",
		[["rhs_weap_svdp_wd","","","rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1",10],[],""],[],["rhs_weap_makarov_pm","","","",["rhs_mag_9x18_8_57N181S",8],[],""],["rhs_uniform_flora_patchless",[["ACE_fieldDressing",5],["ACE_morphine",1],["ACE_tourniquet",2],["ACE_EarPlugs",1],["UK3CB_H_Beanie_02_BLK",1],["murshun_cigs_matches",1,5],["murshun_cigs_cigpack",1,4],["ACRE_PRC343",1]]],["rhs_6b23_sniper",[["ACE_EntrenchingTool",1],["rhs_10Rnd_762x54mmR_7N1",7,10],["rhs_mag_9x18_8_57N181S",2,8],["rhs_mag_rdg2_white",2,1]]],[],"rhs_6b7_1m_flora","rhs_balaclava1_olive",[],["ItemMap","","","ItemCompass","ItemWatch",""]]
	]
];

private _loadout = _loadouts get typeOf _unit;

private _fnc_randomizeLoadout = {
	params ["_loadout", "_replacements"];

	private _result = [];

	{
		if (_x isEqualType []) then {
			_result pushBack ([_x, _replacements] call _fnc_randomizeLoadout);
		} else {
			private _options = _replacements get _x;

			if (isNil "_options") then {
				_result pushBack _x;
			} else {
				_result pushBack (selectRandomWeighted _options);
			};
		};
	} forEach _loadout;

	_result
};

if (isNil "_loadout") exitWith {
	systemChat "ERROR: No loadout defined for this unit!";
};

private _replacements = createHashMapFromArray [
	[
		"rhs_6b7_1m_flora",
		[
			"rhs_6b7_1m_flora",
			50,
			"rhs_6b7_1m_olive",
			20,
			"rhs_6b7_1m",
			30
		]
	],
	[
		"rhs_uniform_flora_patchless",
		[
			"rhs_uniform_flora_patchless",
			80,
			"rhs_uniform_flora_patchless_alt",
			20
		]
	],
	[
		"rhs_6b23_6sh92",
		[
			"rhs_6b23_6sh92",
			75,
			"rhs_6b23_vydra_3m",
			25
		]
	],
	[
		"G_Aviator",
		[
			"",
			30,
			"G_Aviator",
			60,
			"G_Squares_Tinted",
			10
		]
	],
	[
		"rhs_balaclava1_olive",
		[
			"",
			90,
			"G_Squares",
			10
		]
	],
	[
		"rhs_ess_black",
		[
			"",
			30,
			"rhs_ess_black",
			50,
			"G_Lowprofile",
			10,
			"G_Squares",
			10
		]
	],
	[
		"rhs_beret_mp1",
		[
			"rhs_beret_mp1",
			50,
			"rhs_beret_mp2",
			50
		]
	]
];

private _randomizedLoadout = [_loadout, _replacements] call _fnc_randomizeLoadout;

_unit setUnitLoadout _randomizedLoadout;
[
	_unit,
	[
		["ACRE_PRC343", _unit getVariable ["Foley_defaultChannel", 1]]
	]
] execVM "scripts\player\radioChannelSetup.sqf";

[_unit] spawn {
	params ["_unit"];

	sleep 0.5;

	if (primaryWeapon _unit != "") exitWith {
		_unit playMoveNow "AmovPercMstpSlowWrflDnon";
	};

	if (handgunWeapon _unit != "") exitWith {
		_unit playMoveNow "AmovPercMstpSlowWpstDnon";
	};
};

[_unit] spawn {
	params ["_unit"];

	sleep 0.1;
	
	waitUntil {
		!isNil "Foley_opforArmbandColor"
	};
	
	private _variant = selectRandom ["", "2"];
	private _armband = "Armband_" + Foley_opforArmbandColor + "_medium" + _variant;

	if (_unit canAdd _armband) then {
		_unit addItem _armband;
	} else {
		_unit linkItem _armband;
	};
};
