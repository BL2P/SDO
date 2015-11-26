//--- Rpt report
diag_log "==============Init_Server Start==============";

//--- Disable saving to save time
	enableSaving [false, false];

//--- set terrain
	setTerrainGrid 3.125;
	
/* =============================================== */
/* ================ Server Scripts =============== */
/* =============================================== */

//--- Move base stuff
	waituntil {!isNil "BaseCreated"};
	diag_log format ["Move and init BaseCreated = %1",BaseCreated];
	execvm "Base\MoveAndInitialise.sqf";
	
//--- Stop if difficulty Settings not correct
	[] execVM "core\sC\sC.sqf";
	
	if(DEBUG) then
		{
			diag_log "I am in the SERVER init.sqf";
		};
	
//--- bl1p read the defend function
	execVm "core\bl1p_fnc_defend.sqf";

//--- server add tickets
	execVM "Server\TicketCounter.sqf";

//--- Wait for DEP to be initialized
	if (PARAMS_DEP == 1) then {
		
		waitUntil{!isNil "dep_ready"};
		waitUntil{dep_ready};
	};

//--- Set a few blank variables for event handlers and solid vars for SM
	debugMode = true; publicVariable "debugMode";
	eastSide = createCenter EAST;
	radioTowerAlive = false;publicVariable "radioTowerAlive";
	AOAICREATIONMAINDONE = false;publicVariable "AOAICREATIONMAINDONE";
	ConvoyAlive = false; publicvariable "ConvoyAlive";
	currentAOUp = false;
	refreshMarkers = true;
	sideObj = objNull;
	priorityTargets = ["None"];
	UnlockAssets = true;publicvariable "UnlockAssets";
	NUKEYES = false;publicVariable "NUKEYES";
	LASTNUKE = 0; publicVariable "LASTNUKE";
	LASTDEFEND = 0; publicVariable "LASTDEFEND";
	markerArray = [];
	
//--- victory variables
	DEPVICTORYDONE = false;publicVariable "DEPVICTORYDONE";
	AOVICTORYDONE = false;publicVariable "AOVICTORYDONE";
	TICKETLOSS = false;publicVariable "TICKETLOSS";
	CIVILIANFAIL = false;publicVariable "CIVILIANFAIL";
	BL1PISYOURGOD = true;publicVariable "BL1PISYOURGOD";
	
//--- Clean script
		_null = [] execVM "scripts\clearItems.sqf";
		//_id = addMissionEventHandler ["HandleDisconnect",{ _this execVM "scripts\clearItemsDropped.sqf"}];

//--- Run AO and/or DEP victory scripts
	if(isNil "PARAMS_AOTOGGLE") then {PARAMS_AOTOGGLE = 1};
	diag_log format ["PARAMS_AOTOGGLE = %1 ",PARAMS_AOTOGGLE];
	if (PARAMS_AOTOGGLE == 1) then 
		{ 
			_AO_UnitTypesM = execVM "Server\AO_UnitTypes_Main.sqf";
			waitUntil{scriptDone _AO_UnitTypesM}; 
			_PointlessVariable1 = execVM "Server\AOLoop.sqf";
		};
		
	if (PARAMS_DEP_VICTORY == 1) then 
		{ 
			_PointlessVariable2 = execVM "Server\DEPVictory.sqf";
		};
		
	//--- start convoys
	if (PARAMS_ConvoyChance > 0) then { _null = [] execVM "Reinforcement\AOConvoy.sqf"; };
		
		//set radio action on radiobox
		[radiobox] spawn setRadiobox;
		
diag_log "=== END OF INIT_SERVER ===";