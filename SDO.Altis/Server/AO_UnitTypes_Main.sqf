if !(isServer) exitwith {diag_log "Exiting AO_UnitTypes_Main.sqf not a server";};

diag_log "==========Reading AO_UnitTypes_Main.sqf============";
if (PARAMS_AO_UNITS == 0) then
	{
		_AO_Enemy = execVM "Server\UnitTypes\AO_UnitTypes_BIS.sqf";
		waitUntil{scriptDone _AO_Enemy}; 
	};

if (PARAMS_AO_UNITS == 1) then
	{
		_AO_Enemy = execVM "Server\UnitTypes\AO_UnitTypes_SUP_ME.sqf";
		waitUntil{scriptDone _AO_Enemy}; 
	};

if (PARAMS_AO_UNITS == 2) then
	{
		_AO_Enemy = execVM "Server\UnitTypes\AO_UnitTypes_SUP_AF.sqf";
		waitUntil{scriptDone _AO_Enemy}; 
	};

if (PARAMS_AO_UNITS == 3) then
	{
		_AO_Enemy = execVM "Server\UnitTypes\AO_UnitTypes_SUP_EU.sqf";
		waitUntil{scriptDone _AO_Enemy}; 
	};

if (PARAMS_AO_UNITS == 4) then
	{
		_AO_Enemy = execVM "Server\UnitTypes\AO_UnitTypes_SUP_WEU.sqf";
		waitUntil{scriptDone _AO_Enemy}; 
	};	
	
	_AO_Enemy = execVM "Server\UnitTypes\AO_UnitTypes_Convoy.sqf";
	waitUntil{scriptDone _AO_Enemy}; 
 diag_log "==========Finished Reading AO_UnitTypes.sqf============";
 
 
 