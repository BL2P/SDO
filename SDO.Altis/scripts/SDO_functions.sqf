
SDO_fnc_deleteOldAOUnits =
{
	private ["_unitsArray", "_obj", "_group"];
	
	if (DEBUG) then {diag_log "Running SDO_fnc_deleteOldAOUnits";};
	_unitsArray = _this select 0;
	for "_c" from 0 to (count _unitsArray) do
	{
		_obj = _unitsArray select _c;
		
		//--- bl1p added if its not defined difine it bla bla
		_obj = if (isnil {_obj}) then {objnull}else{_obj}; 
		diag_log format ["_obj = %1",_obj];
			
		_group = grpNull; 
		
		if (typeName _obj == "GROUP") then
		{
			{
				if (!isNull _x) then { deleteVehicle _x; };
			} forEach (units _obj);
			_group = _obj;
		};
		if (typeName _obj == "OBJECT") then
		{
			// Fluit: Get group of object to clean afterwards
			_group = group _obj;
			
			if (!isNull _obj) then { deleteVehicle _obj; };
		};
		
		// Fluit: If the group is empty, delete it. 
		if (!isNull _group) then {
			if (count units _group == 0) then {
				deleteGroup _group;
			};
		};
	};
	sleep 1;
};

//--- refil fuel on AI vehicles
SDO_fnc_fuelMonitor = 
{
	if(hasinterface OR (vehicle _this == _this)) exitWith {};
	while{(alive _this) AND (({side _x == east} count (crew _this)) > 0)} do
	{
		waitUntil{sleep 2;(fuel _this < 0.1) OR !(alive _this) OR !(({side _x == east} count (crew _this)) > 0)};
		if((alive _this) AND (({side _x == east} count (crew _this)) > 0)) then {_x setFuel 1};
	};
};

//--- create random pos
SDO_fnc_randomPos = 
{
	private["_center","_radius","_exit","_pos","_angle","_posX","_posY","_size","_flatPos","_debugCounter"];
	_center = _this select 0;
	_size = if(count _this > 2) then {_this select 2};
	_exit = false;
	_debugCounter = 0;
	while{!_exit} do
	{
		//if (DEBUG) then { diag_log format["Finding flat position in SDO_fnc_randomPos script.Attempt #%1",_debugCounter]; };
		_debugCounter = _debugCounter + 1;
		
		_radius = random (_this select 1);
		_angle = random 360;
		_posX = (_radius * (sin _angle));
		_posY = (_radius * (cos _angle));
		_pos = [_posX + (_center select 0),_posY + (_center select 1),0];
		if(!surfaceIsWater [_pos select 0,_pos select 1]) then 
		{
			if(count _this > 2) then 
			{
				_flatPos = _pos isFlatEmpty [_size / 2,0,0.7,_size,0,false];
				if(count _flatPos != 0) then 
				{
					_pos = _flatPos;
					_exit = true;
				} 
				else 
				{
					if (_debugCounter >= 100) then 
					{
						_pos = [];
						_exit = true;
					};
				};
			} 
			else 
			{
			_exit = true;
			};
		};
		sleep 0.1;
	};
	_pos;
};

//--- edited random pos
SDO_fnc_randomPosbl1p = 
{
	private["_center","_radius","_exit","_pos","_angle","_posX","_posY","_size","_flatPos","_debugCounter"];
	_center = _this select 0;
	_size = if(count _this > 2) then {_this select 2};
	_exit = false;
	_debugCounter = 0;
	while{!_exit} do
	{
		//if (DEBUG) then { diag_log format["Finding flat position in SDO_fnc_randomPosbl1p script.Attempt #%1",_debugCounter]; };
		_debugCounter = _debugCounter + 1;
		
		_radius = _this select 1;
		_angle = random 360;
		_posX = (_radius * (sin _angle));
		_posY = (_radius * (cos _angle));
		_pos = [_posX + (_center select 0),_posY + (_center select 1),0];
		if(!surfaceIsWater [_pos select 0,_pos select 1]) then 
		{
			if(count _this > 2) then 
			{
				_flatPos = _pos isFlatEmpty [_size / 2,0,0.7,_size,0,false];
				if(count _flatPos != 0) then 
				{
					_pos = _flatPos;
					_exit = true;
				} else {
					if (_debugCounter >= 100) then {
						_pos = [];
						_exit = true;
					};
				};
			} else {_exit = true};
		};
		sleep 0.1;
	};
	
	_pos;
};

