if (hasinterface) exitwith {};

private ["_accepted","_nearUnits","_player"];

_accepted = false;
while {!_accepted} do 
{
	if (count  allPlayers >= 1) then 
	{
		_nearUnits = 0;
			{
				_player = _x;
				{
					if ((_x distance (getPos _player)) < 1800) exitwith
							{
								_nearUnits = _nearUnits + 1;
							};
				} foreach allConvoy;
				
			} forEach allPlayers;
			
		if (_nearUnits == 0) then
			{
				_accepted = true;
			};
		
		if (_nearUnits > 0) then
			{
				if (DEBUG) then 
				{
					diag_log "***Players near waiting for them to move away";
				};
			};
		sleep 30;
	} 
	else 
	{
		_accepted = true;
	};
};
		ConvoyEndPoint = true;
		 publicVariable "ConvoyEndPoint";
		showNotification = ["CompletedSub", "Convoy Location Lost."]; publicVariable "showNotification";
		{
				{
					deleteVehicle _x;
				}forEach crew _x;
			deleteVehicle _x;
		} foreach allConvoy;
		if(DEBUG) then 
			{
				deleteMarker 'Start'; 
				deleteMarker 'End';
				deleteMarker 'Ambush';
			};	
				deleteMarker 'pos1';
				deleteMarker 'pos2';
				deleteMarker 'pos3';

if (DEBUG) then 
	{
		diag_log "***CONVOY DESTROYED BECAUSE REACHED END OR PLAYERS = ZERO";
	};