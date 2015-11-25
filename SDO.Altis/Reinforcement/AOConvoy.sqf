waitUntil {sleep 0.5; !(isNil "currentAOUp")};
waitUntil {sleep 0.5; !(isNil "currentAO")};
private ["_SERVERUNITSCHECK1","_SERVERUNITSCHECKresistance","_SERVERUNITSCHECK","_giveup","_flatPos","_accepted","_found","_amount","_debugCounter","_road","_usedroads","_convoyPositionsArray","_name","_convoyPositionsArrayEND","_compare","_cnt","_roadpos","_nearUnits","_ConvoyGroup","_ConRandAmount","_directionEnd","_Convoy_Vehicle","_randomChopper","_wp","_Convoydead"];

if (DEBUG) then {diag_log "===============Reading CONVOY reinforcements====================";};

ConvoyAlive = false;
publicVariable "ConvoyAlive";

ConvoyUnits = [];
ConvoyVehicles = [];
_SERVERUNITSCHECK1 = 0;
_SERVERUNITSCHECKresistance = 0;
_SERVERUNITSCHECK = 0;
_giveup = false;

SafeRadiusAO = 5000;
SafeRadiusBASE = 3000;
SafeRadiusPlayers = 2000;

while {true} do
{
	_giveup = false;
		while {!_giveup} do 
		{
			// sleep before running the random creation
			if(DEBUG) then
				{
				// lower for testing
					sleep (1 + (random 1));
				}
				else
				{
					sleep (1800 + (random 600));
				};

			if (!ConvoyAlive) then
				{
					_SERVERUNITSCHECK1 = east countSide allunits;
					_SERVERUNITSCHECKresistance = resistance countSide allunits;
					_SERVERUNITSCHECK = (_SERVERUNITSCHECK1 + _SERVERUNITSCHECKresistance);
					sleep 1;
				};		
				
			if (_SERVERUNITSCHECK1 < PARAMS_TOTALMAXAI) then 
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
					_amount = 50;
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
						if(DEBUG) then
							{
							diag_log "Cant find a good convoy start position exit 1";
							};
						};

						_convoyPositionsArray = [getMarkerPos "Convoy_1",getMarkerPos "Convoy_2",getMarkerPos "Convoy_3",getMarkerPos "Convoy_4",getMarkerPos "Convoy_5",getMarkerPos "Convoy_6"];
						//--- shuffle
							_cnt = count _convoyPositionsArray;
								for "_i" from 1 to _cnt do {
									_convoyPositionsArray pushBack (_convoyPositionsArray deleteAt floor random _cnt);
								};
					if(DEBUG) then
					{
						diag_log format ["_convoyPositionsArray = %1",_convoyPositionsArray];
					};
						//--- create start point
						for "_i" from 0 to (count _convoyPositionsArray)-1 do
						{ 
							positionStart = _convoyPositionsArray select _i;
							//EntitiesList = positionStart nearEntities SafeRadiusPlayers;
							if (((positionStart distance (getMarkerPos "respawn_west")) > SafeRadiusBASE) && (positionStart distance (getMarkerPos "currentAO") > SafeRadiusAO)) exitwith 
								{
									positionStart;
									if (DEBUG) then 
										{
											_name ="Start";
											createMarkerLocal [_name,positionStart];
											_name setMarkerType "mil_dot";
											_name setMarkerText "   START POINT";
											diag_log format ["positionStart = %1",positionStart];
										};
								};
						};
						if (isNil "positionStart") exitwith {diag_log "failed to find a good Start marker pos"};
						
						/////////////////////////////////////////////////////////////////////////////////////
						//--- create END point
						_convoyPositionsArrayEND = _convoyPositionsArray;
						
						//--- shuffle
							_cnt = count _convoyPositionsArrayEND;
								for "_i" from 1 to _cnt do {
									_convoyPositionsArrayEND pushBack (_convoyPositionsArrayEND deleteAt floor random _cnt);
								};
						if (DEBUG) then
							{						
								diag_log format ["_convoyPositionsArrayEND = %1",_convoyPositionsArrayEND];
							};
						for "_i" from 0 to (count _convoyPositionsArrayEND)-1 do
						{ 
							positionEND = _convoyPositionsArrayEND select _i;
							//EntitiesListEND = positionEND nearEntities SafeRadiusPlayers;
							_compare = [positionEND, positionStart] call BIS_fnc_areEqual;
							if (((positionEND distance (getMarkerPos "respawn_west")) > SafeRadiusBASE) && (positionEND distance (getMarkerPos "currentAO") > SafeRadiusAO) && (!_compare)) exitwith 
								{
								positionEND;
										if (DEBUG) then 
										{
											_name ="End";
											createMarkerLocal [_name,positionEND];
											_name setMarkerType "mil_dot";
											_name setMarkerText "   End POINT";
											diag_log format ["positionEND = %1",positionEND];
										};
								
								};
						};
						if (isNil "positionEND") exitwith {diag_log "Convoy failed to find a good END marker pos"};
						
						
						_list = positionStart nearRoads _amount;
						if(count _list >= 2) then
						{
							_road = _list call BIS_fnc_selectRandom;
							_roadpos = getPos _road;
							_flatPos = _roadpos;								
						};
														
						if (((count _flatPos) == 3) && (!isNil "positionStart") && (!isNil "positionEND")) then {
							if ((_flatPos distance (getMarkerPos "respawn_west")) > SafeRadiusBASE && (_flatPos distance (getMarkerPos "currentAO")) > SafeRadiusAO) then 
							{
								_nearUnits = 0;
								{
									if ((_flatPos distance (getPos _x)) < 1500) then
									{
										_nearUnits = _nearUnits + 1;
									};
								} forEach Allplayers;

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
						diag_log "Convoy Cant find a good convoy start position exit 2";
					};
					
					_ConvoyGroup = createGroup Independent;
						
					_x = 0;
					_ConRandAmount = [2,3] call BIS_fnc_selectRandom;
					if(DEBUG) then {
						diag_log format ["_ConRandAmount = %1",_ConRandAmount];
					};
					
					
					//--- create lead vehicle
					_Convoy_Vehicle = [getPos _road,0,(Conv_Heavy_Armour_vehicles + Conv_APC_vehicles + Conv_Armed_Cars call BIS_fnc_selectRandom),_ConvoyGroup] call BIS_fnc_spawnVehicle;
					ConvoyVehicles set [count ConvoyVehicles, _Convoy_Vehicle select 0];
					
					_directionEnd = [_road, positionEND] call BIS_fnc_DirTo;
					
					//(_Convoy_Vehicle select 0) setDir _directionEnd;

					
					(vehicle (leader _ConvoyGroup)) spawn SDO_fnc_fuelMonitor;
					if !(isNil "dep_fnc_vehicledamage") then {
					[(_Convoy_Vehicle select 0)] spawn dep_fnc_vehicledamage;
					};
					_usedroads = _usedroads + [_road];
					sleep 0.5;
					
					//---create random amount and type vehs	
					for [{_x = 0}, {_x < _ConRandAmount}, {_x=_x+1}] do 
					{
						_roadConnectedTo = roadsConnectedTo _road;
						_connectedRoad = _roadConnectedTo select 0;
						if (_road distance positionEND > _connectedRoad distance positionEND) then {_connectedRoad = _roadConnectedTo select 1;};
						
						if (isNil "_connectedRoad") exitwith {diag_log "Convoy connected road Fail on nil";};
						if !(_connectedRoad in _usedroads) then 
						{
							_usedroads = _usedroads + [_connectedRoad];
							//_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
							_road = _connectedRoad;
							
							_Convoy_Vehicle = [getPos _connectedRoad,0,(Conv_Support_vehicles call BIS_fnc_selectRandom),_ConvoyGroup] call BIS_fnc_spawnVehicle;
							ConvoyVehicles set [count ConvoyVehicles, _Convoy_Vehicle select 0];
							//(_Convoy_Vehicle select 0) setDir _directionEnd;
							
							(vehicle (leader _ConvoyGroup)) spawn SDO_fnc_fuelMonitor;
							
							if !(isNil "dep_fnc_vehicledamage") then {
							[(_Convoy_Vehicle select 0)] spawn dep_fnc_vehicledamage;
							};
							sleep 0.5;
						};
					};

					//--- create AA vehicle
					_roadConnectedTo = roadsConnectedTo _road;
					_connectedRoad = _roadConnectedTo select 0;
					if (_road distance positionEND > _connectedRoad distance positionEND) then {_connectedRoad = _roadConnectedTo select 1;};
					
					if (!(_connectedRoad in _usedroads) && (!isNil "_connectedRoad") ) then 
					{
						_usedroads = _usedroads + [_connectedRoad];
						_Convoy_Vehicle = [getPos _connectedRoad,0,(Conv_AAA_Armour_vehicles + Conv_Heavy_Armour_vehicles + Conv_APC_vehicles + Conv_Armed_Cars call BIS_fnc_selectRandom),_ConvoyGroup] call BIS_fnc_spawnVehicle;
						ConvoyVehicles set [count ConvoyVehicles, _Convoy_Vehicle select 0];
						_road = _connectedRoad;
						
						(vehicle (leader _ConvoyGroup)) spawn SDO_fnc_fuelMonitor;
						if !(isNil "dep_fnc_vehicledamage") then {
							[(_Convoy_Vehicle select 0)] spawn dep_fnc_vehicledamage;
						};
						sleep 0.5;
					};
					
					
								//---  create a chopper random chance
			//--- bl1p made it never spawn for now
					_roadConnectedTo = roadsConnectedTo _road;
					_connectedRoad = _roadConnectedTo select 0;
					if (_road distance positionEND > _connectedRoad distance positionEND) then {_connectedRoad = _roadConnectedTo select 1;};
					
					if (!(_connectedRoad in _usedroads) && (!isNil "_connectedRoad") ) then 
					{
						_randomChopper = random 10;
						if (_randomChopper > 9) then 
						{
							_usedroads = _usedroads + [_connectedRoad];
							_Convoy_Vehicle = [getPos _connectedRoad,0,(Conv_Air_Attack_chop call BIS_fnc_selectRandom),_ConvoyGroup] call BIS_fnc_spawnVehicle;
							ConvoyVehicles set [count ConvoyVehicles, _Convoy_Vehicle select 0];
							_road = _connectedRoad;

							(vehicle (leader _ConvoyGroup)) spawn SDO_fnc_fuelMonitor;
							sleep 1;
						}
						else
						{
							_usedroads = _usedroads + [_connectedRoad];
							_Convoy_Vehicle = [getPos _connectedRoad,0,(Conv_Armed_Cars call BIS_fnc_selectRandom),_ConvoyGroup] call BIS_fnc_spawnVehicle;
							ConvoyVehicles set [count ConvoyVehicles, _Convoy_Vehicle select 0];
							_road = _connectedRoad;
								if !(isNil "dep_fnc_vehicledamage") then {
										[(_Convoy_Vehicle select 0)] spawn dep_fnc_vehicledamage;
									};
							(vehicle (leader _ConvoyGroup)) spawn SDO_fnc_fuelMonitor;
							sleep 1;
						};
					};
					
						
					if(DEBUG) then
					{
						diag_log format ["_ConvoyGroup = %1",_ConvoyGroup];
					};
				
					////////////////////////////////////////////////////////////////////travel 
					allConvoy = ConvoyUnits + ConvoyVehicles;
					
					_wp = _ConvoyGroup addWaypoint [positionEND,0];
					_wp setWaypointType "MOVE";
					_wp setWaypointSpeed "NORMAL";
					_wp setWaypointFormation "COLUMN";
					_wp setWaypointBehaviour "CARELESS";
					_wp setWaypointTimeOut [0,5,10];
					_wp setWaypointCompletionRadius 15;
					_wp setWaypointStatements ["true", "if (DEBUG) then {diag_log 'CONVOY REACHED DESTINATION';}; _nul = [] execVM 'Reinforcement\ConvoyEnd.sqf';"];
						

					//[_ConvoyGroup, positionEND, 250] call SDO_fnc_spawn2_perimeterPatrolConvoy;
						
				  
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

							[] spawn SDO_cleanGroups;
							
						};
					////////////////////////////
					
				};
			};
			sleep 60;
		};
sleep 60;
};