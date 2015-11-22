
if !(isServer) exitwith {diag_log "Exiting AOLoop.sqf not a server";};

diag_log "==========Reading AOLoop.sqf============";

private ["_position","_firstTarget","_validTarget","_targetsLeft","_flatPos","_targetStartText","_lastTarget","_targets","_dt","_enemiesArray","_enemiesArray2","_radioTowerDownText","_targetCompleteText","_null","_missionCompleteText","_SERVERUNITSCHECK","_debugCounter","_doneTargets","_allowedTargetAmount"];

/* =============================================== */
/* ================== AO TARGETS ================= */
/* =============================================== */


_initialTargets = [
	"Kalochori",
	"Sofia",
	"Feres",
	"Skopos",
	"Neri",
	"Factory",
	"Syrta",
	"Zaros",
	"Chalkeia",
	"Aristi",
	"Dump",
	"Outpost",
	"Frini",
	"Athira",
	"Swamp",
	"Rodopoli",
	"Charkia",
	"Alikampos",
	"Stavros",
	"Agios Dionysios",
	"Poliakko",
	"Paros",
	"Molos",
	"Game of Thronos",
	"The wind turbines",
	"Therisa",
	"Panochori",
	"Kavala",
	"The Xirolimni Dam",
	"Pygos",
	"Military outpost",
	"Negades",
	"Abdera",
	"Millers Despair",
	"Chapel",
	"Telos",
	"Vikos Valley",
	"Panagia",
	"Nidasos Military",
	"Moria",
	"Aktinarki Crossroads",
	"Power Plant"
];

_targets = [
	"Kalochori",
	"Sofia",
	"Feres",
	"Skopos",
	"Neri",
	"Factory",
	"Syrta",
	"Zaros",
	"Chalkeia",
	"Aristi",
	"Dump",
	"Outpost",
	"Frini",
	"Athira",
	"Swamp",
	"Rodopoli",
	"Charkia",
	"Alikampos",
	"Stavros",
	"Agios Dionysios",
	"Poliakko",
	"Paros",
	"Molos",
	"Game of Thronos",
	"The wind turbines",
	"Therisa",
	"Panochori",
	"Kavala",
	"The Xirolimni Dam",
	"Pygos",
	"Military outpost",
	"Negades",
	"Abdera",
	"Millers Despair",
	"Chapel",
	"Telos",
	"Vikos Valley",
	"Panagia",
	"Nidasos Military",
	"Moria",
	"Aktinarki Crossroads",
	"Power Plant"
];


		currentAO = "Nothing";
		publicVariable "currentAO";
		//_lastTarget = "Nothing";
		_targetsLeft = count _targets;


//--- bl1p moved ao unit creation into seperate script
	_handle2 = execVM "core\Create_Units.sqf";
	waitUntil{scriptDone _handle2};

//--- create some random aa opsitions
	_null = [] execVM "core\AAPosCreation.sqf";
	
	
	_firstTarget = true;
	//_lastTarget = "Nothing";
	_lastTarget = [];
	
///////////////////////////////////////
// fluits stuff :)
///////////////////////////////////////

	_number_ao = (count _initialTargets) - PARAMS_AOENDCOUNT;
	_baselocation = (getPos Start_pos_pad);
	_startradius = 4000;
	_ao_list = [];
	_previous = _baselocation;
	_centerpos = _baselocation;
	_radius = _startradius;
	
    _cnt = count _initialTargets;
    for "_i" from 1 to _cnt do {
        _initialTargets pushBack (_initialTargets deleteAt floor random _cnt);
    };
	if (DEBUG) then {diag_log format ["finding %1 AO's", _number_ao];};
	while {(count _ao_list) < _number_ao && (_radius < 50000)} do
		{
			if (DEBUG) then {diag_log format ["while {%1 < %2 && ( %3 < 50000)} do",count _ao_list, _number_ao,_radius];};
			_found = false;
			if (DEBUG) then {diag_log format [" found = %1 ",_found];};
			{
				_pos = getMarkerPos _x;
				//if (DEBUG) then {diag_log format [" Not in ao_list _x = %1 ",_x];};
				if !(_x in _ao_list) then 
				{
					if (DEBUG) then {diag_log format ["if ((%1) < %2)",(_pos distance _centerpos),_radius];};
					if ((_pos distance _centerpos) < _radius) then 
					{
						if (DEBUG) then {diag_log format ["if ((%1 ) > 2000 from Base)",(_pos distance _baselocation)];};
						if ((_pos distance _baselocation) > 2000) then 
						{
							if (DEBUG) then {diag_log format ["if ((%1) > 2000 From Previous)",(_pos distance _previous)];};
							if ((_pos distance _previous) > 2000) then 
							{
								_found = true;
								_ao_list = _ao_list + [_x];
								_centerpos = _pos;
								_radius = _startradius;
								_previous = _pos;
								if (DEBUG) then {diag_log format ["_found= %1,_ao_list = %2",_found,_ao_list];};
							};
						};
					};
				};
				if (_found) exitWith {}; // Exit the foreach loop if an AO has been found
			} forEach _initialTargets;
			
			if !(_found) then {
				_radius = _radius + 1000;
			};
		};

