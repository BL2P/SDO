//////////////////////////////////////////////
//        SDO_N_Friends.sqf					
//        by Fluit n BL1P						
//     execVM "SDO_N_Friends.sqf	;	
//////////////////////////////////////////////
if (DEBUG) then {
diag_log "***reading SDO_N_Friends.sqf";
};
private ["_FalconFriends","_IamAFALCONFriend", "_isAdmin", "_welcome", "_welcomeadmin", "_isFalcon"];
_IamAFALCONFriend = false;
_isAdmin = false;

_welcome = [
			"Welcome back %1"
			];
_welcomeadmin = [
			"Welcome back %1"
			];			
			
//systemchat "SDO-n-Friends... is running on this Server.";

if (isServer) exitWith 
{
	SDOFriendsArray = call compile preprocessFile "\SDO\SDOFriends.sqf";
	publicVariable "SDOFriendsArray";
};

		
if (isNil ("SDOFriendsArray")) then 
	{
		diag_log "***waiting for SDOFriendsArray";
		waitUntil {!isNil("SDOFriendsArray")};
		diag_log "***FINISHED waiting for SDOFriendsArray";
	};
sleep 1;
	
{
    if ( (getPlayerUID player) == (_x select 0)) then {
        // Player UID is in friend list => he is our friend
        _IamAFALCONFriend = true;

			if ( (_x select 1) == 1) then {
				// Player is an admin
				_isAdmin = true;
			};
		};
} forEach SDOFriendsArray;

player setVariable["friend", _IamAFALCONFriend, true];
player setVariable["admin", _isAdmin, true];
_playerType = typeOf player;


if (_IamAFALCONFriend) then {
	if (_isAdmin) then {
		//--- level 2
		//systemChat format [_welcomeadmin call BIS_fnc_selectRandom, name player];
		SDOmessage = format [_welcomeadmin call BIS_fnc_selectRandom, name player];
		
	} else {
		//--- level 1
		//systemChat format [_welcome call BIS_fnc_selectRandom, name player];
		SDOmessage = format [_welcome call BIS_fnc_selectRandom, name player];
		//[str (_message)] spawn BIS_fnc_infoText;
	};
} else {
		//--- level None
		systemChat format ["Hello %1 welcome to the Falcons Nest server",name player];
		systemChat "Contact info is in on the map, under info or Not";
		systemChat "Enjoy your stay";
};
if (DEBUG) then {
diag_log "***FINISHED reading SDO_N_Friends.sqf";
};