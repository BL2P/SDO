//--- clean up droped stuff from the restrictions script after time
private ["_itemsToClear","_pos","_rad","_delay"];

_pos = getPos player;
_rad = 150;
_delay = 300;
 
while {true} do
{
			_itemsToClear = nearestObjects [_pos,["weaponholder"],_rad];
				if (count _itemsToClear <= 0) exitwith {};
				sleep _delay;
				_itemsToClear = nearestObjects [_pos,["weaponholder"],_rad];
				{
					deleteVehicle _x;
				} forEach _itemsToClear;
			sleep 1;
};