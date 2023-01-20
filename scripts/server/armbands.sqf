Foley_opforArmbandColor = selectRandomWeighted ["Red", 70, "White", 30];
publicVariable "Foley_opforArmbandColor";

sleep 5;

private _cdfArmbandColor = selectRandomWeighted ["Blue", 50, "Yellow", 50];
private _cdfArmbands = [
	"Armband_" + _cdfArmbandColor + "_medium",
	"Armband_" + _cdfArmbandColor + "_medium2"
];

private _cdfUnits = allUnits select {alive _x && side _x == blufor};
private _cdfUnitsWithArmbands = (_cdfUnits call BIS_fnc_arrayShuffle) select [0, floor (0.9 * count _cdfUnits)];

{
	_x linkItem selectRandom _cdfArmbands;
} forEach _cdfUnitsWithArmbands;