//---- give ai waypoint behaviours
SDO_fnc_spawn2_waypointBehaviour = 
{
	if(hasinterface) exitWith{};
	while{({alive _x} count (units _this) > 0)} do
	{
		waitUntil{sleep 1;({(_x select 2) == west} count ((leader _this) nearTargets 1000) > 1) OR !({alive _x} count (units _this) > 0)};
		if({alive _x} count (units _this) > 0) then
		{
			{
				if(waypointType _x == "MOVE") then {_x setWaypointBehaviour "SAD"};
				_x setWaypointBehaviour "COMBAT";
				_x setWaypointBehaviour "WEDGE";
			}forEach (waypoints _this);
		};
		waitUntil{sleep 1;({(_x select 2) == west} count ((leader _this) nearTargets 1600) < 1) OR !({alive _x} count (units _this) > 0)};
		if({alive _x} count (units _this) > 0) then
		{
			{
				if(waypointType _x == "SAD") then {_x setWaypointBehaviour "MOVE"};
				_x setWaypointBehaviour "SAFE";
				_x setWaypointBehaviour "STAG COLUMN";
			}forEach (waypoints _this);
		};
		sleep 0.5;
	};
};
SDO_fnc_spawn2_perimeterPatrolConvoy =
{
	if(hasinterface) exitWith{};
	private["_group","_center","_radius","_wp","_angle","_currentAngle","_wp1","_pos","_x","_toCenter"];
	_group = _this select 0;
	_center = _this select 1;
	_radius = _this select 2;
	_waypointNumbers = if(count _this > 3) then {_this select 3} else {5 + floor ((random 5))};
	_toCenter = if(count _this > 4) then {_this select 4} else {false};
	
	_angle = 360 / _waypointNumbers;
	_currentAngle = _angle + (random 360);
	
	for [{_x=1},{_x<=_waypointNumbers},{_x=_x+1}] do
	{
		_pos = [_center,_radius,_currentAngle] call SDO_fnc_radPos;
		_wp = _group addWaypoint [_pos,0];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointFormation "COLUMN";
		_wp setWaypointBehaviour "CARELESS";
		_wp setWaypointTimeOut [0,5,10];
		_wp setWaypointCompletionRadius 15;
		
		if(DEBUG) then
		{
			_name = format ["%1",_wp];
			createMarkerLocal [_name,waypointPosition _wp];
			_name setMarkerType "mil_dot";
			_name setMarkerText format["%1",_x];
		};
		
		if(_x == 1) then {_wp1 = _wp};
		_currentAngle = _currentAngle + _angle;
	};
	
	if(_toCenter) then 
	{
		_wp = _group addWaypoint [_center,0];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointFormation "COLUMN";
	};
	
	_wp = _group addWaypoint [waypointPosition _wp1,0];
	_wp setWaypointType "CYCLE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointFormation "COLUMN";
	
	if(DEBUG) then
	{
		_name = format ["%1",_wp];
		createMarkerLocal [_name,waypointPosition _wp];
		_name setMarkerType "mil_dot";
		_name setMarkerText "Cycle";
	};
	
	//_group spawn SDO_fnc_spawn2_waypointBehaviourConvoy;
};

