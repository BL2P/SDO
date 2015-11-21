	//--- Functions for base coomander calls
	//--- VVS
	fn_VVS_sup				= compile preprocessFileLineNumbers ("Base\Functions\fn_VVS_sup.sqf");
	fn_VVS_car				= compile preprocessFileLineNumbers ("Base\Functions\fn_VVS_car.sqf");
	fn_VVS_air				= compile preprocessFileLineNumbers ("Base\Functions\fn_VVS_air.sqf");
	fn_VVS_tank				= compile preprocessFileLineNumbers ("Base\Functions\fn_VVS_tank.sqf");

	BaseFncsDone = true;publicvariable "BaseFncsDone";