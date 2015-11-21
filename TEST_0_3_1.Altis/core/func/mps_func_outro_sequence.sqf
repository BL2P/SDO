// Written by BON_IF
// Adpated by EightySix
// Stolen by BL1P

if (DEBUG) then 
	{
	Diag_log "I am in the MPS_FUNC_OUTRO_sequence.SQF";
	};

if(isDedicated) exitWith{diag_log "I was kicked from MPS_FUNC_OUTRO_CAMERA.SQF";};

private["_count","_titles","_time"];

[] spawn 
	{
		waitUntil {!isNil "mps_mission_finished"};
        player allowDamage false;
		player setcaptive true;
		setViewDistance 3000;
		setObjectViewDistance 3500;
        disableUserInput true;
	//--- Victory message	
		if (DEPVICTORYDONE) then 
			{
				109 cutText ["====...Congratulations All Zones Cleared...====","BLACK OUT",1];
			};
		if (AOVICTORYDONE) then 
			{
				109 cutText ["====...Congratulations All AOs Cleared...====","BLACK OUT",1];
			};
		if (TICKETLOSS) then 
			{
				109 cutText ["====...All Tickets Used...====","BLACK OUT",1];
			};
		if (CIVILIANFAIL) then 
			{
				109 cutText ["====...Too Many Civilians Killed...====","BLACK OUT",1];
			};
		_playersNumber = {isPlayer _x} count allUnits;
		_time = 4*_playersnumber;
		
	//--- play music type	
		if (DEPVICTORYDONE) then 
			{
				playsound "MOVIN";
			};
		if (AOVICTORYDONE) then 
			{
				playsound "MOVIN";
			};
		if (TICKETLOSS) then 
			{
				hndl = ppEffectCreate ["colorCorrections", 1501];    
				hndl ppEffectEnable true;
				hndl ppEffectAdjust [1,0.4,0,[0,0,0,0],[1,1,1,0],[1,1,1,1]];
				hndl ppEffectCommit 0;
				playMusic "AmbientTrack01_F";
			};
		if (CIVILIANFAIL) then 
			{
				hndl = ppEffectCreate ["colorCorrections", 1501];    
				hndl ppEffectEnable true;
				hndl ppEffectAdjust [1,0.4,0,[0,0,0,0],[1,1,1,0],[1,1,1,1]];
				hndl ppEffectCommit 0;
				playMusic "AmbientTrack01_F";
			};
			
		if (daytime > 19.75 || daytime < 4.15) then {camUseNVG true};
		sleep 10;
		109 cutText["","BLACK IN",2];
				[player,_time] spawn mps_outro_camera;
		sleep (_time);
		110 cutText ["BL1P, Fluit and Flipped Thank YOU for playing..","BLACK OUT",34];
		sleep 60;

        disableUserInput false;
		
	//--- End mission Type
		if (AOVICTORYDONE) then 
			{
				"AOWIN" call BIS_fnc_endMission;
			};
		if	(DEPVICTORYDONE) then
			{
				"DEPWIN" call BIS_fnc_endMission;
			};
		if (TICKETLOSS) then 
			{
				"TICKETFAIL" call BIS_fnc_endMission;
			};
		if (CIVILIANFAIL) then 
			{
				"End6" call BIS_fnc_endMission;
			};
	};