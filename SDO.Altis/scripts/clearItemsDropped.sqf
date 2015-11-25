//--- clean up droped stuff from the restrictions script after time
private ["_itemsToClear","_pos","_rad","_delay"];
_pos = getPos player;
diag_log format ["_pos = %1",_pos];
_rad = 150;
_delay = 300;
 
while {true} do
{
	sleep _delay;
	if (DEBUG) then {diag_log "Cleaning Player dropped items...";};
	_itemsToClear = nearestObjects [_pos,["weaponholder"],_rad];
	if (count _itemsToClear <= 0) exitwith {if (DEBUG) then {diag_log "No Items to clear exititing script";};};
	{
		deleteVehicle _x;
	} forEach _itemsToClear;
	
	if (DEBUG) then {diag_log "Items cleared";};
};