//--- by BL1P 
if (isServer || isDedicated || !hasInterFace) exitWith {Diag_log "***I was kicked from the restrictions.sqf I am not a true client";};
if (DEBUG) then
	{
		diag_log "***Reading weapon restrictions script";
	};
	
waitUntil {!isNil "VA_MAIN"}; 
waitUntil {VA_MAIN}; 

if !(backpack player in AllowedItems || backpack player == "") then
{
	removeBackpack player;	
	systemchat "Backpack removed it's not in your class";
};

if !(vest player in AllowedItems || vest player == "") then
{
	removeVest player;	
	systemchat "Vest removed it's not in your class";
};

if !(uniform player in AllowedItems || uniform player == "") then
{
	removeUniform player;	
	systemchat "Uniform removed it's not in your class";
};

if !(headgear player in AllowedItems || headgear player == "") then
{
	systemchat format ["%1",headgear player];
	removeHeadgear player;	
	systemchat "Headgear removed it's not in your class";
};

{
	if !(_x in AllowedItems || _x == "") then
	{	
		player removeWeapon _x;
		_weaphold = "GroundWeaponHolder" createVehicle position player;
		_weaphold addWeaponCargoGlobal[_x, 1];
		systemchat format ["Weapon removed %1 is not in your class", _x];
		_null = [player] execVM "scripts\clearItemsDropped.sqf";
	};
} forEach weapons player;

/*
{
	if !(_x in AllowedItems || _x == "") then
	{
		player removeItems _x;	
		systemchat format ["Item removed %1 is not in your class", _x];
	};
} forEach items player;
*/
{
	if !(_x in AllowedItems || _x == "") then
	{
		player removePrimaryWeaponItem _x;
		systemchat format ["WeaponItem removed %1 is not in your class", _x];
	};
} forEach primaryWeaponItems player;

{
	if !(_x in AllowedItems || _x == "") then
	{
		//player removeMagazines _x;
		player action ["dropMagazine", "GroundWeaponHolder" createVehicle position player, _x];
		_null = [player] execVM "scripts\clearItemsDropped.sqf";
		systemchat format ["Item removed %1 is not in your class", _x];
	};
} forEach magazines player;