//---- Edited give ai waypoint behaviours
SDO_fnc_spawn2_waypointBehaviourConvoy =
{
	if(hasinterface) exitWith{};
	while{({alive _x} count (units _this) > 0)} do
	{
		waitUntil{sleep 1;({(_x select 2) == west} count ((leader _this) nearTargets 1000) > 1) OR !({alive _x} count (units _this) > 0)};
		if({alive _x} count (units _this) > 0) then
		{
			{
				if(waypointType _x == "MOVE") then {_x setWaypointBehaviour "SAD"};
				//_x setWaypointSpeed "LIMITED";
				_x setWaypointBehaviour "COMBAT";
				//_x setWaypointBehaviour "COLUMN";
				
			}forEach (waypoints _this);
		};
		waitUntil{sleep 1;({(_x select 2) == west} count ((leader _this) nearTargets 1600) < 1) OR !({alive _x} count (units _this) > 0)};
		if({alive _x} count (units _this) > 0) then
		{
			{
				if(waypointType _x == "SAD") then {_x setWaypointBehaviour "MOVE"};
				_x setWaypointSpeed "LIMITED";
				_x setWaypointBehaviour "CARELESS";
				_x setWaypointBehaviour "COLUMN";
			}forEach (waypoints _this);
		};
		sleep 0.5;
	};
};

SDO_fnc_spawn2_waypointBehaviourBL1P = 
{
	if(hasinterface) exitWith{};
	while{({alive _x} count (units _this) > 0)} do
	{
		waitUntil{sleep 1;({(_x select 2) == west} count ((leader _this) nearTargets 1000) > 1) OR !({alive _x} count (units _this) > 0)};
		if({alive _x} count (units _this) > 0) then
		{
			{
				if(waypointType _x == "MOVE") then {_x setWaypointBehaviour "SAD"};
				_x setWaypointSpeed "FULL";
				_x setWaypointBehaviour "COMBAT";
				_x setWaypointBehaviour "LINE";
				
			}forEach (waypoints _this);
		};
		waitUntil{sleep 1;({(_x select 2) == west} count ((leader _this) nearTargets 1600) < 1) OR !({alive _x} count (units _this) > 0)};
		if({alive _x} count (units _this) > 0) then
		{
			{
				if(waypointType _x == "SAD") then {_x setWaypointBehaviour "MOVE"};
				_x setWaypointSpeed "FULL";
				_x setWaypointBehaviour "AWARE";
				_x setWaypointBehaviour "LINE";
			}forEach (waypoints _this);
		};
		sleep 0.5;
	};
};

//---- radial pos
SDO_fnc_radPos = 
{
	if(hasinterface) exitWith{};
	private["_center","_radius","_angle","_pos","_exit","_posX","_posY"];
	_center = _this select 0;
	_radius = _this select 1;
	_angle = _this select 2;
	_exit = false;
	
	while{!_exit} do
	{
		_posX = (_radius * (sin _angle));
		_posY = (_radius * (cos _angle));
		_pos = [_posX + (_center select 0),_posY + (_center select 1),0];
		if(!surfaceIsWater [_pos select 0,_pos select 1]) then {_exit = true} else {_radius = _radius - 1};
		if(_radius == 0) then {_pos = _center;_exit = true};
	};
	_pos;
};

//--- edited random patrol
SDO_fnc_spawn2_randomPatrolBL1P = 
{
	if(hasinterface) exitWith{};
	private["_group","_center","_radius","_wp","_checkDist","_angle","_currentAngle","_pos","_wp1","_x"];
	_group = _this select 0;
	_center = _this select 1;
	_radius = _this select 2;
	_waypointNumbers = if(count _this > 3) then {_this select 3} else {5 + floor ((random 5))};
	
	for [{_x=1},{_x<=_waypointNumbers},{_x=_x+1}] do
	{
		_pos = [_center,(random _radius),(random 360)] call SDO_fnc_radPos;
		_wp = _group addWaypoint [_pos,0];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "FULL";
		_wp setWaypointFormation "LINE";
		//_wp setWaypointBehaviour "COMBAT";
		_wp setWaypointTimeOut [0,10,40];
		_wp setWaypointCompletionRadius 15;
		
		if(DEBUG) then
		{
			_name = format ["%1",_wp];
			createMarkerLocal [_name,waypointPosition _wp];
			_name setMarkerType "mil_dot";
			_name setMarkerText format["%1",_x];
		};
		
		if(_x == 1) then {_wp1 = _wp};
	};
	
	_wp = _group addWaypoint [waypointPosition _wp1,0];
	_wp setWaypointType "CYCLE";
	_wp setWaypointSpeed "FULL";
	_wp setWaypointFormation "LINE";
	//_wp setWaypointBehaviour "COMBAT";
	
	if(DEBUG) then
	{
		_name = format ["%1",_wp];
		createMarkerLocal [_name,waypointPosition _wp];
		_name setMarkerType "mil_dot";
		_name setMarkerText "Cycle";
	};
	
	_group spawn SDO_fnc_spawn2_waypointBehaviourBL1P;
};

