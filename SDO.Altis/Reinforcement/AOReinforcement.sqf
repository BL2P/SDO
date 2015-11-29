//////////////////////////////////////////////
// LIGHT reinf script by BL1P and Fluit     //
//////////////////////////////////////////////
waitUntil {sleep 0.5; !(isNil "currentAOUp")};
waitUntil {sleep 0.5; !(isNil "currentAO")};
private ["_priorityMessageHelo", "_reinforcementsdead","_SERVERUNITSCHECKRE","_roadList","_road","_roadPos","_SERVERUNITSCHECKRE1","_SERVERUNITSCHECKREresistance", "_remainingunits", "_totalunits"];

if (DEBUG) then {diag_log "***Reading LIGHT reinforcements====================";};

Reinforced = false;
//publicvariable "Reinforced";

ReinforcementUnits = [];
ReinforcementVehicles = [];

_remainingunits = 0;
_totalunits = 0;

_SERVERUNITSCHECKRE1 = 0;

while {true} do 
{
	if(DEBUG) then
		{
			sleep (10 + (random 10));
		}
		else
		{
			sleep (180 + (random 120))
		};
		
		_randReinfChance = random 10;

		if (radioTowerAlive && !Reinforced && spotted) then
			{
				_SERVERUNITSCHECKRE1 = east countSide allunits;
				sleep 1;
				if(DEBUG) then
							{
								diag_log format ["***Alowed amount of total east AI = %2 Current amount of east AI = %1",_SERVERUNITSCHECKRE1,PARAMS_TOTALMAXAI];
							};
							
				if(DEBUG) then
					{
						diag_log format ["***_randReinfChance = %1 PARAMS_AOReinforcement = %2 (%1 <= %2 ?)",_randReinfChance,PARAMS_AOReinforcement];
					};
			};	
			
        if (radioTowerAlive && spotted  && (_SERVERUNITSCHECKRE1 < PARAMS_TOTALMAXAI) && (_randReinfChance <= PARAMS_AOReinforcement)) then //is tower alive and is spotted and server isnt over loaded
		{
			if !(Reinforced) then // is it already reinforced 
			{
					_randreinforce = random 10;
					//_randreinforce = 9; //used to force a group
					if (_randreinforce <= 6) then //infantry
					{
						_x = 0;
						for "_x" from 1 to 3 do //create 3 groups
						{
							if(DEBUG) then
							{
							diag_log "***starting infantry reinforcmenets==============================";
							diag_log format ["***Reinforce = %1",Reinforced];
							};
							//random radius pos from ao center
							_randomPos = [getMarkerPos currentAO, 2000] call SDO_fnc_randomPosbl1p;
							_RandSquad = [AO_Squad_Basic,AO_Squad_Grenadier,AO_Squad_AT,AO_Squad_AA] call BIS_fnc_selectRandom;
							if ((count _randomPos) == 3) then 
							{
								_spawnReInfGroup = createGroup EAST;
								
								{
									_x createUnit [_randomPos, _spawnReInfGroup];
								} foreach _RandSquad;
								
								//[_spawnReInfGroup, getMarkerPos currentAO,250] call SDO_fnc_spawn2_perimeterPatrolBL1P;
								[_spawnReInfGroup, getMarkerPos currentAO,250] call SDO_fnc_spawn2_randomPatrolBL1P;
								
								{
								  ReinforcementUnits set [count ReinforcementUnits, _x];
								  //publicvariable "ReinforcementUnits";
								} forEach units _spawnReInfGroup;
								if(DEBUG) then
								{
								diag_log format ["***reinforcement count = %1",count ReinforcementUnits];
								};
								
								/// Create marker for debug
								if(DEBUG) then
									{
										_name = format ["%1%2",name (leader _spawnReInfGroup),_x];
										createMarker [_name,getPos (leader _spawnReInfGroup)];
										_name setMarkerType "o_unknown";
										_name setMarkerText format ["Inf Reinf %1",_x];
										_name setMarkerColor "ColorRed";
										[_spawnReInfGroup,_name] spawn
										{
											private["_group","_marker"];
											_group = _this select 0;
											_marker = _this select 1;

											while{count (units _group) > 0} do
											{
												_marker setMarkerPos (getPos (leader _group));
												sleep 1;
											};
											deleteMarker _marker;
										};
									};
								
								Reinforced = true;
								//publicvariable "Reinforced";
								sleep 1;
							}
							else
							{
							 diag_log "***DID NOT CREATE INF REINF FAILED ON RANDPOS";
							};
						};
					};
					
/////////////////////////////////////////////////////////////////////////////////

				if (_randreinforce > 6 && _randreinforce <=8) then //light armour
				{
					
					_x = 0;
					for "_x" from 1 to 3 do //create 2 groups
					{
					if(DEBUG) then
					{
						diag_log "***starting CARS reinforcmenets==============================";
						diag_log format ["***Reinforce = %1",Reinforced];
					};	
						//random radius pos from ao center
						_Arm_Patrol = createGroup east;
						_randomPos = [getMarkerPos currentAO, 3000] call SDO_fnc_randomPosbl1p;
						//find a road if posible
						_roadList = _randomPos nearRoads 2000;
						if (((count _randomPos) == 3) && ((count _roadList) != 0)) then 
						{
							_awayFromBase = false;
							while {!_awayFromBase} do
							{
								_road = _roadList call BIS_fnc_selectRandom;
								_roadPos = getPos _road;
								
								if (_roadPos distance (getMarkerPos "respawn_west") > 1000 && (_roadPos distance (getMarkerPos currentAO)) > 1000) then
								{
									_awayFromBase = true;
								};
							};	
							
							_veh = [_roadPos,0,(SDO_Armed_Cars call BIS_fnc_selectRandom),_Arm_Patrol] call BIS_fnc_spawnVehicle;
							ReinforcementVehicles set [count ReinforcementVehicles, _veh select 0];
							
							//[_Arm_Patrol, getMarkerPos currentAO,250] call SDO_fnc_spawn2_perimeterPatrolBL1P;
							[_Arm_Patrol, getMarkerPos currentAO,250] call SDO_fnc_spawn2_randomPatrolBL1P;
							
							(vehicle (leader _Arm_Patrol)) spawn SDO_fnc_fuelMonitor;
							if !(isNil "dep_fnc_vehicledamage") then {
							[(_veh select 0)] spawn dep_fnc_vehicledamage;
							};
							
							{
							  ReinforcementUnits set [count ReinforcementUnits, _x];
							  //publicvariable "ReinforcementUnits";
							} forEach units _Arm_Patrol;
							if(DEBUG) then
							{
							diag_log format ["***reinforcement count = %1",count ReinforcementUnits];
							};
							
							/// Create marker for debug
								if(DEBUG) then
									{
										_name = format ["%1%2",name (leader _Arm_Patrol),_x];
										createMarker [_name,getPos (leader _Arm_Patrol)];
										_name setMarkerType "o_unknown";
										_name setMarkerText format ["CAR Reinf %1",_x];
										_name setMarkerColor "ColorRed";
										[_Arm_Patrol,_name] spawn
										{
											private["_group","_marker"];
											_group = _this select 0;
											_marker = _this select 1;

											while{count (units _group) > 0} do
											{
												_marker setMarkerPos (getPos (leader _group));
												sleep 1;
											};
											deleteMarker _marker;
										};
									};
							
							
							Reinforced = true;
							//publicvariable "Reinforced";
							sleep 1;
						}
						else
						{
						diag_log "***DID NOT CREATE CARS REINF FAILED ON RANDPOS";
						};
					};
				};
				
/////////////////////////////////////////////////////////////////////////////////
				
				if (_randreinforce > 9) then
				{
					
					_x = 0;
					for "_x" from 1 to 2 do //create 3 groups
					{
						if(DEBUG) then
						{
						diag_log "***starting light arm reinforcmenets==============================";
						diag_log format ["***Reinforce = %1",Reinforced];
						};
						//random radius pos from ao center
						_randomPos = [getMarkerPos currentAO, 3000] call SDO_fnc_randomPosbl1p;
						//find a road if posible
						_roadList = _randomPos nearRoads 2000;
						
						if (((count _randomPos) == 3) && ((count _roadList) != 0)) then 
						{
						
							_awayFromBase = false;
							while {!_awayFromBase} do
							{
								_road = _roadList call BIS_fnc_selectRandom;
								_roadPos = getPos _road;
								
								if (_roadPos distance (getMarkerPos "respawn_west") > 1000 && (_roadPos distance (getMarkerPos currentAO)) > 1000) then
								{
									_awayFromBase = true;
								};
							};
							_Arm_Patrol = createGroup east;
							_veh = [_randomPos,0,(SDO_APC_vehicles call BIS_fnc_selectRandom),_Arm_Patrol] call BIS_fnc_spawnVehicle;
							ReinforcementVehicles set [count ReinforcementVehicles, _veh select 0];
							
							//[_Arm_Patrol, getMarkerPos currentAO,250] call SDO_fnc_spawn2_perimeterPatrolBL1P;
							[_Arm_Patrol, getMarkerPos currentAO,250] call SDO_fnc_spawn2_randomPatrolBL1P;
							
							(vehicle (leader _Arm_Patrol)) spawn SDO_fnc_fuelMonitor;
							if !(isNil "dep_fnc_vehicledamage") then {
							[(_veh select 0)] spawn dep_fnc_vehicledamage;
							};
							
							
							{
							  ReinforcementUnits set [count ReinforcementUnits, _x];
							  //publicvariable "ReinforcementUnits";
							} forEach units _Arm_Patrol;
							
							if(DEBUG) then
							{
							diag_log format ["***reinforcement count = %1",count ReinforcementUnits];
							};
							
							/// Create marker for debug
								if(DEBUG) then
									{
										_name = format ["%1%2",name (leader _Arm_Patrol),_x];
										createMarker [_name,getPos (leader _Arm_Patrol)];
										_name setMarkerType "o_unknown";
										_name setMarkerText format ["L Arm Reinf %1",_x];
										_name setMarkerColor "ColorRed";
										[_Arm_Patrol,_name] spawn
										{
											private["_group","_marker"];
											_group = _this select 0;
											_marker = _this select 1;

											while{count (units _group) > 0} do
											{
												_marker setMarkerPos (getPos (leader _group));
												sleep 1;
											};
											deleteMarker _marker;
										};
									};
							
							
							Reinforced = true;
							//publicvariable "Reinforced";
							sleep 1;
						}
						else
						{
						diag_log "***DID NOT CREATE ARMOUR REINF FAILED ON RANDPOS";
						};
					};
				};
				if(DEBUG) then
				{
				diag_log format ["***TOTAL reinforcement count = %1",count ReinforcementUnits];
				};
                _totalunits = count ReinforcementUnits;
			} 
			else 
			{
				//--- Fluit: Check if reinforcements are all dead
                _remainingunits = 0;
				{
				  if (alive _x) then {
						_remainingunits = _remainingunits + 1;
				  };
				} forEach ReinforcementUnits;

				//--- If all dead reset the reinforcement status
                
                if(DEBUG) then
				{
                    diag_log format ["***Total Ref units %1   Remaining Ref units %2",_totalunits, _remainingunits];
				};
                if (_totalunits > 0) then {
                    if ((_remainingunits / _totalunits) <= 0.5) then 
                    {
                            Reinforced = false;
                            ReinforcementUnits = [];
                            
                            //ReinforcementVehicles =[];
                            //--- reset spotters
                            spotted = false;
                    };
                };
			};
		};
sleep 30;
};