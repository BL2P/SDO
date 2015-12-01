if (SDO_IsServer) then 
{
	SDO_fnc_deleteOldAOUnits = compile preprocessFileLineNumbers ("\SDO\SDO_Functions\SDO_fnc_deleteOldAOUnits.sqf");
	SDO_fnc_fuelMonitor = compile preprocessFileLineNumbers ("\SDO\SDO_Functions\SDO_fnc_fuelMonitor.sqf");
	SDO_fnc_randomPos = compile preprocessFileLineNumbers ("\SDO\SDO_Functions\SDO_fnc_randomPos.sqf");
	SDO_fnc_randomPosbl1p = compile preprocessFileLineNumbers ("\SDO\SDO_Functions\SDO_fnc_randomPosbl1p.sqf");
	SDO_fnc_spawn2_waypointBehaviour = compile preprocessFileLineNumbers ("\SDO\SDO_Functions\SDO_fnc_spawn2_waypointBehaviour.sqf");
	SDO_fnc_spawn2_waypointBehaviourConvoy = compile preprocessFileLineNumbers ("\SDO\SDO_Functions\SDO_fnc_spawn2_waypointBehaviourConvoy.sqf");
	SDO_fnc_spawn2_waypointBehaviourBL1P = compile preprocessFileLineNumbers ("\SDO\SDO_Functions\SDO_fnc_spawn2_waypointBehaviourBL1P.sqf");
	SDO_fnc_radPos = compile preprocessFileLineNumbers ("\SDO\SDO_Functions\SDO_fnc_radPos.sqf");
	SDO_fnc_spawn2_randomPatrolBL1P = compile preprocessFileLineNumbers ("\SDO\SDO_Functions\SDO_fnc_spawn2_randomPatrolBL1P.sqf");
	SDO_fnc_spawn2_randomPatrol = compile preprocessFileLineNumbers ("\SDO\SDO_Functions\SDO_fnc_spawn2_randomPatrol.sqf");
	SDO_fnc_spawn2_perimeterPatrolBL1P = compile preprocessFileLineNumbers ("\SDO\SDO_Functions\SDO_fnc_spawn2_perimeterPatrolBL1P.sqf");
	SDO_fnc_spawn2_perimeterPatrol = compile preprocessFileLineNumbers ("\SDO\SDO_Functions\SDO_fnc_spawn2_perimeterPatrol.sqf");
	SDO_fnc_Snipers = compile preprocessFileLineNumbers ("\SDO\SDO_Functions\SDO_fnc_Snipers.sqf"); 
	SDO_cleanGroups = compile preprocessFileLineNumbers ("\SDO\SDO_Functions\SDO_cleanGroups.sqf"); 
};

SDO_fnc_AOAdvance =  
	{
		if(!DEBUG) exitWith{};
		
		{ if (side _x == east) then {_x setdamage 1;} } foreach allunits;
		radioTower setdamage 1;
	};
	
SDO_serverMapTP = 
	{
		if(!DEBUG) exitWith{};
		onMapSingleClick "player setPos _pos;onMapSingleClick '';true";
	};
	
if (DEBUG) then 
	{
		diag_log "***SDO_Functions Initialised***";
	};