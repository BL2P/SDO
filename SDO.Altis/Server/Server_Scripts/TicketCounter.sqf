	diag_log "***Reading TicketCounter.sqf";
//--- bl1p ticket counter for end game on zero tickets
if (isServer) then
{
	if (isNil "PARAMS_ticketLimit") then {PARAMS_ticketLimit = 9999};
	[west, PARAMS_ticketLimit] call BIS_fnc_respawnTickets;
	
	_run = true;
	while {_run} do
	{
		
		westScoreTickets = [west] call BIS_fnc_respawnTickets;
		publicVariable "westScoreTickets";
		
		if (westScoreTickets < 1) then
		{
			TICKETLOSS = true;publicVariable "TICKETLOSS";
			mps_mission_finished = "true"; publicvariable "mps_mission_finished";
			_run = false;
		};
		sleep 5;
	};
};