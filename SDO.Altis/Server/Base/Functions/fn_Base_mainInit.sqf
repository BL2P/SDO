	//--- Functions for base coomander calls
	//--- VVS
	fn_VVS_sup				= compile preprocessFileLineNumbers ("Server\Base\Functions\fn_VVS_sup.sqf");
	fn_VVS_car				= compile preprocessFileLineNumbers ("Server\Base\Functions\fn_VVS_car.sqf");
	fn_VVS_air				= compile preprocessFileLineNumbers ("Server\Base\Functions\fn_VVS_air.sqf");
	fn_VVS_tank				= compile preprocessFileLineNumbers ("Server\Base\Functions\fn_VVS_tank.sqf");

	BaseFncsDone = true;publicvariable "BaseFncsDone";