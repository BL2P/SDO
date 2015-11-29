diag_log "***Init_Common Start==============";

//--- Arty
	enableEngineArtillery false;


//--- Fluit's functions!!
	_fluitFunctions = [] execVM "core\Fluit\FluitInit.sqf"; 
	waitUntil {scriptDone _fluitFunctions};

//--- SDO_functions
	_SDOfunctions = execVM "scripts\SDO_functions.sqf";
	waitUntil{scriptDone _SDOfunctions};
	
//--- Check if player is a SDO member or friend ran by player and server
	_SDONFriends = execVM "core\SDO_N_Friends.sqf";
	//waitUntil{scriptDone _SDONFriends};

	
//--- Outro by EightySix fucked up by BL1P.
	mps_outro_camera		= compile preprocessFileLineNumbers ("core\func\mps_func_outro_camera.sqf");
	mps_new_position		= compile preprocessFileLineNumbers ("core\func\mps_func_new_position.sqf");
	mps_outro				= compile preprocessFileLineNumbers ("core\func\mps_func_outro_sequence.sqf");
	[] call mps_outro;	
	

	
//---!!!! Fluit N bl1p The Immortal Gods of The Universe and beyond !!!!!!!
	if(DEBUG) then
		{
			{
				if (side _x == WEST) then {
					_x allowDamage false;
					_x enableFatigue false;
			   };
			} forEach allunits;
		};
		

	 
//--- Dynamic enemy population
	if (PARAMS_DEP == 1) then {        
		[] execVM "DEP\init.sqf";
	};
	
/* =============================================== */
/* =============== GLOBAL VARIABLES ============== */
/* =============================================== */

"GlobalHint" addPublicVariableEventHandler
	{
		private ["_GHint"];
		_GHint = _this select 1;
		hint parseText format["%1", _GHint];
	};


"radioTower" addPublicVariableEventHandler
	{
		"radioMarker" setMarkerPosLocal (markerPos "radioMarker");
		"radioMarker" setMarkerTextLocal (markerText "radioMarker");
		"radioMarker" SetMarkerAlpha 0;
	};

"refreshMarkers" addPublicVariableEventHandler
	{
		{
			_x setMarkerShapeLocal (markerShape _x);
			_x setMarkerSizeLocal (markerSize _x);
			_x setMarkerBrushLocal (markerBrush _x);
			_x setMarkerColorLocal (markerColor _x);
		} forEach _targets;

		{
			_x setMarkerPosLocal (markerPos _x);
			_x setMarkerTextLocal (markerText _x);
		} forEach ["aoMarker","aoCircle"];
		//-- bl1p
		"aoCircle" SetMarkerAlpha 0;
		"aoMarker" SetMarkerAlpha 0;
		
		//--- DEFEND MARKERS
		{
			_x setMarkerPosLocal (markerPos _x);
			_x setMarkerTextLocal (markerText _x);
		} forEach ["aoMarker_2","aoCircle_2"];
		//-- bl1p
		"aoCircle_2" SetMarkerAlpha 0;
		"aoMarker_2" SetMarkerAlpha 0;
	};

"showNotification" addPublicVariableEventHandler
	{
		private ["_type", "_message"];
		_array = _this select 1;
		_type = _array select 0;
		_message = "";
		if (count _array > 1) then { _message = _array select 1; };
		[_type, [_message]] call bis_fnc_showNotification;
	};

"priorityMarker" addPublicVariableEventHandler
	{
		"priorityMarker" setMarkerPosLocal (markerPos "priorityMarker");
		"priorityCircle" setMarkerPosLocal (markerPos "priorityCircle");
		"priorityMarker" setMarkerTextLocal format["Priority Target: %1",priorityTargetText];
	};

"hqSideChat" addPublicVariableEventHandler
	{
		_message = _this select 1;
		[WEST,"HQ"] sideChat _message;
	};

"TakeMarker" addPublicVariableEventHandler
	{
		createMarker [((_this select 1) select 0), getMarkerPos ((_this select 1) select 1)];
		"theTakeMarker" setMarkerShape "ICON";
		"theTakeMarker" setMarkerType "o_unknown";
		"theTakeMarker" setMarkerColor "ColorOPFOR";
		"theTakeMarker" setMarkerText format["Take %1", ((_this select 1) select 1)];
	};

"addToScore" addPublicVariableEventHandler
	{
		((_this select 1) select 0) addScore ((_this select 1) select 1);
	};

//--- bl1p Determine which machine is running this init script
	SDO_IsHostedServer = if (isServer && !isDedicated) then {true} else {false};
	SDO_IsServer = if (isDedicated || SDO_IsHostedServer) then {true} else {false};
	SDO_IsClient = if ((SDO_IsHostedServer || !isDedicated) && (hasInterface)) then {true} else {false};
	SDO_IsHeadless = if !(hasInterface || isDedicated) then {true} else {false};

//--- write to rpts who is who
	diag_log format ["***SDO_IsHostedServer = %1",SDO_IsHostedServer];
	diag_log format ["***SDO_IsServer = %1",SDO_IsServer];
	diag_log format ["***SDO_IsClient = %1",SDO_IsClient];
	diag_log format ["***SDO_IsHeadless = %1",SDO_IsHeadless];
	
//--- kick client from script to init client
	if (SDO_IsClient) exitwith
		{
			diag_log "****Client leaving Init_Common.sqf****";
			execVm "Client\Init_Client.sqf";
		};
		
//--- kick server from script to init server
	if (SDO_IsServer) exitwith
		{
			diag_log "****Server leaving Init_Common.sqf****";
			execVm "Server\Init_Server.sqf";
		};	

//--- kick headless from script to init headless
	if (SDO_IsHeadless) exitwith
		{
			diag_log "****Headless leaving Init_Common.sqf****";
			execVm "Headless\Init_Headless.sqf";
		};	
	
diag_log "***Init_Common END==============";	