//--- random patrol
SDO_fnc_spawn2_randomPatrol = 
{
	if(hasinterface) exitWith{};
	private["_group","_center","_radius","_wp","_checkDist","_angle","_currentAngle","_pos","_wp1","_x"];
	_group = _this select 0;
	_center = _this select 1;
	_radius = _this select 2;
	_waypointNumbers = if(count _this > 3) then {_this select 3} else {5 + floor ((random 5))};
	
	for [{_x=1},{_x<=_waypointNumbers},{_x=_x+1}] do
	{
		_pos = [_center,(random _radius),(random 360)] call SDO_fnc_radPos;
		_wp = _group addWaypoint [_pos,0];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointFormation "STAG COLUMN";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointTimeOut [0,10,40];
		_wp setWaypointCompletionRadius 15;
		
		if(DEBUG) then
		{
			_name = format ["%1",_wp];
			createMarkerLocal [_name,waypointPosition _wp];
			_name setMarkerType "mil_dot";
			_name setMarkerText format["%1",_x];
		};
		
		if(_x == 1) then {_wp1 = _wp};
	};
	
	_wp = _group addWaypoint [waypointPosition _wp1,0];
	_wp setWaypointType "CYCLE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointFormation "STAG COLUMN";
	_wp setWaypointBehaviour "SAFE";
	
	if(DEBUG) then
	{
		_name = format ["%1",_wp];
		createMarkerLocal [_name,waypointPosition _wp];
		_name setMarkerType "mil_dot";
		_name setMarkerText "Cycle";
	};
	
	_group spawn SDO_fnc_spawn2_waypointBehaviour;
};

//--- Edited perim partol
SDO_fnc_spawn2_perimeterPatrolBL1P = 
{
	if(hasinterface) exitWith{};
	private["_group","_center","_radius","_wp","_angle","_currentAngle","_wp1","_pos","_x","_toCenter"];
	_group = _this select 0;
	_center = _this select 1;
	_radius = _this select 2;
	_waypointNumbers = if(count _this > 3) then {_this select 3} else {5 + floor ((random 5))};
	_toCenter = if(count _this > 4) then {_this select 4} else {false};
	
	_angle = 360 / _waypointNumbers;
	_currentAngle = _angle + (random 360);
	
	for [{_x=1},{_x<=_waypointNumbers},{_x=_x+1}] do
	{
		_pos = [_center,_radius,_currentAngle] call SDO_fnc_radPos;
		_wp = _group addWaypoint [_pos,0];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointFormation "STAG COLUMN";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointTimeOut [0,5,10];
		_wp setWaypointCompletionRadius 15;
		
		if(DEBUG) then
		{
			_name = format ["%1",_wp];
			createMarkerLocal [_name,waypointPosition _wp];
			_name setMarkerType "mil_dot";
			_name setMarkerText format["%1",_x];
		};
		
		if(_x == 1) then {_wp1 = _wp};
		_currentAngle = _currentAngle + _angle;
	};
	
	if(_toCenter) then 
	{
		_wp = _group addWaypoint [_center,0];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointFormation "COLUMN";
	};
	
	_wp = _group addWaypoint [waypointPosition _wp1,0];
	_wp setWaypointType "CYCLE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointFormation "COLUMN";
	
	if(DEBUG) then
	{
		_name = format ["%1",_wp];
		createMarkerLocal [_name,waypointPosition _wp];
		_name setMarkerType "mil_dot";
		_name setMarkerText "Cycle";
	};
	
	_group spawn SDO_fnc_spawn2_waypointBehaviourBL1P;
};

