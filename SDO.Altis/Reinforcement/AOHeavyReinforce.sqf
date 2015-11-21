//////////////////////////////////////////////
// HEAVY reinf script by BL1P and Fluit     //
//////////////////////////////////////////////

waitUntil {sleep 0.5; !(isNil "currentAOUp")};
waitUntil {sleep 0.5; !(isNil "currentAO")};
private ["_priorityMessageJet","_Heavyreinforcementsdead","_SERVERUNITSCHECKHre","_randHeavyChance","_SERVERUNITSCHECKHreResistance","_SERVERUNITSCHECKHre1"];

if (DEBUG) then {diag_log "===============Reading HEAVY reinforcements====================";};

ReinforcedPlane = false;
//publicvariable "ReinforcedPlane";

ReinforcedTank = false;
//publicvariable "ReinforcedTank";

HeavyReinforcementUnits = [];
HeavyReVehicles = [];

_SERVERUNITSCHECKHre1 = 0;

while {true} do 
{
	if(DEBUG) then
		{
			sleep (10 + (random 10));
		}
		else
		{
			sleep (120 + (random 60));
		};
	
	_randHeavyChance = random 10;
		

	
if ((radioTowerAlive && !ReinforcedPlane && spottedPlane) || (radioTowerAlive && !ReinforcedTank && spottedTank)) then
	{
		_SERVERUNITSCHECKHre1 = east countSide allunits;
	
		sleep 1;
		if(DEBUG) then
					{
						diag_log format ["_SERVERUNITSCHECKHre1 (all east Units) = %1",_SERVERUNITSCHECKHre1];
					};
			if(DEBUG) then
					{
						diag_log format ["_randHeavyChance = %1 PARAMS_HeavyReinforcement = %2  (%1 <= %2 ?)",_randHeavyChance,PARAMS_HeavyReinforcement];
					};
				
	};			
		//send plane
		if (radioTowerAlive && spottedPlane && (_SERVERUNITSCHECKHre1 < PARAMS_TOTALMAXAI) && (_randHeavyChance <= PARAMS_HeavyReinforcement)) then 
		{

			//check not already reinforced
			if !(ReinforcedPlane) then 
			{
				// clear any old triggers
				if (!isNil ("_upsZoneAir")) then {if (DEBUG) then {diag_log "_upsZoneAir was not nil removing";};deleteVehicle _upsZoneAir;};
				
				//create and check random pos
				_patrolCreatePos = [getMarkerPos currentAO, 5000,7] call SDO_fnc_randomPosbl1p;
				if ((count _patrolCreatePos) == 3) then 
				{		
					//choose a random type
					_planeRandomChance = random 9;
					if (_planeRandomChance <= 4) then
					{
						//_patrolPos = getMarkerPos currentAO;
						_helo_Patrol = createGroup EAST;
					
						_helo_Array = [[_patrolCreatePos select 0,_patrolCreatePos select 1,1000], 20, (SDO_Air_Attack_plane call BIS_fnc_selectRandom), east] call BIS_fnc_spawnVehicle;
						_helo_Patrol = _helo_Array select 0;
						_helo_crew = _helo_Array select 1;
						HeavyReVehicles set [count HeavyReVehicles, _helo_Array select 0];
						
						_upsZoneAir = createTrigger ["EmptyDetector", getMarkerPos currentAO];
						_upsZoneAir setTriggerArea [PARAMS_AOSize+500, PARAMS_AOSize+500, 0, false];
						
							[(leader _helo_Patrol), "aoCircle"] execVM "scripts\UPS_BL1P.sqf";
						
						// declare some variables
						ReinforcedPlane = true;
						//publicvariable "ReinforcedPlane";
						if(DEBUG) then
						{
						diag_log format ["====REINFORCEMENT Creating  = %1=====",_helo_Patrol];
						diag_log format ["=== Reinf plane created variable ReinforcedPlane = %1  spottedPlane = %2 ====",ReinforcedPlane,spottedPlane];
						};
						/// Create marker for debug
								if(DEBUG) then
									{
										_name = format ["%1%2",name (leader _helo_Patrol),_x];
										createMarker [_name,getPos (leader _helo_Patrol)];
										_name setMarkerType "o_unknown";
										_name setMarkerText format ["Plane Reinf %1",_x];
										_name setMarkerColor "ColorRed";
										[_helo_Patrol,_name] spawn
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
						
						
						//waituntill its dead or cant move
						waitUntil 
						{
							sleep 5; 
							!alive _helo_Patrol || {!canMove _helo_Patrol}
						};
						//destoy vehicle and pilots
						sleep 5;
						_helo_Patrol setDamage 1;
						sleep 5;
						deleteVehicle _helo_Patrol;

						{
							_x setDamage 1;
							sleep 5;
							deleteVehicle _x;
						} foreach _helo_crew;
						
						if (!isNil ("_upsZone")) then {if (DEBUG) then {diag_log "_upsZone was not nil removing";};deleteVehicle _upsZone;};
						//declare some variables
						ReinforcedPlane = false;
						//publicvariable "ReinforcedPlane";
						
						spottedPlane = false;
						//publicvariable "spottedPlane";
						if(DEBUG) then
						{
						
						diag_log format ["=== Reinf Plane Destroyed variable ReinforcedPlane = %1 ===",ReinforcedPlane];
						diag_log format ["=== Reinf script reset spot var spottedPlane  = %1 ===",spottedPlane];
						};
					};
					//or this type
					if (_planeRandomChance > 4 ) then
					{
						//_patrolPos = getMarkerPos currentAO;
						_helo_Patrol = createGroup EAST;
						//diag_log "====creating O_Heli_Attack_02_F ====";
						_helo_Array = [[_patrolCreatePos select 0,_patrolCreatePos select 1,1000], 20, (SDO_Air_Attack_chop call BIS_fnc_selectRandom), east] call BIS_fnc_spawnVehicle;
						_helo_Patrol = _helo_Array select 0;
						_helo_crew = _helo_Array select 1;
						HeavyReVehicles set [count HeavyReVehicles, _helo_Array select 0];
						
						_upsZoneAir = createTrigger ["EmptyDetector", getMarkerPos currentAO];
						_upsZoneAir setTriggerArea [PARAMS_AOSize+500, PARAMS_AOSize+500, 0, false];
						
							nul=[(leader _helo_Patrol), "aoCircle"] execVm "scripts\UPSMON.sqf";
							[(leader _helo_Patrol), "aoCircle"] execVM "scripts\UPS_BL1P.sqf";
						
						// declare some variables
						ReinforcedPlane = true;
						//publicvariable "ReinforcedPlane";
						if(DEBUG) then
						{
						diag_log format ["====REINFORCEMENT Creating  = %1=====",_helo_Patrol];
						diag_log format ["=== Reinf plane created variable ReinforcedPlane = %1  spottedPlane = %2 ====",ReinforcedPlane,spottedPlane];
						};
						
						/// Create marker for debug
								if(DEBUG) then
									{
										_name = format ["%1%2",name (leader _helo_Patrol),_x];
										createMarker [_name,getPos (leader _helo_Patrol)];
										_name setMarkerType "o_unknown";
										_name setMarkerText format ["Chopper Reinf %1",_x];
										_name setMarkerColor "ColorRed";
										[_helo_Patrol,_name] spawn
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
						
						
						//waituntill its dead or cant move
						waitUntil 
						{
							sleep 5; 
							!alive _helo_Patrol || {!canMove _helo_Patrol}
						};
						//destoy vehicle and pilots
						sleep 5;
						_helo_Patrol setDamage 1;
						sleep 5;
						deleteVehicle _helo_Patrol;

						{
							_x setDamage 1;
							sleep 5;
							deleteVehicle _x;
						} foreach _helo_crew;
						
						if (!isNil ("_upsZone")) then {if (DEBUG) then {diag_log "_upsZone was not nil removing";};deleteVehicle _upsZone;};
						//declare some variables
						ReinforcedPlane = false;
						//publicvariable "ReinforcedPlane";
						
						spottedPlane = false;
						//publicvariable "spottedPlane";
						if(DEBUG) then
						{

						diag_log format ["=== Reinf Plane Destroyed variable ReinforcedPlane = %1 ===",ReinforcedPlane];
						diag_log format ["=== Reinf script reset spot var spottedPlane  = %1 ===",spottedPlane];
						
						};
						
					};
						
				}
				else
				{
					diag_log "DID NOT CREATE REINFORCE PLANE NO RANDPOS";
				};
			};
		};
		// send tanks
		if (radioTowerAlive && spottedTank && (_SERVERUNITSCHECKHre1 < PARAMS_TOTALMAXAI) && (_randHeavyChance <= PARAMS_HeavyReinforcement)) then 
		{
			if !(ReinforcedTank) then 
			{
				_x = 0;
				for "_x" from 1 to 2 do //create 2 groups
				{
					//_patrolPos = getMarkerPos currentAO;
					_randomPos = [getMarkerPos currentAO, 3000] call SDO_fnc_randomPosbl1p;
					
					_HeavyRandomChance = random 6;
					if (_HeavyRandomChance <= 3) then
					{
						_ReinfarmourGroup = createGroup east;
					
						_armour = [_randomPos,0,(SDO_Heavy_Armour_vehicles call Bis_fnc_SelectRandom),_ReinfarmourGroup] call BIS_fnc_spawnVehicle;

						HeavyReVehicles set [count HeavyReVehicles, _armour select 0];
						sleep 1;
						[_ReinfarmourGroup, getMarkerPos currentAO,250] call SDO_fnc_spawn2_perimeterPatrolBL1P;
						(vehicle (leader _ReinfarmourGroup)) spawn SDO_fnc_fuelMonitor;
						if !(isNil "dep_fnc_vehicledamage") then {
						[(_armour select 0)] spawn dep_fnc_vehicledamage;
						};

						ReinforcedTank = true;
						//publicvariable "ReinforcedTank";
						if(DEBUG) then
						{
						diag_log format ["====REINFORCEMENT Creating  = %1=====",_armour];
						diag_log format ["=== Reinf Tanks created variable ReinforcedTank = %1  spottedTank = %2 === ",ReinforcedTank,spottedTank];
						diag_log format ["_ReinfarmourGroup = %1",_ReinfarmourGroup];
						};
						
						/// Create marker for debug
								if(DEBUG) then
									{
										_name = format ["%1%2",name (leader _ReinfarmourGroup),_x];
										createMarker [_name,getPos (leader _ReinfarmourGroup)];
										_name setMarkerType "o_unknown";
										_name setMarkerText format ["Tank Reinf %1",_x];
										_name setMarkerColor "ColorRed";
										[_ReinfarmourGroup,_name] spawn
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
						
						{
						  HeavyReinforcementUnits set [count HeavyReinforcementUnits, _x];
						  //publicvariable "HeavyReinforcementUnits";
						} forEach units _ReinfarmourGroup;
						
					};
			
				};	
			}
			else 
			{
				// Fluit: Check if reinforcements are all dead
				_Heavyreinforcementsdead = true;
				{
				  if (alive _x) then 
				  {
						_Heavyreinforcementsdead = false;
				  };
				} forEach HeavyReinforcementUnits;

				// If all dead reset the reinforcement status
				if (_Heavyreinforcementsdead) then 
				{
					if(DEBUG) then
					{
					diag_log format ["=== Reinf Tank destroyed variable ReinforcedTank = %1 === ",ReinforcedTank];
					diag_log format ["=== Reinf script reset spot var spottedTank  = %1 === ",spottedTank];
					};	
					HeavyReinforcementUnits = [];
					//publicvariable "HeavyReinforcementUnits";
						
					HeavyReVehicles = [];
					//publicvariable "HeavyReVehicles";
						
					ReinforcedTank = false;
					//publicvariable "ReinforcedTank";
					
					spottedTank = false;
					//publicvariable "spottedTank";
				};
			};
		};
    sleep 5;
};