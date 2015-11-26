if(isNull _this) exitWith {};
if (alive _this) then 
{

	if ((typeOf _this == "B_Truck_01_Repair_F") || (typeOf _this == "B_Slingload_01_Repair_F")) then 
	{
		[_this, 13, "ACE_Wheel", true] call ace_repair_fnc_addSpareParts;
		[_this, 3, "ACE_Track", true] call ace_repair_fnc_addSpareParts;
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
			_Ammo = [_this] execVM "Base\Scripts\AmmoTruck_Arsenal.sqf";
			};

	};
	
	//--- Medical truck
	if (typeOf _this == "B_Truck_01_medical_F") then 
	{
		//diag_log "I AM A Medtruck";
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
						_this addItemCargoGlobal [_x,50];
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
			/*
			clearItemCargoGlobal _this;
				_this addweaponcargoglobal ["UK3CB_BAF_AT4_AP_Launcher",2];	
				_Mini_AceMedical =
						[
							"ACE_fieldDressing",
							"ACE_tourniquet",
							"ACE_morphine"
						];			
					{
						_this addItemCargoGlobal [_x,10];
					} foreach _Mini_AceMedical;		
				_Mini_3cbAmmo = 
						[
							"UK3CB_BAF_30Rnd_T",
							"UK3CB_BAF_100Rnd_T",
							"UK3CB_BAF_200Rnd_T",
							"UK3CB_BAF_1Rnd_HEDP_Grenade_shell"
						];	
					{
						_this addMagazineCargoGlobal [_x,10];
					} foreach _Mini_3cbAmmo;	
					*/	
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