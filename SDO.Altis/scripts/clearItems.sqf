if(!isServer) exitwith {};
private ["_itemsToClear","_pos","_rad"];
_pos = dep_map_center; 
_rad = 16000;
 
while {true} do
{
diag_log "***Waiting for players to be ZERO";
	waituntil {servertime > 5};
	waituntil {count  allPlayers == 0};
diag_log "***Finished Waiting for players to be ZERO Running the Clean up";
		if (DEBUG) then {diag_log "Cleaning ALL dropped items...";};
			_itemsToClear = nearestObjects [_pos,["weaponholder"],_rad];
				{
				if (count _itemsToClear <= 0) exitwith {if (DEBUG) then {diag_log "***No Items to clear exititing script";};};
					deleteVehicle _x;
				} forEach _itemsToClear;
			if (DEBUG) then {diag_log "Items cleared";};
diag_log "***Waiting for players to be ONE or More";
		waituntil {count  allPlayers >= 1};
};