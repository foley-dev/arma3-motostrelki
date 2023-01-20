doStop player;
player addRating 100000;

[
	1200,
	getPos player,
	"<t font='PuristaBold' size='1.6'>28 [Tour] Motostrelki</t><br />by Foley"
] execVM "scripts\player\missionTitle.sqf";

execVM "scripts\player\radioSilence.sqf";
