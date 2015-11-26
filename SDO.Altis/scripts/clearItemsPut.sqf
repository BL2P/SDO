//--- clean up droped stuff from the restrictions script after time
private ["_itemsToClear","_pos","_rad","_delay"];

_pos = getPos player;
_rad = 150;
_delay = 300;
 
while {true} do
{
		if (DEBUG) then {diag_log "Cleaning Player Placed dropped items...";};
			_itemsToClear = nearestObjects [_pos,["weaponholder"],_rad];
				if (count _itemsToClear <= 0) exitwith {if (DEBUG) then {diag_log "No Items to clear exititing script";};};
				sleep _delay;
				{
					deleteVehicle _x;
				} forEach _itemsToClear;
			if (DEBUG) then {diag_log "Player Placed dropped Items cleared";};
		sleep 1;
};