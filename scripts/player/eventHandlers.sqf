player addEventHandler [
	"respawn",
	{
		execVM "scripts\player\loadout.sqf";
		execVM "scripts\player\identity.sqf";
	}
];
