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
			"Welcome back %1",
			"Hello %1!",
			"What's up %1!",
			"Hey its %1!",
			"Wotcha %1",
			"Ay-up %1",
			"Welcome home Lord %1",
			" %1! Thou hast returneth",
			"Delighted to see you %1",
			"Golly gosh...! if it isnt %1",
			"My word %1 is that a gun in your pants or are you pleased to be back?",
			"%1 Today try to remember G is not for Gear !!",
			"Accessing Bank details for %1",
			"player %1 Connected dangerous weapons removed",
			"Its a bird ! ... Its a plane !... NO its %1",
			"OMG! Yay! its %1",
			"Ladies and Gentlemen.... I present to you... %1",
			"%1..  %1..  %1.. hip.. hip.. hooorah",
			"Jolly hockey sticks its %1",
			"Well slap me in the face with a wet kipper... if it isnt %1",
			"Shhhh %1s back",
			"%1 connected ..... accessing password details .... password taken from %1",
			"The people await your orders %1."
			];
_welcomeadmin = [
			"Welcome back %1",
			"Hello %1!",
			"What's up %1!",
			"Hey its %1!",
			"Wotcha %1",
			"Ay-up %1",
			"Welcome home Lord %1",
			"%1! Thou hast returneth",
			"Delighted to see you %1",
			"Golly gosh...! if it isnt %1",
			"My word %1 is that a gun in your pants or are you pleased to be back?",
			"%1 Today try to remember G is not for Gear !!",
			"Accessing Bank details for %1",
			"player %1 Connected dangerous weapons removed",
			"Its a bird ! ... Its a plane !... NO its %1",
			"OMG! Yay! its %1",
			"Ladies and Gentlemen.... I present to you... %1",
			"%1..  %1..  %1.. hip.. hip.. hooorah",
			"Jolly hockey sticks its %1",
			"Well slap me in the face with a wet kipper... if it isnt %1",
			"Shhhh %1s back",
			"%1 connected ..... accessing password details .... password taken from %1",
			"The people await your orders %1."
			];			
			
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
		SDOmessage = format [_welcomeadmin call BIS_fnc_selectRandom, name player];
		
	} else {
		//--- level 1
		SDOmessage = format [_welcome call BIS_fnc_selectRandom, name player];
	};
} else {
		//--- level None
		SDOmessage = format [_welcome call BIS_fnc_selectRandom, name player];
};
if (DEBUG) then {
diag_log "***FINISHED reading SDO_N_Friends.sqf";
};