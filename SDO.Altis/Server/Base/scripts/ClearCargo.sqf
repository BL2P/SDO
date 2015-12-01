if(isNull _this) exitWith {};
if (alive _this) then 
{

	if ((typeOf _this == "B_Truck_01_Repair_F") || (typeOf _this == "B_Slingload_01_Repair_F")) then 
	{
		[_this, 13, "ACE_Wheel", true] call ace_repair_fnc_addSpareParts;
		[_this, 3, "ACE_Track", true] call ace_repair_fnc_addSpareParts;
	};

		if ((_this  == Ammo_cont) || (_this  == Ammo_cont_1)) then 
			{
				//--- Everything else
				clearBackpackCargoGlobal _this;
				clearMagazineCargoGlobal _this;
				clearWeaponCargoGlobal _this;
				clearItemCargoGlobal _this;
			if(alive _this) then {
			_Ammo = [_this] execVM "Server\Base\Scripts\Containers_Arsenal.sqf";
			};

	};
	
		//--- Containers
		if ((_this  == Med_cont) || (_this  == Med_cont_1)) then 
			{
				while {alive _this} do
					{	
						clearMagazineCargoGlobal _this;
						clearItemCargoGlobal _this;
							//--- Ace Items
							_AceMedical =
							[
								"ACE_fieldDressing",
								"ACE_elasticBandage",
								"ACE_quikclot",
								"ACE_packingBandage",
								"ACE_personalAidKit",
								"ACE_surgicalKit",
								"ACE_tourniquet",
								"ACE_plasmaIV_500",
								"ACE_plasmaIV_250",
								"ACE_plasmaIV",
								"ACE_salineIV_500",
								"ACE_salineIV_250",
								"ACE_salineIV",
								"ACE_epinephrine",
								"ACE_morphine"
							];			
								{
									_this addItemCargoGlobal [_x,40];
								} foreach _AceMedical;		
					
						sleep 1800;
					};
			};		
	
	
	//--- Ammo Truck
	if (typeOf _this == "B_Truck_01_ammo_F") then 
	{
			//--- Everything else
			clearBackpackCargoGlobal _this;
			clearMagazineCargoGlobal _this;
			clearWeaponCargoGlobal _this;
			clearItemCargoGlobal _this;
			if(alive _this) then {
			_Ammo = [_this] execVM "Server\Base\Scripts\AmmoTruck_Arsenal.sqf";
			};

	};
	
	//--- Medical truck
	if (typeOf _this == "B_Truck_01_medical_F") then 
	{
		while {alive _this} do
		{	
			clearMagazineCargoGlobal _this;
			clearItemCargoGlobal _this;
				//--- Ace Items
				_AceMedical =
				[
					"ACE_fieldDressing",
					"ACE_elasticBandage",
					"ACE_quikclot",
					"ACE_packingBandage",
					"ACE_personalAidKit",
					"ACE_surgicalKit",
					"ACE_tourniquet",
					"ACE_plasmaIV_500",
					"ACE_plasmaIV_250",
					"ACE_plasmaIV",
					"ACE_salineIV_500",
					"ACE_salineIV_250",
					"ACE_salineIV",
					"ACE_epinephrine",
					"ACE_morphine"
					//"ACE_atropine"
				];			
					{
						_this addItemCargoGlobal [_x,40];
					} foreach _AceMedical;		
		
			sleep 1800;
		};
	};

	
    //--- 3CB cars
	if (
			(typeOf _this == "UK3CB_BAF_Coyote_Logistics_L111A1_W") || 
			(typeOf _this == "UK3CB_BAF_Coyote_Logistics_L111A1_D") || 
			(typeOf _this == "UK3CB_BAF_Coyote_Passenger_L111A1_W") || 
			(typeOf _this == "UK3CB_BAF_Coyote_Passenger_L111A1_D")
		) then
		{
							clearBackpackCargoGlobal _this;
							clearMagazineCargoGlobal _this;
							clearWeaponCargoGlobal _this;
							clearItemCargoGlobal _this;
					_Mini_3cbAmmo = 
						[
							"UK3CB_BAF_150Rnd_762x51_Box",
							"UK3CB_BAF_100Rnd_127x99_Box"
						];	
					{
						_this addMagazineCargoGlobal [_x,5];
					} foreach _Mini_3cbAmmo;
				

			
		}
		//--- Everything else
		else
		{
			clearBackpackCargoGlobal _this;
			clearMagazineCargoGlobal _this;
			clearWeaponCargoGlobal _this;
			clearItemCargoGlobal _this;
		};
	
	[_this, 3, "ACE_Wheel", true] call ace_repair_fnc_addSpareParts;
};