waitUntil {sleep 0.5; !(isNil "currentAOUp")};
waitUntil {sleep 0.5; !(isNil "currentAO")};
private ["_ConvoyCreatePos","_ConvoyMovetoPos","_ConvoyGroup","_fuzzyPos","_Convoydead","_ConRandAmount","_ConvoySafePos","_Convoy_Vehicle","_flatPos","_accepted","_debugCounter","_position","_nearUnits","_RandCreation","_randomInfantry","_SERVERUNITSCHECK","_randomChopper","_giveup","_SERVERUNITSCHECK1","_SERVERUNITSCHECKresistance"];

if (DEBUG) then {diag_log "===============Reading CONVOY reinforcements====================";};

ConvoyAlive = false;
publicVariable "ConvoyAlive";

ConvoyUnits = [];
ConvoyVehicles = [];
_SERVERUNITSCHECK1 = 0;
_SERVERUNITSCHECKresistance = 0;
_SERVERUNITSCHECK = 0;
_giveup = false;

while {!_giveup && PARAMS_ConvoyChance >= 1} do 
{
	// sleep before running the random creation
	if(DEBUG) then
		{
		// lower for testing
			sleep (10 + (random 10));
		}
		else
		{
			sleep (1800 + (random 600));
		};
	_RandCreation = random 10;
	if(DEBUG && !ConvoyAlive) then
			{
				diag_log format ["_RandCreation for convoys = %1 PARAMS_ConvoyChance = %2  (%1 <= %2 ?)",_RandCreation,PARAMS_ConvoyChance];
			};
	if (radioTowerAlive && !ConvoyAlive) then
		{
			_SERVERUNITSCHECK1 = east countSide allunits;
			_SERVERUNITSCHECKresistance = resistance countSide allunits;
			_SERVERUNITSCHECK = (_SERVERUNITSCHECK1 + _SERVERUNITSCHECKresistance);
			
			sleep 1;
			if(DEBUG) then
						{
							diag_log format ["_SERVERUNITSCHECK1 for convoys = %1",_SERVERUNITSCHECK1];
						};
		};		
		
    if (radioTowerAlive && (_SERVERUNITSCHECK1 < PARAMS_TOTALMAXAI) && (_RandCreation <= PARAMS_ConvoyChance)) then 
	{
        if (!ConvoyAlive) then 
		{
			if(DEBUG) then
			{
				diag_log format ["ConvoyAlive = %1",ConvoyAlive];
			};
			/// find flat pos not near base ///
			_flatPos = [0];
			_accepted = false;
			_found = false;
			_amount = 1000;
			_debugCounter = 1;
			_road = objNull;
			_usedroads = [];
			
			while {!_accepted} do
			{
				if (_debugCounter >= 50) exitWith 
				{
					_giveup = true;
					_flatPos = [];
					_debugCounter = 1;
					diag_log "Cant find a good convoy start position exit 1";
				};

				_position = [[[getMarkerPos currentAO,18000]],["water","out"]] call BIS_fnc_randomPos;
				_list = _position nearRoads _amount;
				if(count _list >= 5) then
				{
					_road = _list call BIS_fnc_selectRandom;
					_roadpos = getPos _road;
					_flatPos = _roadpos;								
				};
												
				if ((count _flatPos) == 3) then {
					if ((_flatPos distance (getMarkerPos "respawn_west")) > 3000 && (_flatPos distance (getMarkerPos currentAO)) > 8000) then 
					{
						_nearUnits = 0;
						{
							if ((_flatPos distance (getPos _x)) < 1500) then
							{
								_nearUnits = _nearUnits + 1;
							};
						} forEach playableUnits;

						if (_nearUnits == 0) then
						{
							_accepted = true;
						};
					} else {
						_flatPos = [0];
					};
				};
				_debugCounter = _debugCounter + 1;
			};
			
			if (_giveup) exitWith 
			{
				diag_log "Cant find a good convoy start position exit 2";
			};
			
			_ConvoyCreatePos = _flatPos;
			_ConvoyMovetoPos = getMarkerPos currentAO;
			_ConvoyGroup = createGroup EAST;
				
			_x = 0;
			_ConRandAmount = [2,3] call BIS_fnc_selectRandom;
			if(DEBUG) then {
				diag_log format ["_ConRandAmount = %1",_ConRandAmount];
			};
			
			
			//--- create lead vehicle
			//_Convoy_Vehicle = [getPos _road,0,(SDO_Heavy_Armour_vehicles call BIS_fnc_selectRandom),_ConvoyGroup] call BIS_fnc_spawnVehicle;
			_Convoy_Vehicle = createVehicle [(SDO_Heavy_Armour_vehicles call BIS_fnc_selectRandom),getPos _road,[], 0, "NONE"];
			[_Convoy_Vehicle, _ConvoyGroup] call BIS_fnc_spawnCrew; 
			
			
			(_Convoy_Vehicle) setDir (getDir _road);
			ConvoyVehicles set [count ConvoyVehicles, _Convoy_Vehicle];
			
			(vehicle (leader _ConvoyGroup)) spawn SDO_fnc_fuelMonitor;
			if !(isNil "dep_fnc_vehicledamage") then {
			[(_Convoy_Vehicle)] spawn dep_fnc_vehicledamage;
			};
			_usedroads = _usedroads + [_road];
			sleep 0.5;
			
			//---create random amount and type vehs	
			for [{_x = 0}, {_x < _ConRandAmount}, {_x=_x+1}] do 
			{
				_roadConnectedTo = roadsConnectedTo _road;
				_connectedRoad = _roadConnectedTo select 0;
				if !(_connectedRoad in _usedroads) then 
				{
					_usedroads = _usedroads + [_connectedRoad];
					_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
					_road = _connectedRoad;
					
					//_Convoy_Vehicle = [getPos _connectedRoad,0,(SDO_Support_vehicles call BIS_fnc_selectRandom),_ConvoyGroup] call BIS_fnc_spawnVehicle;
					_Convoy_Vehicle = createVehicle [(SDO_Support_vehicles call BIS_fnc_selectRandom), getPos _connectedRoad,[], 0, "NONE"];
					[_Convoy_Vehicle, _ConvoyGroup] call BIS_fnc_spawnCrew; 
					
					(_Convoy_Vehicle) setDir _direction;
					ConvoyVehicles set [count ConvoyVehicles, _Convoy_Vehicle];
					(vehicle (leader _ConvoyGroup)) spawn SDO_fnc_fuelMonitor;
					if !(isNil "dep_fnc_vehicledamage") then {
					[(_Convoy_Vehicle)] spawn dep_fnc_vehicledamage;
					};
					sleep 0.5;
				};
			};

			//--- create AA vehicle
			_roadConnectedTo = roadsConnectedTo _road;
			_connectedRoad = _roadConnectedTo select 0;
			if !(_connectedRoad in _usedroads) then 
			{
				_usedroads = _usedroads + [_connectedRoad];
				_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
				//_Convoy_Vehicle = [getPos _connectedRoad,0,(SDO_AAA_Armour_vehicles call BIS_fnc_selectRandom),_ConvoyGroup] call BIS_fnc_spawnVehicle;
				_Convoy_Vehicle = createVehicle [(SDO_AAA_Armour_vehicles call BIS_fnc_selectRandom), getPos _connectedRoad,[], 0, "NONE"];
				
				[_Convoy_Vehicle, _ConvoyGroup] call BIS_fnc_spawnCrew; 
				
				
				(_Convoy_Vehicle) setDir _direction;
				_road = _connectedRoad;
				ConvoyVehicles set [count ConvoyVehicles, _Convoy_Vehicle];
				
				(vehicle (leader _ConvoyGroup)) spawn SDO_fnc_fuelMonitor;
				if !(isNil "dep_fnc_vehicledamage") then {
					[(_Convoy_Vehicle)] spawn dep_fnc_vehicledamage;
				};
				sleep 0.5;
			};
				
				
			//---  create a chopper random chance
			//--- bl1p made it never spawn for now
			_randomChopper = random 10;
			if (_randomChopper > 2) then 
			{
				_ConvoySafePos = [getPos _road, 30,5] call SDO_fnc_randomPosbl1p;
				//_Convoy_Vehicle = [_ConvoySafePos,0,[SDO_Air_Trans] call BIS_fnc_selectRandom,_ConvoyGroup] call BIS_fnc_spawnVehicle;
				_Convoy_Vehicle = [[_ConvoySafePos select 0,_ConvoySafePos select 1,1000], 20, (SDO_Air_Trans call BIS_fnc_selectRandom), _ConvoyGroup] call BIS_fnc_spawnVehicle;
				(_Convoy_Vehicle select 0) setDir (getDir _road);
				ConvoyVehicles set [count ConvoyVehicles, _Convoy_Vehicle select 0];
				(vehicle (leader _ConvoyGroup)) spawn SDO_fnc_fuelMonitor;
				
				// create infantry with chopper
				SDO_u_AO_sl  createUnit [_ConvoySafePos, _ConvoyGroup];
				SDO_u_AO_med createUnit [_ConvoySafePos, _ConvoyGroup];
				SDO_u_AO_ar createUnit [_ConvoySafePos, _ConvoyGroup];
				SDO_u_AO_at createUnit [_ConvoySafePos, _ConvoyGroup];
				SDO_u_AO_gl createUnit [_ConvoySafePos, _ConvoyGroup];
				SDO_u_AO_rep createUnit [_ConvoySafePos, _ConvoyGroup];
				SDO_u_AO_med createUnit [_ConvoySafePos, _ConvoyGroup];
				SDO_u_AO_ar createUnit [_ConvoySafePos, _ConvoyGroup];
				SDO_u_AO_at createUnit [_ConvoySafePos, _ConvoyGroup];
				SDO_u_AO_gl createUnit [_ConvoySafePos, _ConvoyGroup];
				
				if(DEBUG) then
				{
					diag_log "Created Helicopter for convoy";
				};
				sleep 1;
			};
				
			if(DEBUG) then
			{
				diag_log format ["_ConvoyGroup = %1",_ConvoyGroup];
			};
		
			[_ConvoyGroup, getMarkerPos currentAO,250] call SDO_fnc_spawn2_perimeterPatrolConvoy;
				
		   //Set fuzzy marker
			_fuzzyPos =
			[
				((_ConvoyCreatePos select 0) - 300) + (random 600),
				((_ConvoyCreatePos select 1) - 300) + (random 600),
				0
			];
			
			_gridPos = mapGridPosition _fuzzyPos;
			_gridPos2 = mapGridPosition getmarkerpos "aoMarker";
			/*
			{ _x setMarkerPos _fuzzyPos; } forEach ["priorityMarker", "priorityCircle"];
			"priorityMarker" setMarkerText "Convoy Target: Start Area";
			publicVariable "priorityMarker";
			
			
			_convoytext = format ["Enemy Convoy Spotted Near %1 Heading to %2",_gridPos,_gridPos2];
			showNotification = ["NewSub",_convoytext]; publicVariable "showNotification";
			 */  
			   ConvoyAlive = true;
			   publicVariable "ConvoyAlive";
			   if(DEBUG) then
					{
					diag_log format ["All created ConvoyAlive = %1",ConvoyAlive];
					};
				
				{
				  ConvoyUnits set [count ConvoyUnits, _x];
				  publicVariable "ConvoyUnits";
				} forEach units _ConvoyGroup;
				
				publicVariable "ConvoyVehicles";
				
				 if(DEBUG) then
					{
					diag_log format ["Count Convoy Alive units = %1",count ConvoyUnits];
					};
        }
		else
		{
			////////////////////////////
			_Convoydead = true;
			//Check status of units
				{
				  if (alive _x) then 
				  {
					_Convoydead = false;
				  };
				} forEach ConvoyUnits;
			
			
			// If all dead reset the convoy status
			if ( _Convoydead) then 
				{
				
					//--- showNotification = ["CompletedSub", "Enemy Convoy destroyed."]; publicVariable "showNotification";
					ConvoyAlive = false;
					publicVariable "ConvoyAlive";
					ConvoyUnits = [];
					publicVariable "ConvoyUnits";
					ConvoyVehicles = [];
					publicVariable "ConvoyVehicles";
					
					//Hide priorityMarker
					"priorityMarker" setMarkerPos [0,0,0];
					"priorityCircle" setMarkerPos [0,0,0];
					publicVariable "priorityMarker";
					[] spawn SDO_cleanGroups;
					
				};
			////////////////////////////
			
		};
    };
    sleep 10;
};