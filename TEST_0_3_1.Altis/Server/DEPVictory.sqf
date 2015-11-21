//--- wait for cleared zones then end mission
//--- Not a loop but whatever

	diag_log "====== READING DERVictory.sqf============";
			waitUntil {!isNil "dep_ready"};
			//_zones = [];
			_zones = ['roadpop'];
		
			_keeptrying = true;
			while {_keeptrying} do
			{
				_clear = 0;
				_total = 0;
				{
					if ((_x select 1) in _zones) then
					{
						_total = _total + 1;
						if ((_x select 7)) then { _clear = _clear + 1; };
					};
				} forEach dep_locations;
				diag_log format ["total %1 cleared %2 ", _total, _clear];
				if (_clear == _total) then {_keeptrying = false; };
				sleep 10;
			};
// End game code follows here
	
	DEPVICTORYDONE = true;publicVariable "DEPVICTORYDONE";
	mps_mission_finished = "true"; publicvariable "mps_mission_finished";
	
	diag_log "====== FINISHED READING DERVictory.sqf============";