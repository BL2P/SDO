
//--- JIP Check (This code should be placed first line of init.sqf file)
	if (!isServer && isNull player) then {isJIP=true;} else {isJIP=false;};

//--- Wait until player is initialized
	if (!isDedicated) then
		{
			waitUntil {!isNull player && isPlayer player};
			sidePlayer = side player;
		};
	diag_log "============================================================";
	diag_log format ["================= Reading main init.sqf for %1 ============",missionname];
	diag_log "============================================================";

//--- Blackout ON loading screen
	if (hasinterface) then
	{
	420 cutText ["====      Loading, Please wait...    ====","BLACK OUT",0.1];
	};
	
	
//--- Grab parameters and put them into readable variables
	for [ {_i = 0}, {_i < count(paramsArray)}, {_i = _i + 1} ] do
		{
			call compile format
			[
				"PARAMS_%1 = %2",
				(configName ((missionConfigFile >> "Params") select _i)),
				(paramsArray select _i)
			];
		};
		
//--- set up debug mode
	if(isMultiplayer) then
		{
			if(PARAMS_DebugMode == 1) then {DEBUG = true} else {DEBUG = false};
		} else {DEBUG = true};

		if(DEBUG) then
			{
				diag_log format ["I am in the MAIN GLOBAL section of the init.sqf params are read and debug = %1",DEBUG];
			};

/* =============================================== */
/* =============================================== */
/* =============== READ COMMON =================== */
/* =============================================== */
/* =============================================== */
//--- Run Init_Common.sqf on all instances
	_Commmon = [] execVM "Common\Init_Common.sqf";
/* =============================================== */
/* =============================================== */
/* =================== END ======================= */
/* =============================================== */
/* =============================================== */
diag_log "FINISHED Reading main init.sqf";