//--- perim patrol
SDO_fnc_spawn2_perimeterPatrol = 
{
	if(hasinterface) exitWith{};
	private["_group","_center","_radius","_wp","_angle","_currentAngle","_wp1","_pos","_x","_toCenter"];
	_group = _this select 0;
	_center = _this select 1;
	_radius = _this select 2;
	_waypointNumbers = if(count _this > 3) then {_this select 3} else {5 + floor ((random 5))};
	_toCenter = if(count _this > 4) then {_this select 4} else {false};
	
	_angle = 360 / _waypointNumbers;
	_currentAngle = _angle + (random 360);
	
	for [{_x=1},{_x<=_waypointNumbers},{_x=_x+1}] do
	{
		_pos = [_center,_radius,_currentAngle] call SDO_fnc_radPos;
		_wp = _group addWaypoint [_pos,0];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointFormation "STAG COLUMN";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointTimeOut [0,5,10];
		_wp setWaypointCompletionRadius 15;
		
		if(DEBUG) then
		{
			_name = format ["%1",_wp];
			createMarkerLocal [_name,waypointPosition _wp];
			_name setMarkerType "mil_dot";
			_name setMarkerText format["%1",_x];
		};
		
		if(_x == 1) then {_wp1 = _wp};
		_currentAngle = _currentAngle + _angle;
	};
	
	if(_toCenter) then 
	{
		_wp = _group addWaypoint [_center,0];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointFormation "STAG COLUMN";
	};
	
	_wp = _group addWaypoint [waypointPosition _wp1,0];
	_wp setWaypointType "CYCLE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointFormation "STAG COLUMN";
	
	if(DEBUG) then
	{
		_name = format ["%1",_wp];
		createMarkerLocal [_name,waypointPosition _wp];
		_name setMarkerType "mil_dot";
		_name setMarkerText "Cycle";
	};
	
	_group spawn SDO_fnc_spawn2_waypointBehaviour;
};

//--- set AI skills on some groups
SDO_setGroupSkill = 
{

};

//--- Search for hill or mountains for snipers
SDO_fnc_Snipers = 
{ 
		if(hasinterface) exitWith{};
			private["_center","_radius","_pos"];
			_center = _this select 0;
			_radius = _this select 1;
			_nearbyHills = nearestLocations [_center, ["Mount"], _radius];
			//_nearbyHills = nearestLocations [_center, ["Hill"], _radius];
			_pos = [];
			if ((count _nearbyHills) > 0) then {
			If (DEBUG) then {diag_log "Mount selected____ SNIPER"; };
			_Mount = _nearbyHills call bis_fnc_selectrandom;
			_pos = getPos _Mount;
			} else {
			If (DEBUG) then {diag_log "Random Pos selected____ SNIPER"; };
			_pos = [_center, _radius] call SDO_fnc_randomPosbl1p;};
			_pos;
};

//--- cleanup
SDO_cleanGroups =
{
if (DEBUG) then {diag_log "Running   SDO_cleanGroups";};
	if(hasinterface) exitWith{};
	{
		if(count (units _x) == 0) then {deleteGroup _x};
	}forEach allGroups;
};

//--- teleport to pos if in debug mode
SDO_serverMapTP =
{
	if(!DEBUG) exitWith{};
	onMapSingleClick "player setPos _pos;onMapSingleClick '';true";
};
//--- bl1p destroy east units and destroy radio tower 
SDO_fnc_AOAdvance =
{
	if(!DEBUG) exitWith{};
	
	{ if (side _x == east) then {_x setdamage 1;} } foreach allunits;
	radioTower setdamage 1;
};