diag_log "***Reading EH_Client.sqf";

player removeAllEventHandlers "Take";
player addEventHandler ["Take", {_null = [] execVM "core\Restrictions\restrictions.sqf";}];

player removeAllEventHandlers "Put";
player addEventHandler ["Put", {_null = [(str (_this select 1))] execVM "Scripts\clearItemsPut.sqf";}];

player setVariable [ "VAcatch", [ "VAcatch", "onEachFrame", 
{ 
    if ( !( isNil { _this getVariable "VAcatch" } ) && { !( isNull ( uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ] ) ) } ) then 
	{ 
        _this setVariable [ "VAcatch", nil ];
		_thread = _this spawn 
		{ 
			_uniform = uniform _this; 
				waitUntil { isNull ( uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ] )  }; 
					//--- Arsenal closed
						//--- Set unit insignia
							[_this, "Falcons"] call BIS_fnc_setUnitInsignia;
						//--- Call weapon restrictions script
					_null = [] execVM "core\Restrictions\restrictions.sqf";
			_this setVariable [ "VAcatch", "VAcatch" ]; 
		}; 
    };  
}, player ] call BIS_fnc_addStackedEventHandler ];

//--- Remove GPS toggle unless in Vehicle by Fluit
	addMissionEventHandler ["Draw3D", 
	{   
		if (vehicle player == player && visibleGPS && inputAction "minimapToggle" == 0) then {
			showGPS false;
		} else {
			showGPS true;
		};
	}];

diag_log "***FINISHED Reading EH_Client.sqf";