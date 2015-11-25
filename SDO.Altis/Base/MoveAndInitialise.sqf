if (!(rndBase == StadBase) && !(rndBase == HillBase1) && !(rndBase == CapBase) && !(rndBase == BeachBase) && !(rndBase == RoundBase) && !(rndBase == Hawk_Base) && !(rndBase == SeaSide) && !(rndBase == Penin)) then 
	{
		//--- Move objects
			//--- Base markers and respawn
				"BLUFOR HQ" setMarkerPos (getPos Start_pos_pad);
				"Hospital" setMarkerPos (getPos Med_Fac_Pad);
				"respawn_west" setMarkerPos (getPos Respawn_pos_pad);
				sleep 0.05;
			//--- Faction signs
				"VVS_air" setMarkerPos (getPos VVS_air_1);
				"VVS_Support" setMarkerPos (getPos VVS_Support_1);
				"VVS_car" setMarkerPos (getPos VVS_car_1);
				"VVS_tank" setMarkerPos (getPos VVS_tank_1);
				sleep 0.05;
			//--- stuff
				GateTrigger setPos (getPos GateTrig_pos_pad);
				GateTrigger2 setPos (getPos GateTrig_pos_pad2);
				sleep 0.05;
				MedicalTruck_1 setDir (getDir MedicalTruck_1_Marker);
				MedicalTruck_1 setPos (getPos MedicalTruck_1_Marker);
				sleep 0.05;
				MedFac setDir (getDir Med_Fac_Pad);
				MedFac setPos (getPos Med_Fac_Pad);
				sleep 0.05;
				RepFac setDir (getDir Rep_Fac_Pad);
				RepFac setPos (getPos Rep_Fac_Pad);
				sleep 0.05;
			

				//NurseGladys setPos (getPos Med_Fac_Pad);
				sleep 0.05;
			//--- Ammo boxes
				radiobox setPos (getPos Ammo_2_marker);
				Ammo_1 setPos (getPos Ammo_1_marker);
				sleep 0.05;
		//--- create object inits
			//--- Signs
			
				_bla1 = [Sign_1] execVM "Base\ObjectInits.sqf"; 
				_bla2 = [Sign_2] execVM "Base\ObjectInits.sqf";
				_bla3 = [Sign_3] execVM "Base\ObjectInits.sqf";
				_bla4 = [Sign_4] execVM "Base\ObjectInits.sqf";
				_bla5 = [Sign_5] execVM "Base\ObjectInits.sqf";
				_bla6 = [Sign_6] execVM "Base\ObjectInits.sqf";
				_bla7 = [Sign_7] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _bla7};
			//--- Support signs
				_bla11 = [Supportsign_1] execVM "Base\ObjectInits.sqf"; 
				_bla22 = [Supportsign_2] execVM "Base\ObjectInits.sqf";
				_bla33 = [Supportsign_3] execVM "Base\ObjectInits.sqf";
				_bla44 = [Supportsign_4] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _bla44};
			//--- Ammo boxes
				_blaa = [Ammo_1] execVM "Base\ObjectInits.sqf";
				_blab = [radiobox] execVM "Base\ObjectInits.sqf";
				
				_gate = [b1] execVM "Base\ObjectInits.sqf";
				_gate2 = [b2] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _gate2};
				
		//--- Vehicles
			//--- trucks
				_brumbrum1 = [Fuel_Truck_1] execVM "Base\ObjectInits.sqf";
				_brumbrum2 = [Repair_Truck_1] execVM "Base\ObjectInits.sqf";
				_brumbrum3 = [MedicalTruck_1] execVM "Base\ObjectInits.sqf";
				_brumbrum5 = [AmmoTruck_1] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _brumbrum5};
			//--- quads
				_brumbrum6 = [quad_1] execVM "Base\ObjectInits.sqf";
				_brumbrum7 = [quad_2] execVM "Base\ObjectInits.sqf";
				_brumbrum8 = [quad_3] execVM "Base\ObjectInits.sqf";
				_brumbrum9 = [quad_4] execVM "Base\ObjectInits.sqf";
				_brumbrum10 = [quad_5] execVM "Base\ObjectInits.sqf";
				_brumbrum11 = [quad_6] execVM "Base\ObjectInits.sqf";
				_brumbrum12 = [quad_7] execVM "Base\ObjectInits.sqf";
				_brumbrum13 = [quad_8] execVM "Base\ObjectInits.sqf";
				_brumbrum14 = [quad_9] execVM "Base\ObjectInits.sqf";
				_brumbrum15 = [quad_10] execVM "Base\ObjectInits.sqf";
				_brumbrum16 = [quad_11] execVM "Base\ObjectInits.sqf";
				_brumbrum17 = [quad_12] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _brumbrum17};
			//--- cars
				_brumbrum18 = [car_1] execVM "Base\ObjectInits.sqf";
				_brumbrum19 = [car_2] execVM "Base\ObjectInits.sqf";
				_brumbrum20 = [car_3] execVM "Base\ObjectInits.sqf";
				_brumbrum21 = [car_4] execVM "Base\ObjectInits.sqf";
				_brumbrum22 = [car_5] execVM "Base\ObjectInits.sqf";
				_brumbrum23 = [car_6] execVM "Base\ObjectInits.sqf";
				_brumbrum24 = [car_7] execVM "Base\ObjectInits.sqf";
				_brumbrum25 = [car_8] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _brumbrum25};
			//--- little birds
				_brumbrum26 = [LB_1] execVM "Base\ObjectInits.sqf";
				_brumbrum27 = [LB_2] execVM "Base\ObjectInits.sqf";
			//--- huron
				_brumbrum28 = [Huron_1] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _brumbrum28};
		//--- cammo nets
				_net = [Resp_net] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _net};
		//--- Flags
				_flag =[flag1] execVM "Base\ObjectInits.sqf";
				_flag2 =[flag2] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _flag2};
		//--- Facs
				_fac =[MedFac] execVM "Base\ObjectInits.sqf";
				_fac2 =[RepFac] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _fac2};

		//--- Lamps
				_light1 =[Lamp1] execVM "Base\ObjectInits.sqf";
				_light2 =[Lamp2] execVM "Base\ObjectInits.sqf";
				_light3 =[Lamp3] execVM "Base\ObjectInits.sqf";
				_light4 =[Lamp4] execVM "Base\ObjectInits.sqf";
				_light5 =[Lamp5] execVM "Base\ObjectInits.sqf";
				_light6 =[Lamp6] execVM "Base\ObjectInits.sqf";
				_light7 =[Lamp7] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _light7};
	} 
	else
	{
			//--- Move objects for stadbase type
			//--- Base markers and respawn
				"BLUFOR HQ" setMarkerPos (getPos Start_pos_pad);
				"Hospital" setMarkerPos (getPos Med_Fac_Pad);
				"respawn_west" setMarkerPos (getPos Respawn_pos_pad);
				sleep 0.05;
			//--- Faction signs
				"VVS_air" setMarkerPos (getPos VVS_air_1);
				"VVS_Support" setMarkerPos (getPos VVS_Support_1);
				"VVS_car" setMarkerPos (getPos VVS_car_1);
				"VVS_tank" setMarkerPos (getPos VVS_tank_1);
				sleep 0.05;

			//--- stuff
				//NurseGladys setPos (getPos Med_Fac_Pad);
				sleep 0.05;
				
				MedicalTruck_1 setDir (getDir MedicalTruck_1_Marker);
				MedicalTruck_1 setPos (getPos MedicalTruck_1_Marker);
				sleep 0.05;
				MedFac setDir (getDir Med_Fac_Pad);
				MedFac setPos (getPos Med_Fac_Pad);
				sleep 0.05;
				RepFac setDir (getDir Rep_Fac_Pad);
				RepFac setPos (getPos Rep_Fac_Pad);
				sleep 0.05;
			//--- Ammo boxes
				radiobox setPos (getPos Ammo_2_marker);
				Ammo_1 setPos (getPos Ammo_1_marker);
				sleep 0.05;
		//--- create object inits
			//--- Signs
			
				_bla1 = [Sign_1] execVM "Base\ObjectInits.sqf"; 
				_bla2 = [Sign_2] execVM "Base\ObjectInits.sqf";
				_bla3 = [Sign_3] execVM "Base\ObjectInits.sqf";
				
				_bla4 = [Sign_4] execVM "Base\ObjectInits.sqf";
				_bla5 = [Sign_5] execVM "Base\ObjectInits.sqf";

				_bla6 = [Sign_6] execVM "Base\ObjectInits.sqf";
				_bla7 = [Sign_7] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _bla7};
			//--- Support signs
				_bla11 = [Supportsign_1] execVM "Base\ObjectInits.sqf"; 
				_bla22 = [Supportsign_2] execVM "Base\ObjectInits.sqf";
				_bla33 = [Supportsign_3] execVM "Base\ObjectInits.sqf";
				_bla44 = [Supportsign_4] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _bla44};
			//--- Ammo boxes
				_blaa = [Ammo_1] execVM "Base\ObjectInits.sqf";
				_blab = [radiobox] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _blab};

				
		//--- Vehicles
			//--- trucks
				_brumbrum1 = [Fuel_Truck_1] execVM "Base\ObjectInits.sqf";
				_brumbrum2 = [Repair_Truck_1] execVM "Base\ObjectInits.sqf";
				_brumbrum3 = [MedicalTruck_1] execVM "Base\ObjectInits.sqf";
				_brumbrum5 = [AmmoTruck_1] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _brumbrum5};
			//--- quads
				_brumbrum6 = [quad_1] execVM "Base\ObjectInits.sqf";
				_brumbrum7 = [quad_2] execVM "Base\ObjectInits.sqf";
				_brumbrum8 = [quad_3] execVM "Base\ObjectInits.sqf";
				_brumbrum9 = [quad_4] execVM "Base\ObjectInits.sqf";
				_brumbrum10 = [quad_5] execVM "Base\ObjectInits.sqf";
				_brumbrum11 = [quad_6] execVM "Base\ObjectInits.sqf";
				_brumbrum12 = [quad_7] execVM "Base\ObjectInits.sqf";
				_brumbrum13 = [quad_8] execVM "Base\ObjectInits.sqf";
				_brumbrum14 = [quad_9] execVM "Base\ObjectInits.sqf";
				_brumbrum15 = [quad_10] execVM "Base\ObjectInits.sqf";
				_brumbrum16 = [quad_11] execVM "Base\ObjectInits.sqf";
				_brumbrum17 = [quad_12] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _brumbrum17};
			//--- cars
				_brumbrum18 = [car_1] execVM "Base\ObjectInits.sqf";
				_brumbrum19 = [car_2] execVM "Base\ObjectInits.sqf";
				_brumbrum20 = [car_3] execVM "Base\ObjectInits.sqf";
				_brumbrum21 = [car_4] execVM "Base\ObjectInits.sqf";
				_brumbrum22 = [car_5] execVM "Base\ObjectInits.sqf";
				_brumbrum23 = [car_6] execVM "Base\ObjectInits.sqf";
				_brumbrum24 = [car_7] execVM "Base\ObjectInits.sqf";
				_brumbrum25 = [car_8] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _brumbrum25};
			//--- little birds
				_brumbrum26 = [LB_1] execVM "Base\ObjectInits.sqf";
				_brumbrum27 = [LB_2] execVM "Base\ObjectInits.sqf";
			//--- huron
				_brumbrum28 = [Huron_1] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _brumbrum28};
		//--- Facs
				_fac =[MedFac] execVM "Base\ObjectInits.sqf";
				_fac2 =[RepFac] execVM "Base\ObjectInits.sqf";
				waitUntil {scriptDone _fac2};

	};
				waitUntil {serverTime > 10};
				NurseGladys setPos  (getPos MedFac);

	MovedAndInitialised = true; 
	PublicVariable "MovedAndInitialised";