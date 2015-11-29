//--- BL1P THIS SCRIPT IS AUTO RAN BY BIS
	if (isServer || isDedicated || !hasInterface) exitWith {Diag_log "***I was kicked from the onPlayerrespawn.sqf I am not a true client";};
waituntil {!isNil "DEBUG";}; 
if (DEBUG) then {
diag_log "***onPlayerRespawn Start==============";
	};
	_unit = _this select 0;
	_corpse = _this select 1;

//--- Lets run stuff ONCE
	RAN_ONCE = false;
	_RunOnceOPS = execVM "scripts\RunOnce.sqf";
	waitUntil{scriptDone _RunOnceOPS}; 


		
//--- BL1P remove corpses of players
	sleep 20;
	hideBody _corpse;
	sleep 5;
	deleteVehicle _corpse; 
	if (DEBUG) then {
diag_log "***onPlayerRespawn End==============";
};