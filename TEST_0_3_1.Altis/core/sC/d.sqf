private ["_r", "_m", "_brd"];
Diag_log "==========READING SERVER DIFICULTYS==============";
_r = 
[
"FriendlyTag", 
"HUD", 
"HUDWp", 
"HUDWpPerm", 
"HUDGroupInfo", 
"WeaponCursor", 
"Armor", 
"EnemyTag", 
"MineTag", 
"AutoSpot", 
"Map", 
"3rdPersonView", 
"DeathMessages", 
"NetStats",
"autoAim",
"autoGuideAT",
"autoSpot",
"clockIndicator",
"hudPerm",
"ExtendetInfoType"
];
_m = "";
_brd = false;
{
	if (difficultyEnabled _x) then
	{
		if (!_brd) then
		{
			_brd = true;
			_m = _m + ("Server Settings :-");
			_m = _m + " " + _x;
		}
		else
		{
			_m = _m + ", " + _x;
		};	
	};
} forEach _r;
if (_brd) then
{
	_m = _m + ".";
};
if (_m != "") then
{
	_m = "Warning Disable" + " " + _m;
	diag_log _m;

		sleep 1;
		hint _m;
		waituntil {time > 5};
		FailMission "End8";
};