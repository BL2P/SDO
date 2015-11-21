if (isServer || isDedicated || !hasInterFace) exitwith {diag_log "I was kicked from the Init_Client.sqf";};

//--- Wait until player is initialized
	waitUntil {!isNull player && isPlayer player};
	sidePlayer = side player;
	diag_log "==============Init_client Start==============";


//--- Move players to base start pos
	waituntil {!isNil "BaseCreated"};
	player setpos getMarkerPos "BLUFOR HQ"; 
	_mPos = markerDir "BLUFOR HQ";
	player setDir _mPos;  
	
//--- Lets run stuff ONCE
	_RunOnce = execVM "scripts\RunOnce.sqf";
	waitUntil{scriptDone _RunOnce}; 
	
//--- BL1P check for Mods on Client
	acre_enabled = isClass(configFile/"CfgPatches"/"acre_main");

//--- BL1P Black listed mods
	STGI = isClass(configFile/"CfgPatches"/"STGI");
	st_interact = isClass(configFile/"CfgPatches"/"st_interact");
	STNametags = isClass(configFile/"CfgPatches"/"STNametags");
	
//---BL1P send to lobby if black listed mods present	
	if (STGI) then {failMission "END9";};
	if (st_interact) then {failMission "END9";};
	if (STNametags) then {failMission "END9";};
	
//--- bl1p blablabla
	execVM "core\briefing.sqf";                                                         	

	if(DEBUG) then
		{
			_null=[] execVM "core\admin_uid.sqf";
		};
			

//--- BL1P player restrictions
	execVM "core\Restrictions\naughtyThermal.sqf";
	execVM "core\Restrictions\drivercheck.sqf";

//--- Blackout OFF loading screen
	if (hasinterface) then
	{
	if (isNil "MovedAndInitialised") then {waituntil {!isNil "MovedAndInitialised"};};
	waituntil {MovedAndInitialised};
	sleep 10;
	420 cutText ["====      Loading complete...    ====","BLACK IN",2];
	};
Init_Client = true;

diag_log "==============Init_client End==============";