//===================================//
//==========Create Units===============//
//==========BL1P EDIT===============//
//===================================//

if (DEBUG) then {diag_log "***READING the Create_units.sqf";};

SDO_fnc_spawnUnits = 
{
//===================================//
//==========Start create untis============//
//===================================//
		waitUntil {!isNil "fluitfunctions"};

		if (DEBUG) then 
		{
		diag_log "***AO AI CREATION ( SDO_fnc_spawnUnits ) FUNC STARTED=============";
		diag_log format ["***currentAO = %1",currentAO];
		};

		private ["_randomPos","_spawnGroup","_pos","_x","_armourGroup","_armour","_airGroup","_air","_airType","_randmort","_ExtOrCenterChance"];
		_pos = getMarkerPos (_this select 0);
		_enemiesArray = [grpNull];
		_houses = [];

		// check and remove this list of mortars
		if (!isNil ("mortar1")) then {if (DEBUG) then {diag_log "***mortar1 was not nil removing";};deleteVehicle mortar1;}; 
		if (!isNil ("mortar2")) then {if (DEBUG) then {diag_log "***mortar2 was not nil removing";};deleteVehicle mortar2;}; 
		
		// check and remove this list of groups
		if (!isNil ("_spawnGroupSN")) then {if (DEBUG) then {diag_log "***_spawnGroupSN was not nil removing";};deleteGroup _spawnGroupSN;};
		if (!isNil ("_spawnGroup")) then {if (DEBUG) then {diag_log "***_spawnGroup was not nil removing";};deleteGroup _spawnGroup;};
		if (!isNil ("_spawnGroupSP")) then {if (DEBUG) then {diag_log "***_spawnGroupSP was not nil removing";};deleteGroup _spawnGroupSP;};
		if (!isNil ("_spawnGroupSPX")) then {if (DEBUG) then {diag_log "***_spawnGroupSPX was not nil removing";};deleteGroup _spawnGroupSPX;};
		if (!isNil ("_spawngroupcar")) then {if (DEBUG) then {diag_log "***_spawnGroupcar was not nil removing";};deleteGroup _spawngroupcar;};
		if (!isNil ("_armourGroup")) then {if (DEBUG) then {diag_log "***_armourGroup was not nil removing";};deleteGroup _armourGroup;};
		if (!isNil ("_airGroup")) then {if (DEBUG) then {diag_log "***_airGroup was not nil removing";};deleteGroup _airGroup;};


			
//////////////////////////////////////////////////////// CAMPS START ////////////////////////////////////////////////////////

campArray = []; publicVariable "campArray";
_numberofcamps = PARAMS_RAMCamps;
if (PARAMS_RAMCamps < 0)  then {
    _numberofcamps = round (random 3);
};    
[_numberofcamps, 200, getMarkerPos currentAO, 400, [getMarkerPos "respawn_west"]] call random_camps;

_enemiesArray = _enemiesArray + campArray;
//////////////////////////////////////////////////////// CAMPS END ////////////////////////////////////////////////////////


//////////////////////////////////////////////////////// ROADBLOCKS START ////////////////////////////////////////////////////////
if (PARAMS_Roadblocks == 1 && _numberofcamps <= 2) then {
	[round (random 2), 1000, getMarkerPos currentAO, 400 + round (random 400)] call defensive_roadblocks;
};
//////////////////////////////////////////////////////// ROADBLOCKS END ////////////////////////////////////////////////////////

//////////////////////////////////////////////////////// MORTAR START ////////////////////////////////////////////////////////			
	//-- define vars for mortars	
	Mortars = [];
	_randmort = random 10;
	Createmortars = false;
	if (random 10 <= PARAMS_MortarChance) then {
		Createmortars = true;
	};
	_interior = false;
	if (random 10 <= PARAMS_INOUTMortarChance) then {
		_interior = true;
	};

	if(DEBUG) then {
		if (Createmortars) then	{
			diag_log format ["***CREATING MORTARS ==== _randmort = %1 PARAMS_MortarChance = %2",_randmort,PARAMS_MortarChance];
		} else {
			diag_log format ["***NOT CREATING MORTARS ==== _randmort = %1 PARAMS_MortarChance = %2 ",_randmort,PARAMS_MortarChance];
		};
	};
	
	if (Createmortars) then {
		_radius = 1000;
		if (_interior) then {
			if(DEBUG) then { diag_log "***creating mortars INSIDE AO ===========";};
			_radius = 20 + round (random 40);
		} else {
			if(DEBUG) then { diag_log "***creating mortars OUTSIDE AO ===========";};
		};
		_camplocations = [1, getMarkerPos currentAO, _radius, ceil (random 3)] call random_mortar_camps;
		_enemiesArray = _enemiesArray + campArray;
	
		sleep 0.5;	
		// Spotters
		_x = 0;
		_rand = [2,3,4,5] call BIS_fnc_selectRandom;
		if (DEBUG) then {diag_log format ["***Creating %1 MORTSPOT=====",_rand];};
		for "_x" from 1 to _rand do 
		{
			_randomPos = [getMarkerPos currentAO, 350,2] call SDO_fnc_randomPos;
			if ((count _randomPos) == 3) then 
			{
				_spawnGroupSP = createGroup EAST;
				
				 SDO_u_AO_sl createUnit [_randomPos, _spawnGroupSP];
				
				(leader _spawnGroupSP) addWeapon "Rangefinder";
				(leader _spawnGroupSP) addItem "NVGoggles_OPFOR";
				(leader _spawnGroupSP) assignItem "NVGoggles_OPFOR";
				//(leader _spawnGroupSP) selectWeapon "Rangefinder";
				removebackpack (leader _spawnGroupSP);
				(leader _spawnGroupSP) addbackpack "UK3CB_BAF_B_Bergen_MTP_Radio_H_A";

				//[_spawnGroupSP, getMarkerPos currentAO,350] call SDO_fnc_spawn2_randomPatrol;
				[_spawnGroupSP, getMarkerPos currentAO,375] call SDO_fnc_spawn2_perimeterPatrol;
				
				// run mortar spotter if mortars are present
				if (count Mortars > 0) then 
				{
					[(leader _spawnGroupSP), Mortars] execVM "Server\Server_Scripts\mortar_spotter.sqf";
				};
				sleep 1;
				if(DEBUG) then
				{
					_name = format ["%1%2",name (leader _spawnGroupSP),_x];
					createMarker [_name,getPos (leader _spawnGroupSP)];
					_name setMarkerType "o_unknown";
					_name setMarkerText format ["M Spotters %1",_x];
					_name setMarkerColor "ColorRed";
					[_spawnGroupSP,_name] spawn
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

				_enemiesArray = _enemiesArray + [_spawnGroupSP];
			}
			else
			{
				diag_log "***DID NOT CREATE SPOTTERS FAILED ON RAND POS";
			};
		};
	};
//////////////////////////////////////////////////////// MORTAR END ////////////////////////////////////////////////////////		
			
//////////////////////////////////////////////////////// SQPAT START ////////////////////////////////////////////////////////
		// squad patrol UPS
			_x = 0;
			if (DEBUG) then {diag_log format ["***Creating %1 SQPAT=====",PARAMS_SquadsPatrol];};
			for "_x" from 1 to PARAMS_SquadsPatrol do 
			{
				
				_randomPos = [getMarkerPos currentAO, PARAMS_AOSize,2] call SDO_fnc_randomPos;
				if ((count _randomPos) == 3) then 
				{	
					_spawnGroup = createGroup EAST;
					_randomtype = random 12;
					if (_randomtype <=3) then 
						{
							{
								_x createUnit [_randomPos, _spawnGroup];
							} foreach AO_Squad_Basic;
						};
					if ((_randomtype >3) && (_randomtype <=6)) then 
						{
							{
								_x createUnit [_randomPos, _spawnGroup];
							} foreach AO_Squad_Grenadier;
						};
					if ((_randomtype >6) && (_randomtype <=9)) then 
						{
							{
								_x createUnit [_randomPos, _spawnGroup];
							} foreach AO_Squad_AT;
						};
					if (_randomtype >9) then 
						{
							{
								_x createUnit [_randomPos, _spawnGroup];
							} foreach AO_Squad_AA;
						};
					
					sleep 0.5;
					[_spawnGroup, getMarkerPos currentAO, PARAMS_AOSize] call SDO_fnc_spawn2_randomPatrol;
					sleep 0.5;
					
					{
					_x execVM "Server\Server_Scripts\AO_unitinit.sqf";
					sleep 0.01;
					} foreach units _spawnGroup;
					
					sleep 0.5;
					[(leader _spawnGroup)] execVM "Server\Server_Scripts\spotter.sqf";
					removebackpack (leader _spawnGroup);
					(leader _spawnGroup) addbackpack "UK3CB_BAF_B_Bergen_MTP_Radio_H_A";
					sleep 1;
					if(DEBUG) then
					{
						_name = format ["%1%2",name (leader _spawnGroup),_x];
						createMarker [_name,getPos (leader _spawnGroup)];
						_name setMarkerType "o_unknown";
						_name setMarkerText format ["Sq-Pat %1",_x];
						_name setMarkerColor "ColorRed";
						[_spawnGroup,_name] spawn
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

					_enemiesArray = _enemiesArray + [_spawnGroup];
				}
				else
				{
					diag_log "***DID NOT CREATE SQPATUPS BECAUSE OF FAILED RANDOM POS====";
				};
			};
//////////////////////////////////////////////////////// SQPAT END ////////////////////////////////////////////////////////	

//////////////////////////////////////////////////////// DEFPAT START ////////////////////////////////////////////////////////		
		//--- Defence pat NONE UPS
			_x = 0;
			if (DEBUG) then {diag_log format ["***Creating %1 DEFSQ=====",PARAMS_SquadsDefend];};
			for "_x" from 1 to PARAMS_SquadsDefend do {
				
				_randomPos = [getMarkerPos currentAO, 200,2] call SDO_fnc_randomPos;
				if ((count _randomPos) == 3) then 
				{
					_spawnGroup = createGroup EAST;
					
					_randomtype = random 12;
					if (_randomtype <=3) then 
						{
							{
								_x createUnit [_randomPos, _spawnGroup];
							} foreach AO_Squad_Basic;
						};
					if ((_randomtype >3) && (_randomtype <=6)) then 
						{
							{
								_x createUnit [_randomPos, _spawnGroup];
							} foreach AO_Squad_Grenadier;
						};
					if ((_randomtype >6) && (_randomtype <=9)) then 
						{
							{
								_x createUnit [_randomPos, _spawnGroup];
							} foreach AO_Squad_AT;
						};
					if (_randomtype >9) then 
						{
							{
								_x createUnit [_randomPos, _spawnGroup];
							} foreach AO_Squad_Heavy;
						};
					
					sleep 0.5;
					[_spawnGroup, getMarkerPos currentAO,75] call SDO_fnc_spawn2_perimeterPatrol;
					sleep 0.5;
					
					sleep 0.5;
					{
					_x execVM "Server\Server_Scripts\AO_unitinit.sqf";
					sleep 0.01;
					} foreach units _spawnGroup;
					sleep 0.5;
					(leader _spawnGroup) setVariable ["asr_ai_exclude", true];
					
					if(DEBUG) then
					{
						_name = format ["%1%2",name (leader _spawnGroup),_x];
						createMarker [_name,getPos (leader _spawnGroup)];
						_name setMarkerType "o_unknown";
						_name setMarkerText format ["Def-Sq %1",_x];;
						_name setMarkerColor "ColorRed";
						[_spawnGroup,_name] spawn
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

					_enemiesArray = _enemiesArray + [_spawnGroup];
				}
				else
				{
					diag_log "***DID NOT CREATE DEFSQ BECAUSE OF FAILED RANDOM POS====";
				};
			};
//////////////////////////////////////////////////////// DEFPAT END ////////////////////////////////////////////////////////
	
//////////////////////////////////////////////////////// MIDPAT START ////////////////////////////////////////////////////////
		// MID MidPatrol NONE UPS
			_x = 0;
			if (DEBUG) then {diag_log format ["***Creating %1 MIDPAT=====",PARAMS_MidPatrol];};
			for "_x" from 1 to PARAMS_MidPatrol do {
				_randomPos = [getMarkerPos currentAO, 450,2] call SDO_fnc_randomPosbl1p;
				if ((count _randomPos) == 3) then 
				{
					_spawnGroup = createGroup EAST;
					//-- type chance
					_randomtype = random 12;
										if (_randomtype <=3) then 
						{
							{
								_x createUnit [_randomPos, _spawnGroup];
							} foreach AO_Squad_Basic;
						};
					if ((_randomtype >3) && (_randomtype <=6)) then 
						{
							{
								_x createUnit [_randomPos, _spawnGroup];
							} foreach AO_Squad_Grenadier;
						};
					if ((_randomtype >6) && (_randomtype <=9)) then 
						{
							{
								_x createUnit [_randomPos, _spawnGroup];
							} foreach AO_Squad_AT;
						};
					if (_randomtype >9) then 
						{
							{
								_x createUnit [_randomPos, _spawnGroup];
							} foreach AO_Squad_AA;
						};
					
					
						sleep 0.5;
						[_spawnGroup, getMarkerPos currentAO, PARAMS_AOSize - 250] call SDO_fnc_spawn2_randomPatrol;
						sleep 0.5;
						{
						_x execVM "Server\Server_Scripts\AO_unitinit.sqf";
						sleep 0.01;
						} foreach units _spawnGroup;
						
						sleep 0.5;						
						
						sleep 1;
						
						if(DEBUG) then
						{
							_name = format ["%1%2",name (leader _spawnGroup),_x];
							createMarker [_name,getPos (leader _spawnGroup)];
							_name setMarkerType "o_unknown";
							_name setMarkerText format ["Mid-Pat %1",_x];;
							_name setMarkerColor "ColorRed";
							[_spawnGroup,_name] spawn
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
					
					_enemiesArray = _enemiesArray + [_spawnGroup];
				}
				else
				{
					diag_log "***DID NOT CREATE MIDPAT BECAUSE OF FAILED RANDOM POS====";
				};
			};
//////////////////////////////////////////////////////// MIDPAT END ////////////////////////////////////////////////////////	

//////////////////////////////////////////////////////// EXTPAT START ////////////////////////////////////////////////////////		
		// External Squads OUTSIDE AO NONE UPS
			_randExtern = random 10;
			if (_randmort <= PARAMS_MortarChance) then 
			{
			_randExtern = 0.1;
			if (DEBUG) then {diag_log "***mortars = true so external groups = true====";};
			};
				if (DEBUG) then 
					{
						if (_randExtern <= PARAMS_ExternChance) then
							{
								diag_log format ["***_randExtern = %1 I AM CREATING External UPS ==========",_randExtern];
							}
							else
							{
								diag_log format ["***_randExtern = %1 I AM NOT CREATING External UPS =========",_randExtern];
							};
					};
			if ( _randExtern <= PARAMS_ExternChance) then	
				{
					_x = 0;
					_randamountSquad = [2,3,4] call BIS_fnc_selectRandom;
					if(DEBUG) then
						{
						diag_log format ["***_randamountSquad = %1 amount of extern squad====",_randamountSquad];
						};
						if (DEBUG) then {diag_log format ["***Creating %1 EXTSQ UPS=====",_randamountSquad];};
					for "_x" from 1 to _randamountSquad do 
					{
						_randomPos = [getMarkerPos currentAO, PARAMS_AOSize+500,2] call SDO_fnc_randomPosbl1p;
						if ((count _randomPos) == 3) then 
						{
							_randSquadMort = random 10;
							_spawnGroupSPX = createGroup EAST;
							if (_randSquadMort <= 6) then 
								{
									_randRecon = random 10;
									if (_randRecon <= 5) then 
									{
										{
										_x createUnit [_randomPos, _spawnGroupSPX];
										} foreach AO_Recon_Squad_Basic;
										
									};
									
									if (_randRecon > 5) then 
									{
									if (DEBUG) then {diag_log "***Creating recon exterior Mortar spotters";};
										 {
										_x createUnit [_randomPos, _spawnGroupSPX];
										} foreach AO_Recon_Squad_Basic;
									};
									
									// run mortar spotter if both mortars are present
									if (count Mortars > 0) then 
									{
										(leader _spawnGroupSPX) addbackpack "UK3CB_BAF_B_Bergen_MTP_Radio_H_A";
										[(leader _spawnGroupSPX), Mortars] execVM "Server\Server_Scripts\mortar_spotter.sqf";
									};	
								};
							if (_randSquadMort > 6) then 
								{
								
									_randRecon = random 10;
									if (_randRecon <= 5) then 
									{
										{
										_x createUnit [_randomPos, _spawnGroupSPX];
										} foreach AO_Recon_Squad_Weapons;
									};
									
									if (_randRecon > 5) then 
									{
									if (DEBUG) then {diag_log "***Creating recon exterior NONE spotter dudes";};
										{
										_x createUnit [_randomPos, _spawnGroupSPX];
										} foreach AO_Recon_Squad_Weapons;
									};
								};
							
							sleep 0.5;
							_randPatrolType = random 1;
							if (_randPatrolType <= 0.5) then 
								{
									// Random pat
									[_spawnGroupSPX, getMarkerPos currentAO, PARAMS_AOSize + 300] call SDO_fnc_spawn2_randomPatrol;
								}
							else
								{
									// Perim pat of AO + range
									[_spawnGroupSPX,getMarkerPos currentAO,(PARAMS_AOSize + 200)] call SDO_fnc_spawn2_perimeterPatrol;
								};
							sleep 0.5;
							{
							_x execVM "Server\Server_Scripts\AO_unitinit.sqf";
							sleep 0.01;
							} foreach units _spawnGroupSPX;
							sleep 0.5;
							removebackpack (leader _spawnGroupSPX);
							(leader _spawnGroupSPX) addbackpack "UK3CB_BAF_B_Bergen_MTP_Radio_H_A";
							
							sleep 1;
							if(DEBUG) then
							{
								_name = format ["%1%2",name (leader _spawnGroupSPX),_x];
								createMarker [_name,getPos (leader _spawnGroupSPX)];
								_name setMarkerType "o_unknown";
								_name setMarkerText format ["Ext-T-Pat %1",_x];;
								_name setMarkerColor "ColorRed";
								[_spawnGroupSPX,_name] spawn
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

							_enemiesArray = _enemiesArray + [_spawnGroupSPX];
						}
						else
						{
							diag_log "***DID NOT CREATE EXTPAT BECAUSE OF FAILED RANDOM POS====";
						};
					};
				};
//////////////////////////////////////////////////////// EXTPAT END ////////////////////////////////////////////////////////

//////////////////////////////////////////////////////// CARPAT START ////////////////////////////////////////////////////////
			AO_Vehicles = []; publicVariable "AO_Vehicles";
			// cars pat NONE UPS
			_randCar = random 10;
				if (DEBUG) then
				{
					if (_randCar <= PARAMS_CarsChance) then
					{
						diag_log format ["***I AM CREATING CARS ====_randCar = %1 ",_randCar];
					}
					else
					{
						diag_log format ["***I AM NOT CREATING CARS====_randCar = %1",_randCar];
					};
					
				};	
			if ( _randCar <= PARAMS_CarsChance) then
			{
				
				_x = 0;
				_randAmountCars = round random PARAMS_CarsPatrol;
				if (_randAmountCars == 0) then {_randAmountCars = 1};
				if (DEBUG) then {diag_log format ["***Creating %1 CAR vehicles",_randAmountCars];};
				
				for "_x" from 1 to _randAmountCars do 
				{
					_spawngroupcar = createGroup east;
					_randomPos = [getMarkerPos currentAO, PARAMS_AOSize,6] call SDO_fnc_randomPos;
					_roadpos = _randomPos;
					_list = _randomPos nearRoads 400;
					if (count _list > 0) then {
						_road = _list call BIS_fnc_selectRandom;
						_roadpos = getPos _road;
					};
					if ((count _roadpos) == 3) then 
					{
						_vehcar = [_roadpos,0,(SDO_Armed_Cars call BIS_fnc_selectRandom),_spawngroupcar] call BIS_fnc_spawnVehicle;
						AO_Vehicles set [count AO_Vehicles, _vehcar select 0];
						// wait untill alive
						//waitUntil {alive (leader _spawngroupcar)};
						_InOrOutChanceCar = random 10;
						if (_InOrOutChanceCar <= 3) then 
							{
							if (DEBUG) then
								{
									diag_log Format ["***_InOrOutChanceCar = %1 :: CAR perim pat at PARAMS_AOSize / 1.1 ",_InOrOutChanceCar];
								};
								[_spawngroupcar,getMarkerPos currentAO,(PARAMS_AOSize)] call SDO_fnc_spawn2_perimeterPatrol;
							};
						if (_InOrOutChanceCar > 3 && _InOrOutChanceCar <= 6) then 
							{
								if (DEBUG) then
								{
									diag_log Format ["***_InOrOutChanceCar = %1 :: CAR perim pat at PARAMS_AOSize",_InOrOutChanceCar];
								};
								[_spawngroupcar,getMarkerPos currentAO,(PARAMS_AOSize+250)] call SDO_fnc_spawn2_perimeterPatrol;
							};
						if (_InOrOutChanceCar > 6) then
							{
								if (DEBUG) then
								{
									diag_log Format ["***_InOrOutChanceCar = %1 :: CAR perim pat at PARAMS_AOSize+200 ",_InOrOutChanceCar];
								};
								[_spawngroupcar,getMarkerPos currentAO,(PARAMS_AOSize+500)] call SDO_fnc_spawn2_perimeterPatrol;
							};
							
						[_spawngroupcar,getMarkerPos currentAO,(PARAMS_AOSize)] call SDO_fnc_spawn2_perimeterPatrol;
						//[_spawngroupcar, getMarkerPos currentAO, PARAMS_AOSize] call SDO_fnc_spawn2_randomPatrol;
						(vehicle (leader _spawngroupcar)) spawn SDO_fnc_fuelMonitor;
						if !(isNil "dep_fnc_vehicledamage") then {
						[(_vehcar select 0)] spawn dep_fnc_vehicledamage;
						};

						sleep 1;
						if(DEBUG) then
						{
							_name = format ["%1%2",name (leader _spawngroupcar),_x];
							createMarker [_name,getPos (leader _spawngroupcar)];
							_name setMarkerType "o_unknown";
							_name setMarkerText format ["Car %1",_x];;
							_name setMarkerColor "ColorRed";
							[_spawngroupcar,_name] spawn
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

						_enemiesArray = _enemiesArray + [_spawngroupcar];
					}
					else
					{
						diag_log "***DID NOT CREATE CARPAT BECAUSE OF FAILED RANDOM POS====";
					};
				};
			};
//////////////////////////////////////////////////////// CARPAT END ////////////////////////////////////////////////////////

//////////////////////////////////////////////////////// ARMOURPAT START ////////////////////////////////////////////////////////
		// armour pat NONE UPS
			_randarmour = random 10;
				if ( _randarmour <= PARAMS_ArmourChance) then
					{
						if (DEBUG) then
						{
						diag_log format ["***I AM CREATING ARMOUR====_randarmour = %1",_randarmour];
						};
					}
					else
					{
						if (DEBUG) then
						{
						diag_log format ["***I AM NOT CREATING ARMOUR====_randarmour = %1",_randarmour];
						};
					};
			if ( _randarmour <= PARAMS_ArmourChance) then
			{
				
				
				_randAmountArmour = round random PARAMS_CarsPatrol;
				if (_randAmountArmour == 0) then {_randAmountArmour = 1};
				
				if (DEBUG) then {diag_log format ["***Creating %1 Armour vehicles",_randAmountArmour];};
				for "_x" from 1 to _randAmountArmour do 
				{
					_armourGroup = createGroup east;
					_randomPos = [getMarkerPos currentAO, PARAMS_AOSize,6] call SDO_fnc_randomPos;
					_roadpos = _randomPos;
					_list = _randomPos nearRoads 400;
					if (count _list > 0) then {
						_road = _list call BIS_fnc_selectRandom;
						_roadpos = getPos _road;
					};
					if ((count _roadpos) == 3) then 
					{
						_randomArmourChance = random 6;
						if(_randomArmourChance <= 2) then 
						{
						_armour = [_roadpos,0,(SDO_Heavy_Armour_vehicles call BIS_fnc_selectRandom),_armourGroup] call BIS_fnc_spawnVehicle;
						}; 
						if (_randomArmourChance > 2 && _randomArmourChance <= 4) then
						{
						_armour = [_roadpos,0,(SDO_APC_vehicles call BIS_fnc_selectRandom),_armourGroup] call BIS_fnc_spawnVehicle;
						};
						if (_randomArmourChance > 4) then
						{
						_armour = [_roadpos,0,(SDO_Heavy_Armour_vehicles call BIS_fnc_selectRandom),_armourGroup] call BIS_fnc_spawnVehicle;
						};
						sleep 1;
						AO_Vehicles set [count AO_Vehicles, _armour select 0];
						// wait untill alive
						//waitUntil {alive (leader _armourGroup)};
						_InOrOutChance = random 10;
						_Rand_radius = (round random 400) + 100;
						if (_InOrOutChance <= 3) then 
							{
								if (DEBUG) then
									{
										diag_log Format ["***_InOrOutChance = %1 :: Armour perim pat at PARAMS_AOSize / 1.1 ",_InOrOutChance];
									};
									[_armourGroup,getMarkerPos currentAO,(PARAMS_AOSize+ _Rand_radius)] call SDO_fnc_spawn2_perimeterPatrol;
							};
						if (_InOrOutChance > 3 && _InOrOutChance <= 6) then 
							{
								if (DEBUG) then
								{
									diag_log Format ["***_InOrOutChance = %1 :: Armour perim pat at PARAMS_AOSize",_InOrOutChance];
								};
									[_armourGroup,getMarkerPos currentAO,(PARAMS_AOSize+_Rand_radius)] call SDO_fnc_spawn2_perimeterPatrol;
							};
						if (_InOrOutChance > 6) then
							{
								if (DEBUG) then
								{
									diag_log Format ["***_InOrOutChance = %1 :: Armour perim pat at PARAMS_AOSize+200 ",_InOrOutChance];
								};
									[_armourGroup,getMarkerPos currentAO,(PARAMS_AOSize+_Rand_radius)] call SDO_fnc_spawn2_perimeterPatrol;
							};
							
							
						(vehicle (leader _armourGroup)) spawn SDO_fnc_fuelMonitor;
						if !(isNil "dep_fnc_vehicledamage") then {
						[(_armour select 0)] spawn dep_fnc_vehicledamage;
						};

						sleep 1;
						if(DEBUG) then
						{
							_name = format ["%1%2",name (leader _armourGroup),_x];
							createMarker [_name,getPos (leader _armourGroup)];
							_name setMarkerType "o_unknown";
							_name setMarkerText format ["Armour %1",_x];;
							_name setMarkerColor "ColorRed";
							[_armourGroup,_name] spawn
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
						_enemiesArray = _enemiesArray + [_armourGroup];
					}
					else
					{
						diag_log "***DID NOT CREATE ARMOURPAT BECAUSE OF FAILED RANDOM POS====";
					};
				};
			};
//////////////////////////////////////////////////////// ARMOURPAT END ////////////////////////////////////////////////////////

//////////////////////////////////////////////////////// AIRPAT START ////////////////////////////////////////////////////////
				if((random 10 <= PARAMS_AirPatrol)) then 
				{
					if (DEBUG) then
					{
					diag_log "***I AM CREATING AIR====";
					};
					_airGroup = createGroup east;
					_randomPos = [getMarkerPos currentAO, PARAMS_AOSize] call SDO_fnc_randomPos;
					if ((count _randomPos) == 3) then 
					{
						if(random 1 <= 0.5) then 
							{
								diag_log "***Creating Chopper";
								_pos = [_randomPos select 0,_randomPos select 1,1000];
								_airType = [_pos,0,(SDO_Air_Attack_chop call BIS_fnc_selectRandom),_airGroup] call BIS_fnc_spawnVehicle;
							}
							else 
							{
								diag_log "***Creating Plane";
								_pos = [_randomPos select 0,_randomPos select 1,1000];
								_airType = [_pos,0,(SDO_Air_Attack_chop call BIS_fnc_selectRandom),_airGroup] call BIS_fnc_spawnVehicle;
							};
							
						

						[_airGroup,getMarkerPos currentAO,(4 * (PARAMS_AOSize / 3))] call SDO_fnc_spawn2_perimeterPatrol;
						(vehicle (leader _airGroup)) spawn SDO_fnc_fuelMonitor;
						AO_Vehicles set [count AO_Vehicles, _airType select 0];
						sleep 1;
						if(DEBUG) then
						{
							_name = format ["%1%2",name (leader _airGroup),_x];
							createMarker [_name,getPos (leader _airGroup)];
							_name setMarkerType "o_unknown";
							_name setMarkerText format ["Air %1",_x];;
							_name setMarkerColor "ColorRed";
							[_airGroup,_name] spawn
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
						_enemiesArray = _enemiesArray + [_airGroup];
					}
					else
					{
						diag_log "***DID NOT CREATE AIRPAT BECAUSE OF FAILED RANDOM POS====";
					};
				}
				else
				{
					if (DEBUG) then
						{
						diag_log "***I AM NOT CREATING AIR====";
						};
				};
//////////////////////////////////////////////////////// AIRPAT END ////////////////////////////////////////////////////////

//===================================//
//========== GARISON  ================//
//===================================//

		if (DEBUG) then {diag_log "***Checking Garrison";};
			
			_houses = (getMarkerPos currentAO) nearObjects ["House",50];
			_Housecount = count _houses;  
				if (DEBUG) then {diag_log format ["***Garrison house count is %1",_Housecount];};
				if (_Housecount >= 4) then 
					{     
						if (DEBUG) then {diag_log "***Garrison House > 5";};
						_spawnGarisonGroup = createGroup EAST;
						GarisonGroup = [];
						GarisonGroup = GarisonGroup + AO_Squad_Grenadier  + AO_Squad_Heavy + AO_Squad_Heavy;
						_randomPos = [getMarkerPos currentAO, 50,2] call SDO_fnc_randomPosbl1p;
						if ((count _randomPos) == 3) then 
						{
							{
								_x createUnit [_randomPos, _spawnGarisonGroup];
							} foreach GarisonGroup;
							_nul = [(getMarkerPos currentAO), units _spawnGarisonGroup, 50, true, true] execVM "Server\Server_Scripts\Zen_OccupyHouse.sqf";
						
							sleep 0.5;
							{
								_x execVM "Server\Server_Scripts\AO_unitinit.sqf";
								sleep 0.01;
							} foreach units _spawnGarisonGroup;
							sleep 0.5;
							(leader _spawnGarisonGroup) setVariable ["asr_ai_exclude", true];
							
							sleep 1;
							if(DEBUG) then
							{
								_name = format ["%1%2",name (leader _spawnGarisonGroup),_x];
								createMarker [_name,getPos (leader _spawnGarisonGroup)];
								_name setMarkerType "o_unknown";
								_name setMarkerText format ["Garison %1",_x];;
								_name setMarkerColor "ColorRed";
								[_spawnGarisonGroup,_name] spawn
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
							
						_enemiesArray = _enemiesArray + [_spawnGarisonGroup];
						
						} else {if (DEBUG) then {diag_log "***Garison Failed on random pos";};};
					} else {if (DEBUG) then {diag_log "***Garison Failed House count";};};
				
			if (DEBUG) then {diag_log "***Garrison Finished===============";};
			
//===================================//
//========== GARISON  END============//
//===================================//

				if (DEBUG) then {diag_log "***AO AI CREATION ( SDO_fnc_spawnUnits ) FUNC DONE=============";};
				AOAICREATIONMAINDONE = true;
				publicVariable "AOAICREATIONMAINDONE";
				
	_enemiesArray
};

//===================================//
//==========TOWER defence                        ==//
//===================================//
BL_fnc_towerDefence =
{

	if (DEBUG) then {diag_log "***TOWER DEFENCE FUNC STARTED==============";};
	_enemiesArray2 = [grpNull];
	// Reconguards
	
	
		_RandTypeTDef = round random 3;
	if (_RandTypeTDef < 1) then 
	{
		_x = 0;
		
		_randAmountTdef = round random PARAMS_TowerDefenders;
		if (_randAmountTdef == 0) then {_randAmountTdef = 1};
		if (DEBUG) then {diag_log format ["***Creating %1 Tower defence Teams",_randAmountTdef];};
		for "_x" from 1 to _randAmountTdef do 
		{
		

				_randomPos = [getMarkerPos "radioMarker", 10] call SDO_fnc_randomPosbl1p;
				if ((count _randomPos) == 3) then 
				{
					_spawnGroup = createGroup EAST;
					 SDO_u_AO_sl createUnit [_randomPos, _spawnGroup];
					 SDO_u_AO_med createUnit [_randomPos, _spawnGroup];
					 SDO_u_AO_ar createUnit [_randomPos, _spawnGroup];
					
					sleep 0.5;
					{
					_x execVM "Server\Server_Scripts\AO_unitinit.sqf";
					sleep 0.01;
					} foreach units _spawnGroup;
					sleep 0.5;
					(leader _spawnGroup) setVariable ["asr_ai_exclude", true];
					
					if(DEBUG) then
					{
						_name = format ["%1%2",name (leader _spawnGroup),_x];
						createMarker [_name,getPos (leader _spawnGroup)];
						_name setMarkerType "o_unknown";
						_name setMarkerText format ["Tow-Def-T %1",_x];;
						_name setMarkerColor "ColorRed";
						[_spawnGroup,_name] spawn
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
					_enemiesArray2 = _enemiesArray2 + [_spawnGroup];
				}
				else
				{
						diag_log "***DID NOT CREATE TOWDEF BECAUSE OF FAILED RANDOM POS====";
				};
		};
	};
	
	if (_RandTypeTDef >= 1) then 
		{
			_x = 0;
			_randAmountTdef = round random PARAMS_TowerDefenders;
			if (_randAmountTdef == 0) then {_randAmountTdef = 1};
			if (DEBUG) then {diag_log format ["***Creating %1 Tower defence Teams",_randAmountTdef];};
			for "_x" from 1 to _randAmountTdef do 
			{
					_randomPos = [getMarkerPos "radioMarker", 10] call SDO_fnc_randomPosbl1p;
					if ((count _randomPos) == 3) then 
					{
						_spawnGroup = createGroup EAST;
						SDO_u_AO_sl createUnit [_randomPos, _spawnGroup];
						SDO_u_AO_med createUnit [_randomPos, _spawnGroup];
						SDO_u_AO_ar createUnit [_randomPos, _spawnGroup];
						
						sleep 0.5;
						_randPatrolType = random 3;
						_Rand_radius = (round random 100) + 50;
						if (_randPatrolType < 1) then 
							{
								[_spawnGroup, getMarkerPos "radioMarker",_Rand_radius] call SDO_fnc_spawn2_perimeterPatrol;
								sleep 0.5;
							};
						if((_randPatrolType > 1) && (_randPatrolType < 2))  then 
							{
									// Nothing
							};
						if (_randPatrolType >= 2)  then 
							{
									[_spawnGroup, getMarkerPos "radioMarker",_Rand_radius] call SDO_fnc_spawn2_randomPatrol;
								sleep 0.5
							};
						sleep 0.5;
						{
						_x execVM "Server\Server_Scripts\AO_unitinit.sqf";
						sleep 0.01;
						} foreach units _spawnGroup;
						sleep 0.5;
						(leader _spawnGroup) setVariable ["asr_ai_exclude", true];
						if(DEBUG) then
						{
							_name = format ["%1%2",name (leader _spawnGroup),_x];
							createMarker [_name,getPos (leader _spawnGroup)];
							_name setMarkerType "o_unknown";
							_name setMarkerText format ["Tow-Def-T %1",_x];;
							_name setMarkerColor "ColorRed";
							[_spawnGroup,_name] spawn
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
						_enemiesArray2 = _enemiesArray2 + [_spawnGroup];
					}
					else
					{
							diag_log "***DID NOT CREATE TOWDEF BECAUSE OF FAILED RANDOM POS====";
					};
			};
		};
//===================================//
//==========Sniper                                         ==//
//===================================//
	_randSnipe = random 10;
	if (DEBUG) then
	{
		if ( _randSnipe <= PARAMS_SniperChance) then
				{
					diag_log format ["***_randSnipe = %1 I AM CREATING SNIPERS ============ ",_randSnipe];
				}
				else
				{
					diag_log format ["***_randSnipe = %1 I AM NOT CREATING SNIPERS ========== ",_randSnipe];
				};
	};
	if ( _randSnipe <= PARAMS_SniperChance) then	
	{
		_x = 0;
		_sniperand = [2,3,4] call BIS_fnc_selectRandom;
		if(DEBUG) then
			{
			diag_log format ["***_sniperand = %1 amount of snipers",_sniperand];
			};
		for "_x" from 1 to _sniperand do 
		{

			_spawnGroupSN = createGroup EAST;
			_randomPos = [getMarkerPos "radioMarker", 1000] call SDO_fnc_Snipers;

			{
				_x createUnit [_randomPos, _spawnGroupSN];
			} foreach AO_Squad_Snipers;

			_spawnGroupSN setBehaviour "STEALTH";

			sleep 0.5;
			{
			_x execVM "Server\Server_Scripts\AO_unitinit.sqf";
			sleep 0.01;
			} foreach units _spawnGroupSN;
			sleep 0.5;
			
			if(DEBUG) then
			{
				_name = format ["%1%2",name (leader _spawnGroupSN),_x];
				createMarker [_name,getPos (leader _spawnGroupSN)];
				_name setMarkerType "o_unknown";
				_name setMarkerText format ["Sniper %1",_x];;
				_name setMarkerColor "ColorRed";
				[_spawnGroupSN,_name] spawn
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

			_enemiesArray2 = _enemiesArray2 + [_spawnGroupSN];
		};
	};
	if (DEBUG) then {diag_log "***TOWER DEFENCE FUNC DONE===============";};
	_enemiesArray2
};	

if (DEBUG) then {diag_log "***Create_Units SCRIPT DONE===============";};