if (DEBUG) then {

	diag_log format ["_ao_list = %1",_ao_list];
	_y = 1;
	{
		_m = createMarker[format["temp%1", _x], getMarkerPos _x];
		_m setMarkerType "mil_objective";
		_m setMarkerText (str _y);
		_y = _y + 1;
	} forEach _ao_list;

	_m = createMarker["thebase", _baselocation];
	_m setMarkerType "mil_dot";
	_m setMarkerText "BASE";
	};

/* =============================================== */
/* ================ RUN THE AO LOOP ============== */
/* =============================================== */
	{
		diag_log "==============Init_Server Now running AO loop==============";
		sleep 10;
		currentAO = _x;
		
					waituntil {!isNil "BaseCreated"};
					_targetsLeft = count _ao_list;
					
					if (DEBUG) then
						{
						diag_log format["====================FINAL Selected  currentAO = %1  ====================",currentAO];
						};


		//--- Set currentAO for UAVs and JIP updates
			publicVariable "currentAO";
			currentAOUp = true;
			publicVariable "currentAOUp";

		//--- Edit and place markers for new target
			{_x setMarkerPos (getMarkerPos currentAO);} forEach ["aoCircle","aoMarker"];
			"aoMarker" setMarkerText format["Take %1",currentAO];
			"aoMarker" SetMarkerAlpha 0;
			
			_lastTarget = (getMarkerPos currentAO);
			
			sleep 5;
			publicVariable "refreshMarkers";


		//--- Create AO detection trigger IF ONE DOESNT ALREADY EXIST

			dt = createTrigger ["EmptyDetector", getMarkerPos currentAO];
			dt setTriggerArea [PARAMS_AOSize, PARAMS_AOSize, 0, false];
			dt setTriggerActivation ["EAST", "PRESENT", false];
			dt setTriggerStatements ["this","",""];
			publicvariable "dt";

		//--- bl1p Spawn AO AI
			_enemiesArray = [currentAO] call SDO_fnc_spawnUnits;

			if (DEBUG) then {diag_log "MAKING A TOWER ON SERVER";};
			//Spawn radiotower
			_position = [[[getMarkerPos currentAO, PARAMS_AOSize],dt],["water","out"]] call BIS_fnc_randomPos;
			_flatPos = _position isFlatEmpty[3, 1, 0.7, 20, 0, false];
			
			
			_debugCounter = 1;
			while {(count _flatPos) < 1} do
			{
				//if (DEBUG) then { diag_log format["Finding position in INIT script For radio tower.Attempt #%1",_debugCounter]; };
				_debugCounter = _debugCounter + 1;
				_position = [[[getMarkerPos currentAO, PARAMS_AOSize],dt],["water","out"]] call BIS_fnc_randomPos;
				_flatPos = _position isFlatEmpty[3, 1, 0.7, 20, 0, false];
				sleep 1;
			};
			
		//--- make the tower NOT a light houise because fluit said thats stupid !!!
			radioTower = "Land_TTowerBig_2_F" createVehicle _flatPos;
			
				waitUntil {sleep 0.5; alive radioTower};
				radioTower setVectorUp [0,0,1];
				radioTowerAlive = true;
				publicVariable "radioTowerAlive";
				
				"radioMarker" SetMarkerAlpha 0;
				"radioMarker" setMarkerPos (getPos radioTower);
				
				//Tower EH for sachels
				_tower = radioTower;
				_tower addEventHandler 
				["HandleDamage", 
					{
					//diag_log format ["*****Bomb = %1*****",_this select 4];
					if (((_this select 4) == "SatchelCharge_Remote_Ammo") || ((_this select 4) == "SatchelCharge_Remote_Ammo_Scripted")) then 
						[
							{
								_this select 2;
								[] spawn {sleep 1;radioTower setdamage 1};
								[] spawn {sleep 10;deleteVehicle radioTower;};
							},{0}
						]; 
					}
				]; 
				
			publicVariable "radioTower";

		
		//--- bl1p radio tower check 
			if (DEBUG) then {diag_log format ["Waiting for Radio tower and radioTowerAlive = %1",radioTowerAlive];};
			waitUntil {sleep 0.5; radioTowerAlive};
		//--- bl1p spawn tower defenders
			
			_enemiesArray2 = [radioTower] call BL_fnc_towerDefence;

			if (DEBUG) then {diag_log format ["Radio tower should be up now radioTowerAlive = %1",radioTowerAlive];};
			
			if (DEBUG) then {diag_log format ["=========AOAICREATIONMAINDONE = %1 ==========",AOAICREATIONMAINDONE];};
			
				"aoMarker" SetMarkerAlpha 1;
				"radioMarker" SetMarkerAlpha 0;
					
			
		//--- Set target start text
			_targetStartText = format
				[
					"
					%2<t align='center' size='2.2'>New Target</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/><br/>Take down the Radio Tower. Eliminate all Hostiles.</t>
					",currentAO
				];

			_targetStartText = format
				[
					"%1 - %2 more targets to go",_targetStartText,_targetsLeft
				];


		//--- Show global target start hint
			GlobalHint = _targetStartText; publicVariable "GlobalHint"; hint parseText GlobalHint;
			showNotification = ["NewMain", currentAO]; publicVariable "showNotification";
			showNotification = ["NewSub", "Destroy the enemy radio tower."]; publicVariable "showNotification";

		
		
		//--- bl1p create reinforments on Server

			if (PARAMS_HeavyReinforcement > 0) then { _null = [] execVM "Reinforcement\AOHeavyReinforce.sqf"; };
			if (PARAMS_AOReinforcement  > 0) then { _null = [] execVM "Reinforcement\AOReinforcement.sqf"; };
			if (PARAMS_ConvoyChance > 0) then { _null = [] execVM "Reinforcement\AOConvoy.sqf"; };

		
	/* =============================================== */
	/* ========= WAIT FOR TARGET COMPLETION ========== */
	/* =============================================== */
		
		if(DEBUG) then
				{
					diag_log "init.sqf waiting for target compleation";
					diag_log "waitUntil {sleep 5; count list dt > PARAMS_EnemyLeftThreshhold};";
					diag_log "waitUntil {sleep 0.5; !alive radioTower};";
				};

		//--- bl1p wait
			waitUntil {sleep 5; count list dt > PARAMS_EnemyLeftThreshhold};
			waitUntil {sleep 0.5; !alive radioTower};
				

				radioTowerAlive = false;
				publicVariable "radioTowerAlive";
			
				"radioMarker" setMarkerPos [0,0,0];
				
				_radioTowerDownText =
					"
					<t align='center' size='2.2'>Radio Tower</t><br/><t size='1.5' color='#08b000' align='center'>DESTROYED</t><br/>____________________<br/>Well Done";
					
				GlobalHint = _radioTowerDownText; publicVariable "GlobalHint"; hint parseText GlobalHint;
				showNotification = ["CompletedSub", "Enemy radio tower destroyed."]; publicVariable "showNotification";

					
		//--- bl1p Server wait
			waitUntil {sleep 5; count list dt < PARAMS_EnemyLeftThreshhold};
		
		//--- bl1p unlock assets
			UnlockAssets = true;
			publicvariable "UnlockAssets";

			_targets = _targets - [currentAO];
			_ao_list = _ao_list - [currentAO];

			publicVariable "refreshMarkers";
			currentAOUp = false;
			publicVariable "currentAOUp";

			//Small sleep to let deletions process
			sleep 5;

		//--- Set target completion text
			_targetCompleteText = format
			[
				"<t align='center' size='2.2'>Target Taken</t><br/><t size='1.5' align='center' color='#08b000'>%1</t><br/>____________________<br/>Acquiring next target.</t>",
				currentAO
			];

			{_x setMarkerPos [0,0,0];} forEach ["aoCircle","aoMarker"];

		//--- Show global target completion hint
			GlobalHint = _targetCompleteText; publicVariable "GlobalHint"; hint parseText GlobalHint;
			showNotification = ["CompletedMain", currentAO]; publicVariable "showNotification";
			"aoCircle" SetMarkerAlpha 0;
			AOAICREATIONMAINDONE = false;publicVariable "AOAICREATIONMAINDONE";
		
		//--- Delete detection trigger and markers on Server
				deleteVehicle dt;
				sleep 1;
				
				
		//--- Skip clean up And Defence missions if final mission done
		if (count _targets > PARAMS_AOENDCOUNT) then 
			{
				//--- bl1p Server clean up units left over before next AO call
					if(DEBUG) then
							{
								diag_log "===============STARTING CLEAN UP=====================";
							};
					
					//upsmon_enabled = false; publicVariable "upsmon_enabled"; // Disable UPSMON
					
				//--- FIRST check of groups Before cleaning
					_Eastgroups=[];
					{
						if ((count units _x>0 and side _x==east) && (!isNull _x)) then 
							{
							_Eastgroups=_Eastgroups+[_x];
							};
					} forEach allGroups;
					
						if (DEBUG) then
							{
								diag_log format ["====FIRST CHECK OF _Eastgroups=%1====",_Eastgroups];
							};
					
					[] spawn SDO_cleanGroups;
					sleep 2;
					
				//--- clean up arrays by fluit and bl1p
					_arraystocleanup = [];
					if ((!isnil ("_enemiesArray")) && (count _enemiesArray > 0)) then {
						if (DEBUG) then
						{
						diag_log format ["_enemiesArray = %1",_enemiesArray];
						};
						_arraystocleanup set [count _arraystocleanup, _enemiesArray]; 
					};
					if ((!isnil ("_enemiesArray2")) && (count _enemiesArray2 > 0)) then {
						if (DEBUG) then
						{
						diag_log format ["_enemiesArray2 = %1",_enemiesArray2];
						};
						_arraystocleanup set [count _arraystocleanup, _enemiesArray2]; 
					};
					if ((!isnil ("ReinforcementUnits")) && (count ReinforcementUnits > 0))  then {
						if (DEBUG) then
						{
						diag_log format ["ReinforcementUnits = %1",ReinforcementUnits];
						};
						_arraystocleanup set [count _arraystocleanup, ReinforcementUnits]; 
					};
					if ((!isnil ("ReinforcementVehicles")) && (count ReinforcementVehicles > 0)) then {
						if (DEBUG) then
						{
						diag_log format ["ReinforcementVehicles = %1",ReinforcementVehicles];
						};
						_arraystocleanup set [count _arraystocleanup, ReinforcementVehicles]; 
					};
					if ((!isnil ("HeavyReinforcementUnits")) && (count HeavyReinforcementUnits > 0)) then {
						if (DEBUG) then
						{
						diag_log format ["HeavyReinforcementUnits = %1",HeavyReinforcementUnits];
						};
						_arraystocleanup set [count _arraystocleanup, HeavyReinforcementUnits]; 
					};
					if ((!isnil ("HeavyReVehicles")) && (count HeavyReVehicles > 0)) then {
						if (DEBUG) then
						{
						diag_log format ["HeavyReVehicles = %1",HeavyReVehicles];
						};
						_arraystocleanup set [count _arraystocleanup, HeavyReVehicles]; 
					};
					if (!isnil ("ConvoyUnits")) then {
						if (count ConvoyUnits > 0) then {
							if (DEBUG) then
							{
							diag_log format ["ConvoyUnits = %1",ConvoyUnits];
							};
							_arraystocleanup set [count _arraystocleanup, ConvoyUnits]; 
						};
					};
					if (isnil ("ConvoyVehicles")) then {ConvoyVehicles = [];};
					 if (count ConvoyVehicles > 0)then {
						if (DEBUG) then
						{
						diag_log format ["ConvoyVehicles = %1",ConvoyVehicles];
						};
						_arraystocleanup set [count _arraystocleanup, ConvoyVehicles]; 
					};
					sleep 0.5;
					if (DEBUG) then
							{
							diag_log "===========FINAL ARRAYS TO CLEAN UP================";
							diag_log format ["_arraystocleanup = %1",_arraystocleanup];
							diag_log format ["count of elements in _arraystocleanup = %1",count _arraystocleanup];
							};
					
					_handleAOclean = [_arraystocleanup] execVM "core\AOCleanup.sqf";
					waitUntil{scriptDone _handleAOclean};
					
				//--- bl1p loop and check groups and remove null groups from array to check
					_finalArraysdebugcount = 0;
					while {count _Eastgroups > 0} do
					{
						_finalArraysdebugcount = _finalArraysdebugcount + 1;
						if (_finalArraysdebugcount > 10) exitwith {diag_log format ["_finalArraysdebugcount =%1 exiting loop ",_finalArraysdebugcount];};
				//---second check of groups after cleaning
							_Eastgroups=[];
							{
								if ((count units _x>0 and side _x==east) && (!isNull _x)) then 
									{
									_Eastgroups=_Eastgroups+[_x];
									};
							} forEach allGroups;
							
								if (DEBUG) then
									{
										diag_log format ["====LOOPED CHECK OF _Eastgroups=%1====",_Eastgroups];
									};
				//--- second check of groups after cleaning			
						if (DEBUG) then 
							{
								diag_log format["====waiting for array to clear attempt #%1====",_finalArraysdebugcount];
								//diag_log format ["INIT.SQF --==-- _Eastgroups = %1",_Eastgroups];
							};
						sleep 5;
					};
					
					
				//--- wait until all east units are cleaned up (if 2 mins has passed delete ALL east units as a fail safe)
					_SERVERUNITSCHECK = east countSide allunits;
						if (DEBUG) then 
						{
							diag_log format ["====_SERVERUNITSCHECK = %1====",_SERVERUNITSCHECK];
						};
					sleep 0.5;
					_DebugCountEnd = 0;
					while {_SERVERUNITSCHECK > 0} do
					{
						_DebugCountEnd = _DebugCountEnd + 1;
						_SERVERUNITSCHECK = east countSide allunits;
						sleep 1;
							if (_DebugCountEnd > 60) then 
								{
									{ if (side _x == east) then {_x setdamage 1;} } foreach allunits;
								};
						sleep 1;
							if (DEBUG) then 
								{
									diag_log format ["_SERVERUNITSCHECK = %1 _DebugCountEnd = %2",_SERVERUNITSCHECK,_DebugCountEnd];
								};
					};
					
				//--- DECLARE ALL FALSE FOR REINFORCEMENTS
				/*
					if (ConvoyAlive) then 
					{
						showNotification = ["CompletedSub", "Enemy Convoy Retreated when AO was captured."]; publicVariable "showNotification";
					};
				*/	
					
							//////////////////////////////////////////////////
							//--- RUN INCREASING RANDOM TO CREATE DEFENED MISSION
							//////////////////////////////////////////////////
								_createDefend = random 1;
								if (DEBUG) then
									{
										diag_log "=========DEFENCE CHECKS START============";
										diag_log format ["BASE _createDefend = %1",_createDefend];
									};
									
								_doneTargetsForDefend = ((count (_initialTargets)) - (count (_targets)));
								if (_doneTargetsForDefend > LASTDEFEND) then {_createDefend = _createDefend + 0.02 * (_doneTargetsForDefend - LASTDEFEND);};
								if (DEBUG) then
									{
										//_createDefend = 1; // used to force defend missions
										diag_log format ["_doneTargetsForDefend = %1",_doneTargetsForDefend];
										diag_log format ["LASTDEFEND = %1",LASTDEFEND];
										diag_log format ["AFTER ALTERATION _createDefend = %1 (+ 0.02 for each _doneTargetsForDefend - LASTDEFEND)",_createDefend];
										if (_createDefend > 0.8) then
										{
											diag_log "_createDefend = Pass";
										} else {diag_log "_createDefend = Fail";};
										diag_log "=========DEFENCE CHECKS END============";
									};
								if (_createDefend >= 0.8) then   //-- random chance
								{
									RunninngDefenceAO = true;
									publicvariable "RunninngDefenceAO";
									[] call bl1p_fnc_defend;
									"aoCircle_2" SetMarkerAlpha 1;
									"aoMarker_2" SetMarkerAlpha 1;
									LASTDEFEND = _doneTargetsForDefend;
									publicVariable "LASTDEFEND";
									waituntil {sleep 1; !RunninngDefenceAO};
								};
							//////////////////////////////////////////////////
							//--- END DEFEND MISSION
							//////////////////////////////////////////////////
							
							//////////////////////////////////////////////////
							//--- RUN CHECKS FOR NUKE MISSION
							//////////////////////////////////////////////////
								
							//--- bl1p count how many AOs have been done
								_doneTargets = ((count (_initialTargets)) - (count (_targets)));
								if (DEBUG) then 
									{
										diag_log "=========NUKE CHECKS START============";
										diag_log format ["done targets = %1",_doneTargets];
										diag_log format ["LASTNUKE = %1",LASTNUKE];
										if (_doneTargets > LASTNUKE+5) then 
										{
											diag_log "(AO count = Pass)";
										} else {diag_log "(AO count = Fail)";};
									};
								sleep 0.2;
								
							//--- bl1p count how many players online
								players_online = West countSide allunits;
								publicVariable "players_online";
								if (DEBUG) then 
									{
										diag_log format ["players_online = %1",players_online];
									if (players_online >= 5) then
									{
										diag_log "players_online count = Pass";
									} else {diag_log "players_online count = Fail";};
									};
								sleep 0.2;
								
							//--- was last defend a fail 
								if (DEBUG) then
								{
									if (!UnlockAssets) then
										{
										diag_log "UnlockedAssets = Pass";
										} else {diag_log "UnlockedAssets = Fail";};
								};
								sleep 0.2;
								
							//--- bl1p create the INCREASING random chance for a nuke mission
								_NukeRandom = random 1; //--- base random
								if (DEBUG) then
									{
									diag_log format ["BASE _NukeRandom = %1",_NukeRandom];
									};
								if (_doneTargets > LASTNUKE) then {_NukeRandom = _NukeRandom + 0.02 * (_doneTargets - LASTNUKE);}; 
								if (DEBUG) then
									{
										diag_log format ["AFTER ALTERATION _NukeRandom = %1 (+ 0.02 for each _doneTargets - LASTNUKE)",_NukeRandom];
										if (_NukeRandom > 0.8) then
										{
											diag_log "_NukeRandom = Pass";
										} else {diag_log "_NukeRandom = Fail";};
									};
							//--- run check 
								if ((!NUKEYES) && (_doneTargets > LASTNUKE+5) && (players_online >= 5) && (!UnlockAssets) && (_NukeRandom > 0.8)) then 
								{
									diag_log "====----NUKE CHECKS PASSED----====";
									NUKEYES = true;
									publicVariable "NUKEYES";
							//--- save how many targets where done on last nuke creation as LASTNUKE
									LASTNUKE = _doneTargets;
									publicVariable "LASTNUKE";
									diag_log format ["LASTNUKE = %1",LASTNUKE];
								}else {NUKEYES = false; publicVariable "NUKEYES";diag_log "====----NUKE CHECKS FAILED----====";};
								
								if (DEBUG) then
								{
								diag_log format ["====----NUKEYES = %1----====",NUKEYES];
								diag_log "=========NUKE CHECKS END============";
								};
								
							//////////////////////////////////////////////////
							//--- END CHECKS FOR NUKE MISSION
							//////////////////////////////////////////////////

			
						//--- Hide priorityMarker
							"priorityMarker" setMarkerPos [0,0,0];
							"priorityCircle" setMarkerPos [0,0,0];
						//--- bl1p
							"priorityCircle" SetMarkerAlpha 0;
							"priorityMarker" SetMarkerAlpha 0;
							publicVariable "priorityMarker";
							
							ConvoyAlive = false;
							publicVariable "ConvoyAlive";
							
							ReinforcedPlane = false;
							publicVariable "ReinforcedPlane";

							ReinforcedTank = false;
							publicvariable "ReinforcedTank";
							
							Reinforced = false;
							publicVariable "Reinforced";
							
							[] spawn SDO_cleanGroups;
							sleep 5;
			
			}
			else 
			{
				//--- Wait 20 sec then end
				sleep 20;
			};
	} foreach _ao_list;

	/* =============================================== */
	/* ============== END OF THE AO LOOP ============= */
	/* =============================================== */

	if(DEBUG) then
				{
					diag_log "OUT OF WHILE LOOP FOR AO CREATION";	
				};
				
	//--- bl1p server only	

			//Set completion text
			_missionCompleteText = "<t align='center' size='2.0'>Congratulations!</t><br/>
			<t size='1.2' align='center'>You've successfully completed SDO by the Falcons Group !</t><br/>
			____________________<br/>
			<br/>
			Thank you so much for playing, we Falcons hope to see you in the future..<br/>
			<br/>
			The game will return to the mission screen after this short outro. Thanks to BL1P, Fluit and Flipped also to everyone else who helped create and test this mission.";
			
			//Show global mission completion hint
			GlobalHint = _missionCompleteText;
			publicVariable "GlobalHint";
			hint parseText GlobalHint;

			sleep 12;
			
			AOVICTORYDONE = true;publicVariable "AOVICTORYDONE";
			mps_mission_finished = "true"; publicvariable "mps_mission_finished";