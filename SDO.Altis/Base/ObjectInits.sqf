
if (isNil "BaseFncsDone") then 
{
    waitUntil {!isNil "BaseFncsDone"};
	waituntil {BaseFncsDone};
};
if (!(rndBase == StadBase) && !(rndBase == HillBase1) && !(rndBase == CapBase) && !(rndBase == BeachBase) && !(rndBase == RoundBase) && !(rndBase == Hawk_Base) && !(rndBase == SeaSide) && !(rndBase == Penin)) then 
	{

		_obj = _this select 0;

		//--- Signs
			if (_obj == Sign_1) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\Falcons.paa"];
				};
				
			if (_obj == Sign_2) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\FalconsNest.paa"];
				};
				
			if (_obj == Sign_3) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\Falcons.paa"];
				};
				
			if ((_obj == Sign_4) || (_obj == Sign_5)) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\CautionHeli.paa"];
				};
				
			if ((_obj == Sign_6) || (_obj == Sign_7)) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\Parking.paa"];
				};
				
		//--- Ammo boxes
			if (_obj == Ammo_1) then 
				{
					_obj allowDamage false;  
				};

		//--- Support signs
			if (_obj == Supportsign_1) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\Support.paa"];
					[[_obj],"fn_VVS_sup",true,true] spawn BIS_fnc_MP;
				};
				
			if (_obj == Supportsign_2) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\Air.paa"];
					[[_obj],"fn_VVS_air",true,true] spawn BIS_fnc_MP;
				};
				
			if (_obj == Supportsign_3) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\Cars.paa"];
					[[_obj],"fn_VVS_car",true,true] spawn BIS_fnc_MP;
				};
				
			if (_obj == Supportsign_4) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\Armour.paa"];
					[[_obj],"fn_VVS_tank",true,true] spawn BIS_fnc_MP;
				};

		//--- Vehicles
			
			//--- trucks
				if (
					(_obj == Fuel_Truck_1) || 
					(_obj == Repair_Truck_1) || 
					(_obj == MedicalTruck_1) || 
					(_obj == AmmoTruck_1) ) then 
					{
						_m = [_obj,300,0] execVM "Base\scripts\vehicle.sqf";
					};
				//--- Medical heal action
				if (_obj == MedicalTruck_1) then 
					{
						//[[_obj],"fn_MedicalTruck",true,true] spawn BIS_fnc_MP;
					};
			
			//--- Quads
				if (
					(_obj == quad_1) || 
					(_obj == quad_2) || 
					(_obj == quad_3) || 
					(_obj == quad_4) || 
					(_obj == quad_5) || 
					(_obj == quad_6) || 
					(_obj == quad_7) || 
					(_obj == quad_8) || 
					(_obj == quad_9) || 
					(_obj == quad_10) || 
					(_obj == quad_11) || 
					(_obj == quad_12)) then 
					{
						_m = [_obj,30,1800] execVM "Base\scripts\vehicle.sqf";
					};
					
			//--- hunters
				if (
					(_obj == car_1) || 
					(_obj == car_2) || 
					(_obj == car_3) || 
					(_obj == car_4) || 
					(_obj == car_5) || 
					(_obj == car_6) || 
					(_obj == car_7) || 
					(_obj == car_8)) then 
					{
						//_m = [_obj,300,43200] execVM "Base\scripts\vehicle.sqf";
						_m = [_obj,300,0] execVM "Base\scripts\vehicle.sqf";
					};
				
			//--- little birds	
				if (
					(_obj == LB_1) || 
					(_obj == LB_2)) then 
					{
						_m = [_obj,600,0] execVM "Base\scripts\vehicle.sqf";
					};
				
			//--- huron
				if (_obj == Huron_1) then 
					{
						_m = [_obj,600,0] execVM "Base\scripts\vehicle.sqf";
					};
					
			//--- facs
				if (
						(_obj == MedFac) ||
						(_obj == RepFac)
					)
					then 
					{
							_obj allowDamage false;
					};		
					
				
		//--- CammoNet
			if (
					(_obj == Resp_net)
				) then 
				{
						_obj allowDamage false;
				};
		//--- Gate
				if (_obj == b1) then 
					{
						_obj allowDamage false;
					};
				
		//--- Gate2
				if (_obj == b2) then 
					{
						_obj allowDamage false;
					};			
			
		//--- flags
				if (
						(_obj == flag1) ||
						(_obj == flag2)
					) 
					then 
					{
							_obj setFlagTexture "Base\Images\signs\Falcons.paa";
							_obj allowDamage false;
					};	
				

		//--- Lamps
			if (		
					(_obj == Lamp1) ||
					(_obj == Lamp2) ||
					(_obj == Lamp3) ||
					(_obj == Lamp4) ||
					(_obj == Lamp5) ||
					(_obj == Lamp6) ||
					(_obj == Lamp7) 
				) 
				then 
				{
						_obj allowDamage false;
				};	
}
else
{
		_obj = _this select 0;

		//--- Signs
			if (_obj == Sign_1) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\Falcons.paa"];
				};
				
			if (_obj == Sign_2) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\FalconsNest.paa"];
				};
				
			if (_obj == Sign_3) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\Falcons.paa"];
				};
				
			if ((_obj == Sign_4) || (_obj == Sign_5)) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\CautionHeli.paa"];
				};
				
			if ((_obj == Sign_6) || (_obj == Sign_7)) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\Parking.paa"];
				};
				
		//--- Ammo boxes
			if (_obj == Ammo_1) then 
				{
					_obj allowDamage false;  
				};

		//--- Support signs
			if (_obj == Supportsign_1) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\Support.paa"];
					[[_obj],"fn_VVS_sup",true,true] spawn BIS_fnc_MP;
				};
				
			if (_obj == Supportsign_2) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\Air.paa"];
					[[_obj],"fn_VVS_air",true,true] spawn BIS_fnc_MP;
				};
				
			if (_obj == Supportsign_3) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\Cars.paa"];
					[[_obj],"fn_VVS_car",true,true] spawn BIS_fnc_MP;
				};
				
			if (_obj == Supportsign_4) then 
				{
					_obj allowDamage false;
					_obj setObjectTextureGlobal [0, "Base\Images\signs\Armour.paa"];
					[[_obj],"fn_VVS_tank",true,true] spawn BIS_fnc_MP;
				};

		//--- Vehicles
			
			//--- trucks
				if (
					(_obj == Fuel_Truck_1) || 
					(_obj == Repair_Truck_1) || 
					(_obj == MedicalTruck_1) || 
					(_obj == AmmoTruck_1) ) then 
					{
						_m = [_obj,300,0] execVM "Base\scripts\vehicle.sqf";
					};
				//--- Medical heal action
				if (_obj == MedicalTruck_1) then 
					{
						//[[_obj],"fn_MedicalTruck",true,true] spawn BIS_fnc_MP;
					};
			
			//--- Quads
				if (
					(_obj == quad_1) || 
					(_obj == quad_2) || 
					(_obj == quad_3) || 
					(_obj == quad_4) || 
					(_obj == quad_5) || 
					(_obj == quad_6) || 
					(_obj == quad_7) || 
					(_obj == quad_8) || 
					(_obj == quad_9) || 
					(_obj == quad_10) || 
					(_obj == quad_11) || 
					(_obj == quad_12)) then 
					{
						_m = [_obj,30,1800] execVM "Base\scripts\vehicle.sqf";
					};
					
			//--- hunters
				if (
					(_obj == car_1) || 
					(_obj == car_2) || 
					(_obj == car_3) || 
					(_obj == car_4) || 
					(_obj == car_5) || 
					(_obj == car_6) || 
					(_obj == car_7) || 
					(_obj == car_8)) then 
					{
						//_m = [_obj,300,43200] execVM "Base\scripts\vehicle.sqf";
						_m = [_obj,300,0] execVM "Base\scripts\vehicle.sqf";
					};
				
			//--- little birds	
				if (
					(_obj == LB_1) || 
					(_obj == LB_2)) then 
					{
						_m = [_obj,600,0] execVM "Base\scripts\vehicle.sqf";
					};
				
			//--- huron
				if (_obj == Huron_1) then 
					{
						_m = [_obj,600,0] execVM "Base\scripts\vehicle.sqf";
					};
					
			//--- facs
				if (
						(_obj == MedFac) ||
						(_obj == RepFac)
					)
					then 
					{
							_obj allowDamage false;
					};
};