//--- bl1p
if (DEBUG) then {
diag_log "***this is the Thermal check script =============";
};
_layer = 85125; 

_alowedThermals = ["rhs_weap_fgm148","launch_B_Titan_F","launch_B_Titan_short_F","UK3CB_BAF_Javelin_Launcher"];

while {true} do 
{ 
	waituntil {currentVisionMode player == 2}; 
	_weaponClass = currentWeapon (vehicle player);
	if (DEBUG) then {
	diag_log format ["***_weaponClass = %1",_weaponClass];
	};
	sleep 0.01;
	if  !(_weaponClass in _alowedThermals) then
	{
		if (currentVisionMode player == 2) then
			{ 
				_layer	cutText ["FLIR Mode Requires Maintenance. Please Turn off Thermals.","BLACK",0];
				waituntil {currentVisionMode player != 2};
				_layer cutText ["", "PLAIN"];
			}; 
	};
	sleep 1;
};  