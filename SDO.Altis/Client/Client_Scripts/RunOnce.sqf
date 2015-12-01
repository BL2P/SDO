
diag_log "***RUNONCE Start==============";

if (isServer || isDedicated || !hasInterFace) exitwith {diag_log "***I was kicked from the RUNONCE.sqf";};
if (isNil "RUNONCERunning") then {RUNONCERunning = false};
if (isNil "RAN_ONCE") then {RAN_ONCE = false};
if (RUNONCERunning) exitwith {diag_log "***Exiting RUNONCE its already running";};
if (RAN_ONCE) exitwith {diag_log "***Exiting RUNONCE already done";};

//--- script is running
	RUNONCERunning = true;

//--- Wait until player is initialized
	waitUntil {!isNull player && isPlayer player};
	sidePlayer = side player;

///////////////////////////////////////////////////////////////////////
	
//--- remove stuff
	removeAllWeapons player;
	removeBackpack player;
	removeVest player;
	removeGoggles player;
	
if (isNil "PARAMS_ALLOW_UNIFORM")  then  { waitUntil{!isNil "PARAMS_ALLOW_UNIFORM"};};
	if (PARAMS_ALLOW_UNIFORM < 5) then 
		{	
			_ClassOfficer = ["B_officer_F"];
			if (typeOf player in _ClassOfficer) then 
				{
					removeHeadgear player; 
					player addHeadgear "Falcons_Beret_Red";
				} 
				else
				{
					removeHeadgear player; 
					player addHeadgear "Falcons_Beret_Green";
				};
		}
		else
		{
			removeHeadgear player; 
		};
	_ClassHeli = ["B_Helipilot_F","B_helicrew_F","B_Pilot_F","B_soldier_repair_F"];
	if !(typeOf player in _ClassHeli) then 
		{
			removeUniform player;
			if (isNil "PARAMS_ALLOW_UNIFORM")  then  { waitUntil{!isNil "PARAMS_ALLOW_UNIFORM"};};
				if (PARAMS_ALLOW_UNIFORM < 5) then 
					{	
						if(PARAMS_ALLOW_UNIFORM == 0) then 
							{
								player addUniform "Falcons_CombatUniform_DPM_tshirt";
							};
						if(PARAMS_ALLOW_UNIFORM == 1) then 
							{
								player addUniform "Falcons_CombatUniform_DPM_tshirt";
							};
						if(PARAMS_ALLOW_UNIFORM == 2) then 
							{
								player addUniform "Falcons_CombatUniform_URBAN_tshirt";
							};
						if(PARAMS_ALLOW_UNIFORM == 3) then 
							{
								player addUniform "Falcons_CombatUniform_Dark_tshirt";
							};
						if(PARAMS_ALLOW_UNIFORM == 4) then 
							{
								player addUniform "Falcons_CombatUniform_Desert_tshirt";
							};	

					}
					else
					{
						player addUniform "U_B_CTRG_1";
					};
		};
		
	player unassignItem "NVGoggles";
	player removeItem "NVGoggles";
	
	player unassignItem "ItemRadio";
	player removeItem "ItemRadio";
///////////////////////////////////////////////////////////////////////	

//--- BL1P restart acre when alive but not on jip
	if !(isNil "Init_Client") then {
		if !(isNil "acre_enabled") then 
			{
				if (acre_enabled) then 
				{
					_ret = [false] call acre_api_fnc_setSpectator;
				};
			};
	};


//--- Set/reset the Insignia
	[player, "Falcons"] call BIS_fnc_setUnitInsignia;


//--- tickets
	if (PARAMS_ticketLimit < 99999) then 
		{
			waituntil {!isNil "westScoreTickets"};
			systemChat format ["Team Tickets Remaining = %1",westScoreTickets];
		};
	
	
//--- Load client Event Handlers
	_null = [] execVM "Client\EH_Client.sqf";

//--- script has stopped
	RUNONCERunning = false;
//--- script has been ran
	RAN_ONCE = true;
	
diag_log "***RUNONCE End==============";


