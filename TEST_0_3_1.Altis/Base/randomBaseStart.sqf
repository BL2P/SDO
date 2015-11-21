if !(isServer) exitwith {diag_log "Get the fuck out of RandomBaseStart";};
if (isNil "PARAMS_ALLOW_3CB")  then  { waitUntil{!isNil "PARAMS_ALLOW_3CB"};};
if (isNil "PARAMS_BaseSelector") then {waitUntil {!isNil "PARAMS_BaseSelector"};};

bases = synchronizedObjects _this; 
if (DEBUG) then {diag_log format["bases = %1",bases];};

if (PARAMS_BaseSelector < 0 ) then 
			{
				rndBase = bases select (floor (random (count bases))); 
			};
if (PARAMS_BaseSelector == 1) then 
			{
					rndBase = One; 
			};
if (PARAMS_BaseSelector == 2) then 
			{
					rndBase = Two;
			};
if (PARAMS_BaseSelector == 3) then 
			{
					rndBase = Three; 
			};
if (PARAMS_BaseSelector == 4) then 
			{
					rndBase = Four; 
			};
if (PARAMS_BaseSelector == 5) then 
			{
					rndBase = Five; 
			};
if (PARAMS_BaseSelector == 6) then 
			{
					rndBase = Six; 
			};
if (PARAMS_BaseSelector == 7) then 
			{
					rndBase = Seven; 
			};
if (PARAMS_BaseSelector == 8) then 
			{
					rndBase = StadBase; 
			};
if (PARAMS_BaseSelector == 9) then 
			{
					rndBase = HillBase1; 
			};
if (PARAMS_BaseSelector == 10) then 
			{
					rndBase = CapBase; 
			};
if (PARAMS_BaseSelector == 11) then 
			{
					rndBase = BeachBase; 
			};
if (PARAMS_BaseSelector == 12) then 
			{
					rndBase = RoundBase; 
			};
if (PARAMS_BaseSelector == 13) then 
			{
					rndBase = Hawk_Base; 
			};
if (PARAMS_BaseSelector == 14) then 
			{
					rndBase = SeaSide; 
			};
if (PARAMS_BaseSelector == 15) then 
			{
					rndBase = Penin; 
			};
			
if (DEBUG) then {diag_log format["The Base = %1",rndBase];};


BASETYPE = [];


//--- Vehicles types for Base layouts
BHeliLB = "B_Heli_Light_01_F";
BHeliT = "B_Heli_Transport_03_F";

BTruckF = "B_Truck_01_fuel_F";
BTruckR = "B_Truck_01_Repair_F";
BTruckA = "B_Truck_01_ammo_F";

Bquad = "B_Quadbike_01_F";

BCar1 = "B_MRAP_01_F";
BCar2 = "UK3CB_BAF_Coyote_Passenger_L111A1_D";
BCar3 = "UK3CB_BAF_Coyote_Passenger_L111A1_W";
BCar4 = "rhsusf_m1025_d_s_m2";
BCar5 = "rhsusf_m1025_w_s_m2";

BBoat1 = "B_Boat_Armed_01_minigun_F";
BBoat2 = "B_Boat_Transport_01_F";


	//--- VEHICLES
	
			if (PARAMS_ALLOW_3CB == 1 && PARAMS_ALLOW_RHS == 1 ) then
				{
					diag_log "=========PARAMS_ALLOW_3CB == 1 && PARAMS_ALLOW_RHS == 1 ========";
					Base2 = 
						[
						//--- choppers
							[BHeliLB,[12.668,-8.87573,0],0,1,0,[0,0],"LB_1","",true,false], 
							[BHeliLB,[36.625,-8.77856,0],0,1,0,[0,0],"LB_2","",true,false], 
							[BHeliT,[18.9497,-29.2939,0],89.4967,1,0,[0,0],"Huron_1","",true,false], 
							//--- trucks
							[BTruckF,[23.2246,9.67969,0.114967],359.569,1,0,[0,-0],"Fuel_Truck_1","",true,false], 
							[BTruckR,[18.0898,9.771,0.114967],359.569,1,0,[0,-0],"Repair_Truck_1","",true,false], 
							[BTruckA,[33.4414,9.5481,0.114967],359.569,1,0,[0,-0],"AmmoTruck_1","",true,false], 
							["Land_HelipadEmpty_F",[28.2305,10.062,0],0,1,0,[0,0],"MedicalTruck_1_Marker","",true,false], 
							//--- Quads
							[Bquad,[-11.2617,9.7085,0.200709],270.184,1,0,[0,0],"quad_1","",true,false], 
							[Bquad,[-11.3872,17.9536,0.200709],270.184,1,0,[0,0],"quad_6","",true,false], 
							[Bquad,[-15.6763,15.3452,0.200709],270.184,1,0,[0,0],"quad_7","",true,false], 
							[Bquad,[-11.2617,20.3091,0.200709],270.184,1,0,[0,-0],"quad_8","",true,false], 
							[Bquad,[-15.6758,18.0376,0.200709],270.184,1,0,[0,0],"quad_9","",true,false], 
							[Bquad,[-11.2612,23.0015,0.200709],270.184,1,0,[0,0],"quad_10","",true,false], 
							[Bquad,[-15.5503,20.3931,0.200709],270.184,1,0,[0,-0],"quad_11","",true,false], 
							[Bquad,[-15.5503,9.79248,0.200709],270.184,1,0,[0,0],"quad_3","",true,false], 
							[Bquad,[-11.3877,15.2612,0.200709],270.184,1,0,[0,0],"quad_4","",true,false], 
							[Bquad,[-15.5498,12.4849,0.200709],270.184,1,0,[0,-0],"quad_5","",true,false], 
							[Bquad,[-15.5498,23.0854,0.200709],270.184,1,0,[0,0],"quad_12","",true,false], 
							[Bquad,[-11.2612,12.4009,0.200709],270.184,1,0,[0,-0],"quad_2","",true,false], 
							//--- cars
							[Bcar2,[-44.5586,47.145,0.149014],88.3714,1,0,[0,0],"car_1","",true,false], 
							[Bcar2,[-44.3555,40.8918,0.149014],88.3714,1,0,[0,0],"car_2","",true,false], 
							[Bcar3,[-44.6768,36.0881,0.149014],88.7923,1,0,[0,0],"car_3","",true,false], 
							[Bcar3,[-44.5181,29.8384,0.149014],88.7923,1,0,[0,0],"car_4","",true,false], 
							[Bcar4,[-13.5483,47.2034,0.149014],269.439,1,0,[0,0],"car_5","",true,false], 
							[Bcar4,[-13.4678,40.9617,0.149014],269.439,1,0,[0,0],"car_6","",true,false], 
							[Bcar5,[-13.3174,35.7617,0.149014],270.184,1,0,[0,0],"car_7","",true,false], 
							[Bcar5,[-13.3169,29.5083,0.149014],270.184,1,0,[0,-0],"car_8","",true,false]
						];
				};
			if (PARAMS_ALLOW_3CB != 1 && PARAMS_ALLOW_RHS != 1 ) then
				{
					diag_log "========PARAMS_ALLOW_3CB != 1 && PARAMS_ALLOW_RHS != 1=========";
					Base2 = 
						[
						//--- choppers
							[BHeliLB,[12.668,-8.87573,0],0,1,0,[0,0],"LB_1","",true,false], 
							[BHeliLB,[36.625,-8.77856,0],0,1,0,[0,0],"LB_2","",true,false], 
							[BHeliT,[18.9497,-29.2939,0],89.4967,1,0,[0,0],"Huron_1","",true,false], 
							//--- trucks
							[BTruckF,[23.2246,9.67969,0.114967],359.569,1,0,[0,-0],"Fuel_Truck_1","",true,false], 
							[BTruckR,[18.0898,9.771,0.114967],359.569,1,0,[0,-0],"Repair_Truck_1","",true,false], 
							[BTruckA,[33.4414,9.5481,0.114967],359.569,1,0,[0,-0],"AmmoTruck_1","",true,false], 
							["Land_HelipadEmpty_F",[28.2305,10.062,0],0,1,0,[0,0],"MedicalTruck_1_Marker","",true,false], 
							//--- Quads
							[Bquad,[-11.2617,9.7085,0.200709],270.184,1,0,[0,0],"quad_1","",true,false], 
							[Bquad,[-11.3872,17.9536,0.200709],270.184,1,0,[0,0],"quad_6","",true,false], 
							[Bquad,[-15.6763,15.3452,0.200709],270.184,1,0,[0,0],"quad_7","",true,false], 
							[Bquad,[-11.2617,20.3091,0.200709],270.184,1,0,[0,-0],"quad_8","",true,false], 
							[Bquad,[-15.6758,18.0376,0.200709],270.184,1,0,[0,0],"quad_9","",true,false], 
							[Bquad,[-11.2612,23.0015,0.200709],270.184,1,0,[0,0],"quad_10","",true,false], 
							[Bquad,[-15.5503,20.3931,0.200709],270.184,1,0,[0,-0],"quad_11","",true,false], 
							[Bquad,[-15.5503,9.79248,0.200709],270.184,1,0,[0,0],"quad_3","",true,false], 
							[Bquad,[-11.3877,15.2612,0.200709],270.184,1,0,[0,0],"quad_4","",true,false], 
							[Bquad,[-15.5498,12.4849,0.200709],270.184,1,0,[0,-0],"quad_5","",true,false], 
							[Bquad,[-15.5498,23.0854,0.200709],270.184,1,0,[0,0],"quad_12","",true,false], 
							[Bquad,[-11.2612,12.4009,0.200709],270.184,1,0,[0,-0],"quad_2","",true,false], 
							//--- cars
							[Bcar1,[-44.5586,47.145,0.149014],88.3714,1,0,[0,0],"car_1","",true,false], 
							[Bcar1,[-44.3555,40.8918,0.149014],88.3714,1,0,[0,0],"car_2","",true,false], 
							[Bcar1,[-44.6768,36.0881,0.149014],88.7923,1,0,[0,0],"car_3","",true,false], 
							[Bcar1,[-44.5181,29.8384,0.149014],88.7923,1,0,[0,0],"car_4","",true,false], 
							[Bcar1,[-13.5483,47.2034,0.149014],269.439,1,0,[0,0],"car_5","",true,false], 
							[Bcar1,[-13.4678,40.9617,0.149014],269.439,1,0,[0,0],"car_6","",true,false], 
							[Bcar1,[-13.3174,35.7617,0.149014],270.184,1,0,[0,0],"car_7","",true,false], 
							[Bcar1,[-13.3169,29.5083,0.149014],270.184,1,0,[0,-0],"car_8","",true,false]
						];
				};
			if (PARAMS_ALLOW_3CB == 1 && PARAMS_ALLOW_RHS != 1 ) then
				{
					diag_log "=========PARAMS_ALLOW_3CB == 1 && PARAMS_ALLOW_RHS != 1 ========";
					Base2 = 
						[
							[BHeliLB,[12.668,-8.87573,0],0,1,0,[0,0],"LB_1","",true,false], 
							[BHeliLB,[36.625,-8.77856,0],0,1,0,[0,0],"LB_2","",true,false], 
							[BHeliT,[18.9497,-29.2939,0],89.4967,1,0,[0,0],"Huron_1","",true,false], 
							//--- trucks
							[BTruckF,[23.2246,9.67969,0.114967],359.569,1,0,[0,-0],"Fuel_Truck_1","",true,false], 
							[BTruckR,[18.0898,9.771,0.114967],359.569,1,0,[0,-0],"Repair_Truck_1","",true,false], 
							[BTruckA,[33.4414,9.5481,0.114967],359.569,1,0,[0,-0],"AmmoTruck_1","",true,false], 
							["Land_HelipadEmpty_F",[28.2305,10.062,0],0,1,0,[0,0],"MedicalTruck_1_Marker","",true,false], 
							//--- Quads
							[Bquad,[-11.2617,9.7085,0.200709],270.184,1,0,[0,0],"quad_1","",true,false], 
							[Bquad,[-11.3872,17.9536,0.200709],270.184,1,0,[0,0],"quad_6","",true,false], 
							[Bquad,[-15.6763,15.3452,0.200709],270.184,1,0,[0,0],"quad_7","",true,false], 
							[Bquad,[-11.2617,20.3091,0.200709],270.184,1,0,[0,-0],"quad_8","",true,false], 
							[Bquad,[-15.6758,18.0376,0.200709],270.184,1,0,[0,0],"quad_9","",true,false], 
							[Bquad,[-11.2612,23.0015,0.200709],270.184,1,0,[0,0],"quad_10","",true,false], 
							[Bquad,[-15.5503,20.3931,0.200709],270.184,1,0,[0,-0],"quad_11","",true,false], 
							[Bquad,[-15.5503,9.79248,0.200709],270.184,1,0,[0,0],"quad_3","",true,false], 
							[Bquad,[-11.3877,15.2612,0.200709],270.184,1,0,[0,0],"quad_4","",true,false], 
							[Bquad,[-15.5498,12.4849,0.200709],270.184,1,0,[0,-0],"quad_5","",true,false], 
							[Bquad,[-15.5498,23.0854,0.200709],270.184,1,0,[0,0],"quad_12","",true,false], 
							[Bquad,[-11.2612,12.4009,0.200709],270.184,1,0,[0,-0],"quad_2","",true,false], 
							//--- cars
							[Bcar2,[-44.5586,47.145,0.149014],88.3714,1,0,[0,0],"car_1","",true,false], 
							[Bcar2,[-44.3555,40.8918,0.149014],88.3714,1,0,[0,0],"car_2","",true,false], 
							[Bcar2,[-44.6768,36.0881,0.149014],88.7923,1,0,[0,0],"car_3","",true,false], 
							[Bcar2,[-44.5181,29.8384,0.149014],88.7923,1,0,[0,0],"car_4","",true,false], 
							[Bcar3,[-13.5483,47.2034,0.149014],269.439,1,0,[0,0],"car_5","",true,false], 
							[Bcar3,[-13.4678,40.9617,0.149014],269.439,1,0,[0,0],"car_6","",true,false], 
							[Bcar3,[-13.3174,35.7617,0.149014],270.184,1,0,[0,0],"car_7","",true,false], 
							[Bcar3,[-13.3169,29.5083,0.149014],270.184,1,0,[0,-0],"car_8","",true,false]
						];
				};
			if (PARAMS_ALLOW_3CB != 1 && PARAMS_ALLOW_RHS == 1 ) then
				{
					diag_log "=========PARAMS_ALLOW_3CB != 1 && PARAMS_ALLOW_RHS == 1 ========";
					Base2 = 
						[
						//--- choppers
							[BHeliLB,[12.668,-8.87573,0],0,1,0,[0,0],"LB_1","",true,false], 
							[BHeliLB,[36.625,-8.77856,0],0,1,0,[0,0],"LB_2","",true,false], 
							[BHeliT,[18.9497,-29.2939,0],89.4967,1,0,[0,0],"Huron_1","",true,false], 
							//--- trucks
							[BTruckF,[23.2246,9.67969,0.114967],359.569,1,0,[0,-0],"Fuel_Truck_1","",true,false], 
							[BTruckR,[18.0898,9.771,0.114967],359.569,1,0,[0,-0],"Repair_Truck_1","",true,false], 
							[BTruckA,[33.4414,9.5481,0.114967],359.569,1,0,[0,-0],"AmmoTruck_1","",true,false], 
							["Land_HelipadEmpty_F",[28.2305,10.062,0],0,1,0,[0,0],"MedicalTruck_1_Marker","",true,false], 
							//--- Quads
							[Bquad,[-11.2617,9.7085,0.200709],270.184,1,0,[0,0],"quad_1","",true,false], 
							[Bquad,[-11.3872,17.9536,0.200709],270.184,1,0,[0,0],"quad_6","",true,false], 
							[Bquad,[-15.6763,15.3452,0.200709],270.184,1,0,[0,0],"quad_7","",true,false], 
							[Bquad,[-11.2617,20.3091,0.200709],270.184,1,0,[0,-0],"quad_8","",true,false], 
							[Bquad,[-15.6758,18.0376,0.200709],270.184,1,0,[0,0],"quad_9","",true,false], 
							[Bquad,[-11.2612,23.0015,0.200709],270.184,1,0,[0,0],"quad_10","",true,false], 
							[Bquad,[-15.5503,20.3931,0.200709],270.184,1,0,[0,-0],"quad_11","",true,false], 
							[Bquad,[-15.5503,9.79248,0.200709],270.184,1,0,[0,0],"quad_3","",true,false], 
							[Bquad,[-11.3877,15.2612,0.200709],270.184,1,0,[0,0],"quad_4","",true,false], 
							[Bquad,[-15.5498,12.4849,0.200709],270.184,1,0,[0,-0],"quad_5","",true,false], 
							[Bquad,[-15.5498,23.0854,0.200709],270.184,1,0,[0,0],"quad_12","",true,false], 
							[Bquad,[-11.2612,12.4009,0.200709],270.184,1,0,[0,-0],"quad_2","",true,false], 
							//--- cars
							[Bcar5,[-44.5586,47.145,0.149014],88.3714,1,0,[0,0],"car_1","",true,false], 
							[Bcar5,[-44.3555,40.8918,0.149014],88.3714,1,0,[0,0],"car_2","",true,false], 
							[Bcar5,[-44.6768,36.0881,0.149014],88.7923,1,0,[0,0],"car_3","",true,false], 
							[Bcar5,[-44.5181,29.8384,0.149014],88.7923,1,0,[0,0],"car_4","",true,false], 
							[Bcar4,[-13.5483,47.2034,0.149014],269.439,1,0,[0,0],"car_5","",true,false], 
							[Bcar4,[-13.4678,40.9617,0.149014],269.439,1,0,[0,0],"car_6","",true,false], 
							[Bcar4,[-13.3174,35.7617,0.149014],270.184,1,0,[0,0],"car_7","",true,false], 
							[Bcar4,[-13.3169,29.5083,0.149014],270.184,1,0,[0,-0],"car_8","",true,false]
						];
				};

//--- Used for testing in editor
/*
Base2 = 
						[
							//--- choppers
							[BHeliLB,[12.668,-8.87573,0],0,1,0,[0,0],"LB_1","",true,false], 
							[BHeliLB,[36.625,-8.77856,0],0,1,0,[0,0],"LB_2","",true,false], 
							[BHeliT,[18.9497,-29.2939,0],89.4967,1,0,[0,0],"Huron_1","",true,false], 
							//--- trucks
							[BTruckF,[23.2246,9.67969,0.114967],359.569,1,0,[0,-0],"Fuel_Truck_1","",true,false], 
							[BTruckR,[18.0898,9.771,0.114967],359.569,1,0,[0,-0],"Repair_Truck_1","",true,false], 
							[BTruckA,[33.4414,9.5481,0.114967],359.569,1,0,[0,-0],"AmmoTruck_1","",true,false], 
							["Land_HelipadEmpty_F",[28.2305,10.062,0],0,1,0,[0,0],"MedicalTruck_1_Marker","",true,false], 
							//--- Quads
							[Bquad,[-11.2617,9.7085,0.200709],270.184,1,0,[0,0],"quad_1","",true,false], 
							[Bquad,[-11.3872,17.9536,0.200709],270.184,1,0,[0,0],"quad_6","",true,false], 
							[Bquad,[-15.6763,15.3452,0.200709],270.184,1,0,[0,0],"quad_7","",true,false], 
							[Bquad,[-11.2617,20.3091,0.200709],270.184,1,0,[0,-0],"quad_8","",true,false], 
							[Bquad,[-15.6758,18.0376,0.200709],270.184,1,0,[0,0],"quad_9","",true,false], 
							[Bquad,[-11.2612,23.0015,0.200709],270.184,1,0,[0,0],"quad_10","",true,false], 
							[Bquad,[-15.5503,20.3931,0.200709],270.184,1,0,[0,-0],"quad_11","",true,false], 
							[Bquad,[-15.5503,9.79248,0.200709],270.184,1,0,[0,0],"quad_3","",true,false], 
							[Bquad,[-11.3877,15.2612,0.200709],270.184,1,0,[0,0],"quad_4","",true,false], 
							[Bquad,[-15.5498,12.4849,0.200709],270.184,1,0,[0,-0],"quad_5","",true,false], 
							[Bquad,[-15.5498,23.0854,0.200709],270.184,1,0,[0,0],"quad_12","",true,false], 
							[Bquad,[-11.2612,12.4009,0.200709],270.184,1,0,[0,-0],"quad_2","",true,false], 
							//--- cars
							[BCar1,[-44.5586,47.145,0.149014],88.3714,1,0,[0,0],"car_1","",true,false], 
							[BCar1,[-44.3555,40.8918,0.149014],88.3714,1,0,[0,0],"car_2","",true,false], 
							[BCar1,[-44.6768,36.0881,0.149014],88.7923,1,0,[0,0],"car_3","",true,false], 
							[BCar1,[-44.5181,29.8384,0.149014],88.7923,1,0,[0,0],"car_4","",true,false], 
							[BCar1,[-13.5483,47.2034,0.149014],269.439,1,0,[0,0],"car_5","",true,false], 
							[BCar1,[-13.4678,40.9617,0.149014],269.439,1,0,[0,0],"car_6","",true,false], 
							[BCar1,[-13.3174,35.7617,0.149014],270.184,1,0,[0,0],"car_7","",true,false], 
							[BCar1,[-13.3169,29.5083,0.149014],270.184,1,0,[0,-0],"car_8","",true,false]
						];
						
*/

Base1 =
[
	//--- heli pads
	["Land_HelipadCircle_F",[12.5298,-7.74268,0],89.8326,1,0,[0,0],"","",true,false], 
	["Land_HelipadCircle_F",[36.4565,-8.08838,0],89.8326,1,0,[0,0],"","",true,false], 
	["Land_HelipadRescue_F",[21.2769,27.6978,0],89.8326,1,0,[0,0],"","",true,false], 
	["Land_HelipadCircle_F",[20.6499,-29.2598,0],89.8326,1,0,[0,0],"","",true,false], 
	//--- placement pads
	["Land_HelipadEmpty_F",[-17.9976,-10.3735,0],269.723,1,0,[0,0],"Start_pos_pad","",true,false], 
	["Land_HelipadEmpty_F",[3.78662,14.4453,0],269.723,1,0,[0,0],"Med_Fac_Pad","",true,false],
	["Land_HelipadEmpty_F",[-16.9673,-33.5522,0],269.723,1,0,[0,0],"Respawn_pos_pad","",true,false], 
	["Land_HelipadEmpty_F",[-39.2305,-8.24219,0],269.723,1,0,[0,0],"Ammo_1_marker","",true,false], 
	["Land_HelipadEmpty_F",[-39.3794,-13.1968,0],269.723,1,0,[0,0],"Ammo_2_marker","",true,false], 
	["Land_HelipadEmpty_F",[4.18945,46.7114,0],269.723,1,0,[0,0],"Rep_Fac_Pad","",true,false], 
	//--- nets
	["CamoNet_BLUFOR_open_F",[-17.5889,-32.4663,0],0,1,0,[0,0],"Resp_net","",true,false], 
	["CamoNet_BLUFOR_big_F",[-39.9082,-10.7666,0],280,1,0,[0,0],"Ammo_net","",true,false], 
	//--- cones
	["RoadCone_L_F",[5.00098,-0.60083,0.00211954],0.456513,1,0,[0,0],"","",true,false], 
	["RoadCone_L_F",[9.82373,-0.622559,0.00211954],0.485527,1,0,[0,0],"","",true,false], 
	["RoadCone_L_F",[0.324707,-15.855,0.00211954],269.546,1,0,[0,0],"","",true,false], 
	["RoadCone_L_F",[-19.8257,3.74683,0.00211954],359.971,1,0,[0,0],"","",true,false], 
	["RoadCone_L_F",[0.378906,-20.6794,0.00211954],269.517,1,0,[0,0],"","",true,false], 
	["RoadCone_L_F",[-27.6221,3.62891,0.00211954],359.942,1,0,[0,0],"","",true,false], 
	["RoadCone_L_F",[-26.959,53.313,0.0197811],3.09964,1,0,[0,0],"","",true,false], 
	["RoadCone_L_F",[27.6006,54.8601,0.00211954],359.971,1,0,[0,0],"","",true,false], 
	["RoadCone_L_F",[-29.3188,55.303,0.00211954],359.971,1,0,[0,0],"","",true,false], 
	["RoadCone_L_F",[42.4146,52.7607,0.0197811],3.09964,1,0,[0,0],"","",true,false], 
	["RoadCone_L_F",[40.0547,54.7507,0.00211954],359.971,1,0,[0,0],"","",true,false], 
	["RoadCone_L_F",[-41.7729,55.4124,0.00211954],359.971,1,0,[0,0],"","",true,false], 
	["RoadCone_L_F",[26.9165,65.5537,0.00211954],359.971,1,0,[0,0],"","",true,false], 
	["RoadCone_L_F",[-28.7998,66.6174,0.00211954],359.978,1,0,[0,0],"","",true,false], 
	["RoadCone_L_F",[39.8545,65.6487,0.00211954],359.978,1,0,[0,0],"","",true,false], 
	["RoadCone_L_F",[-41.5918,66.333,0.00211954],359.971,1,0,[0,0],"","",true,false],
	//--- lights big
	["Land_LampHalogen_F",[-2.47168,-5.97681,0],175.33,1,0,[0,-0],"Lamp1","",true,false], 
	["Land_LampHalogen_F",[-0.80835,25.1719,0],176.619,1,0,[0,-0],"Lamp2","",true,false], 
	["Land_LampHalogen_F",[-30.2031,1.12939,0],264.44,1,0,[0,0],"Lamp3","",true,false], 
	["Land_LampHalogen_F",[-30.2266,4.2915,0],87.6371,1,0,[0,0],"Lamp4","",true,false], 
	["Land_LampHalogen_F",[-2.44629,-33.6194,0],175.33,1,0,[0,-0],"Lamp5","",true,false], 
	["Land_LampHalogen_F",[-0.770752,35.9561,0],176.619,1,0,[0,-0],"Lamp6","",true,false], 
	["Land_LampHalogen_F",[-26.9272,-42.2476,0],84.9742,1,0,[0,0],"Lamp7","",true,false],
	//--- walls - barriers
	["Land_CncWall4_F",[-50.5356,41.0581,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-19.4541,62.3462,0],89.7841,1,0,[0,0],"wall2_1","",true,false], 
	["Land_CncWall4_F",[-50.5479,-41.9041,0],269.985,1,0,[0,0],"wall2_3","",true,false], 
	["Land_CncWall4_F",[27.3228,61.0996,0],270,1,0,[0,-0],"wall3_5_2","",true,false], 
	["Land_CncWall4_F",[19.9868,64.1294,0],179.553,1,0,[0,-0],"wall3_2","",true,false], 
	["Land_CncWall4_F",[48.9395,45.9045,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-50.5508,46.1125,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-0.0136719,2.47681,0],179.746,1,0,[0,-0],"","",true,false], 
	["Land_CncBarrier_F",[4.36084,1.39502,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-4.14941,-2.40308,0],270.106,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[7.49658,1.37549,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-8.62549,2.5105,0],359.95,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-7.96045,6.47412,0],270.106,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[10.5454,1.37549,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-4.16748,-10.4004,0],270.106,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[14.666,2.57153,0],359.534,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-2.8501,-14.9377,0],270.066,1,0,[0,-0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-8.05859,13.9888,0],270.106,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-16.2988,2.63062,0],179.738,1,0,[0,-0],"","",true,false], 
	["Land_CncBarrier_F",[-2.85596,-17.9851,0],270.066,1,0,[0,-0],"","",true,false], 
	["Land_CncBarrier_F",[-20.5337,1.44678,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-2.87842,-21.1213,0],270.066,1,0,[0,-0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[22.1758,2.61108,0],179.796,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-6.53564,-21.4995,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-7.93848,21.479,0],270.106,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-9.58447,-21.4995,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-23.5825,1.44678,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-4.19824,-24.5847,0],270.106,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-12.7202,-21.48,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-26.7183,1.46631,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-16.4624,-21.4355,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-6.6958,26.7439,0],90.0484,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-19.5112,-21.4355,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[29.6187,2.60669,0],179.796,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-6.69482,29.7844,0],90.0484,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-22.647,-21.416,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-31.2485,2.64966,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-4.27539,-32.2881,0],270.106,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-6.67383,32.9265,0],90.0484,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-25.4751,-22.7849,0],302.796,1,0,[0,-0],"","",true,false], 
	["Land_CncBarrier_F",[-6.72949,36.1685,0],89.7847,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-27.1187,-25.3477,0],302.796,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[37.0605,2.59741,0],179.796,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-38.6899,2.68335,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-6.74121,39.2092,0],89.7847,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-4.28857,-39.939,0],270.106,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-28.8398,-27.9702,0],302.796,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-29.7134,-31.3564,0],270.001,1,0,[0,-0],"","",true,false], 
	["Land_CncWall4_F",[-0.612305,-43.9363,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[4.62695,-43.9182,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-5.84229,-43.8862,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[44.584,2.66406,0],179.796,1,0,[0,-0],"","",true,false], 
	["Land_CncWall4_F",[9.78711,-43.9583,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-11.0322,-43.9063,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-7.93066,44.3613,0],270.106,1,0,[0,-0],"","",true,false], 
	["Land_CncBarrier_F",[-29.7285,-34.4028,0],270.001,1,0,[0,-0],"","",true,false], 
	["Land_CncWall4_F",[14.8369,-43.9683,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-46.188,2.66528,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-16.082,-43.8962,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-29.7417,-37.5435,0],270.001,1,0,[0,-0],"","",true,false], 
	["Land_CncWall4_F",[20.0269,-43.9482,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-21.2422,-43.8562,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[49.0088,-0.710205,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[48.9912,4.49121,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[48.9888,-5.875,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-50.4814,-0.502197,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[49.0068,9.75244,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-50.499,4.69922,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[48.9932,-10.929,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[25.2568,-43.9983,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-50.5015,-5.66699,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[-29.7417,-40.9185,0],270.001,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-26.5234,-43.8518,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-50.4834,9.96045,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-50.4971,-10.7209,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[48.9702,14.9434,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[49.0342,-16.1213,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-7.89258,51.7932,0],270.106,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-50.52,15.1514,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-50.4561,-15.9133,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[48.9551,19.9985,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[30.4814,-43.9651,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[49.0024,-21.3474,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-31.7534,-43.8018,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-50.5352,20.2065,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-50.4878,-21.1394,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[48.9683,25.1538,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[49.0635,-26.571,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-50.522,25.3618,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-0.899414,56.052,0],359.777,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[35.6416,-44.0051,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[4.32227,56.0173,0],359.777,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-6.09521,56.0081,0],359.777,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-50.4268,-26.363,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[9.60205,56.0234,0],359.777,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-36.9434,-43.8218,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-11.1475,55.9905,0],359.777,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[48.9634,30.4348,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[14.7559,56.0093,0],359.777,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-16.3081,56.0115,0],359.777,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[49.0308,-31.7224,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[17.9185,55.7874,0],89.7841,1,0,[0,0],"wall1_2","",true,false], 
	["Land_CncWall4_F",[-50.5269,30.6428,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-50.4595,-31.5144,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[40.6914,-44.0151,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-19.4756,57.1829,0],89.7841,1,0,[0,0],"wall1_1","",true,false], 
	["Land_CncWall4_F",[-41.9932,-43.8118,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[48.9971,35.6641,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[49.0879,-36.8445,0],269.764,1,0,[0,0],"wall1_4","",true,false], 
	["Land_CncWall4_F",[-50.4932,35.8721,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[45.8447,-44.1401,0],359.533,1,0,[0,0],"wall3_4","",true,false], 
	["Land_CncWall4_F",[17.9399,60.9507,0],89.7841,1,0,[0,0],"wall2_2","",true,false], 
	["Land_CncWall4_F",[48.9546,40.8501,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-47.3418,-43.8867,0],359.754,1,0,[0,0],"wall3_3","",true,false], 
	["Land_CncWall4_F",[49.0713,-42.0093,0],269.764,1,0,[0,0],"wall2_4","",true,false], 
	["Land_CncWall4_F",[-50.5029,-36.7395,0],269.985,1,0,[0,0],"wall1_3","",true,false], 
	["Land_CncWall4_F",[25.2026,64.1455,0],179.553,1,0,[0,-0],"wall3_6_1","",true,false], 
	["Land_CncWall4_F",[-21.5664,65.5435,0],179.553,1,0,[0,0],"wall3_1","",true,false], 
	["Land_CncWall4_F",[-28.9126,62.3433,0],270,1,0,[0,0],"wall3_5_1","",true,false], 
	["Land_CncWall4_F",[-26.8335,65.4849,0],179.553,1,0,[0,0],"wall3_1_2","",true,false], 
	["Land_CncWall4_F",[48.9609,51.0679,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-50.5293,51.2759,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[39.5049,61.4683,0],270,1,0,[0,-0],"wall3_5_1_1","",true,false], 
	["Land_CncWall4_F",[-41.0947,61.9746,0],270,1,0,[0,-0],"wall3_5","",true,false], 
	["Land_CncWall4_F",[48.9419,56.3079,0],89.7841,1,0,[0,0],"wall1_1_1","",true,false], 
	["Land_CncWall4_F",[-50.499,56.6624,0],89.7841,1,0,[0,0],"wall1","",true,false], 
	["Land_CncWall4_F",[41.584,64.6099,0],179.553,1,0,[0,0],"wall3_1_2_1","",true,false], 
	["Land_CncWall4_F",[-43.2148,65.0205,0],179.553,1,0,[0,-0],"wall3_6","",true,false], 
	["Land_CncWall4_F",[48.9634,61.4712,0],89.7841,1,0,[0,0],"wall2_1_1","",true,false], 
	["Land_CncWall4_F",[46.8511,64.6685,0],179.553,1,0,[0,0],"wall3_1_1","",true,false], 
	["Land_CncWall4_F",[-50.4775,61.8257,0],89.7841,1,0,[0,0],"wall2","",true,false], 
	["Land_CncWall4_F",[-48.4307,65.0044,0],179.553,1,0,[0,0],"wall3","",true,false], 
	["Land_CncWall4_F",[97.9556,-1.96997,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[97.938,3.23145,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[97.9355,-7.13477,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[97.9536,8.49268,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[97.9399,-12.1887,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[97.917,13.6836,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[97.981,-17.3811,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[97.9019,18.7388,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[97.9492,-22.6072,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[97.915,23.894,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[98.0103,-27.8308,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[97.9102,29.175,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[97.9775,-32.9822,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[97.9438,34.4043,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[97.9014,39.5903,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[97.8862,44.6448,0],89.7841,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[97.9077,49.8081,0],89.7841,1,0,[0,0],"","",true,false],
	//--- towers
	["Land_Cargo_Patrol_V3_F",[-46.0864,60.2117,0],180,1,0,[0,0],"Tower1","",true,false], 
	["Land_Cargo_Patrol_V3_F",[44.416,59.0574,0],180,1,0,[0,0],"Tower2","",true,false], 
	["Land_Cargo_Patrol_V3_F",[22.3311,59.3367,0],180,1,0,[0,0],"Tower3","",true,false], 
	["Land_Cargo_Patrol_V3_F",[-24.0015,60.6057,0],180,1,0,[0,0],"Tower4","",true,false], 
	["Land_Cargo_Patrol_V3_F",[-46.3394,-39.0081,0],0,1,0,[0,0],"Tower5","",true,false], 
	["Land_Cargo_Patrol_V3_F",[43.4443,-38.5754,0],0,1,0,[0,0],"Tower6","",true,false], 
	//--- flags
	["Flag_UK_F",[26.3281,55.885,0],0,1,0,[0,0],"flag2","",true,false], 
	["Flag_UK_F",[-42.0894,56.76,0],0,1,0,[0,0],"flag1","",true,false], 
	//--- gates
	["Land_BarGate_F",[-31.4106,62.4097,0],0,1,0,[0,0],"b1","",true,false], 
	["Land_BarGate_F",[37.0068,61.5347,0],0,1,0,[0,0],"b2","",true,false], 
	["Land_HelipadEmpty_F",[33.4648,59.9575,0],269.723,1,0,[0,0],"GateTrig_pos_pad2","",true,false], 
	["Land_HelipadEmpty_F",[-34.9526,60.8325,0],269.723,1,0,[0,0],"GateTrig_pos_pad","",true,false], 
	//--- support area bunkers
	["Land_BagBunker_Large_F",[92.9658,-40.1804,0],0,1,0,[0,0],"","",true,false], 
	["Land_BagBunker_Large_F",[92.9795,56.8362,0],179.631,1,0,[0,-0],"","",true,false], 
	//---Signs
	["SignAd_Sponsor_Vrana_F",[7.51221,-0.315674,0],180,1,0,[0,0],"Sign_5","",true,false], 
	["SignAd_Sponsor_Vrana_F",[0.412598,-17.8965,0],90,1,0,[0,-0],"Sign_4","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-34.4692,4.78296,0],180,1,0,[0,0],"Sign_7","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-43.167,4.71655,0],180,1,0,[0,0],"Sign_6","",true,false],
	["SignAd_Sponsor_Vrana_F",[-43.3398,-7.05225,0],269.305,1,0,[0,0],"Sign_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-43.3013,-11.0164,0],269.305,1,0,[0,0],"Sign_2","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-43.2925,-14.9373,0],269.305,1,0,[0,0],"Sign_3","",true,false], 
	//--- VVS
	["SignAd_Sponsor_Vrana_F",[52.04,-9.20898,0],269.723,1,0,[0,0],"Supportsign_3","",true,false], 
	["SignAd_Sponsor_Vrana_F",[52.5317,19.3496,0],269.723,1,0,[0,0],"Supportsign_2","",true,false], 
	["SignAd_Sponsor_Vrana_F",[52.8262,-39.2544,0],269.723,1,0,[0,0],"Supportsign_4","",true,false], 
	["SignAd_Sponsor_Vrana_F",[52.125,46.3022,0],269.723,1,0,[0,0],"Supportsign_1","",true,false], 
	["Land_HelipadRescue_F",[72.1846,-10.9912,0],89.8326,1,0,[0,0],"VVS_car_1","",true,false], 
	["Land_HelipadRescue_F",[72.5254,17.8633,0],89.8326,1,0,[0,0],"VVS_air_1","",true,false], 
	["Land_HelipadRescue_F",[72.4639,-37.9453,0],89.8326,1,0,[0,0],"VVS_tank_1","",true,false], 
	["Land_HelipadRescue_F",[72.3369,46.9326,0],89.8326,1,0,[0,0],"VVS_Support_1","",true,false], 
	//--- slingloads
	["B_Slingload_01_Ammo_F",[42.5132,43.7871,0],89.8326,1,0,[0,0],"Ammo_cont","",true,false], 
	["B_Slingload_01_Fuel_F",[42.6465,38.5366,0],89.8326,1,0,[0,0],"Fuel_cont","",true,false], 
	["B_Slingload_01_Medevac_F",[42.541,32.9888,0],89.8326,1,0,[0,0],"Med_cont","",true,false], 
	["B_Slingload_01_Repair_F",[42.729,27.7876,0],89.8326,1,0,[0,0],"Rep_cont","",true,false], 
	["B_Slingload_01_Ammo_F",[42.7432,23.0928,0],89.8326,1,0,[0,0],"Ammo_cont_1","",true,false], 
	["B_Slingload_01_Fuel_F",[42.8765,17.8423,0],89.8326,1,0,[0,0],"Fuel_cont_1","",true,false], 
	["B_Slingload_01_Medevac_F",[42.771,12.2944,0],89.8326,1,0,[0,0],"Med_cont_1","",true,false], 
	["B_Slingload_01_Repair_F",[42.959,7.09326,0],89.8326,1,0,[0,0],"Rep_cont_1","",true,false]

] + Base2;

BaseStad =
[
	["Land_HelipadEmpty_F",[-6.97754,6.24316,0],308.937,1,0,[0.118837,0.0960147],"Start_pos_pad","",true,false], 
	["Land_HelipadEmpty_F",[7.81738,-6.96387,0],129.002,1,0,[0,-0],"Ammo_1_marker","",true,false], 
	["Land_HelipadEmpty_F",[11.0776,-3.21875,0],129.002,1,0,[0,-0],"Ammo_2_marker","",true,false], 
	["SignAd_Sponsor_Vrana_F",[10.2563,-10.4834,0],128.584,1,0,[0,0],"Sign_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[12.7324,-7.38965,0],128.584,1,0,[0,0],"Sign_2","",true,false], 
	["SignAd_Sponsor_Vrana_F",[15.2041,-4.35156,0],128.584,1,0,[0,0],"Sign_3","",true,false], 
	["Land_HelipadEmpty_F",[17.9048,8.58594,0],218.36,1,0,[0,0],"Med_Fac_Pad","",true,false], 
	["Land_HelipadEmpty_F",[-16.458,13.8945,0],308.937,1,0,[0,-0],"Respawn_pos_pad","",true,false], 
	["Land_HelipadEmpty_F",[-1.3667,24.2813,0],218.36,1,0,[0,0],"Rep_Fac_Pad","",true,false], 
	[BTruckR,[27.8779,17.2236,0.114967],308.206,1,0,[0,0],"Repair_Truck_1","",true,false], 
	[BTruckF,[31.1475,21.1826,0.114967],308.206,1,0,[0,-0],"Fuel_Truck_1","",true,false], 
	["Land_HelipadRescue_F",[15.2085,35.3623,0],38.4693,1,0,[0,0],"","",true,false], 
	["Land_HelipadEmpty_F",[33.9756,25.335,0],308.637,1,0,[0,0],"MedicalTruck_1_Marker","",true,false], 
	[BTruckA,[37.6353,29.0791,0.114967],308.206,1,0,[0,-0],"AmmoTruck_1","",true,false], 
	["B_Slingload_01_Ammo_F",[32.8628,44.7949,0],38.4693,1,0,[0,0],"Ammo_cont_1","",true,false], 
	["B_Slingload_01_Fuel_F",[37.0513,41.6279,0],38.4693,1,0,[0,0],"Fuel_cont_1","",true,false], 
	["B_Slingload_01_Repair_F",[29.1797,47.7207,0],38.4693,1,0,[0,0],"Rep_cont","",true,false], 
	["B_Slingload_01_Medevac_F",[41.3145,38.0742,0],38.4693,1,0,[0,0],"Med_cont_1","",true,false], 
	["B_Slingload_01_Medevac_F",[25.0093,50.8193,0],38.4693,1,0,[0,0],"Med_cont","",true,false], 
	["B_Slingload_01_Repair_F",[45.1665,35.0605,0],38.4693,1,0,[0,0],"Rep_cont_1","",true,false], 
	["B_Slingload_01_Fuel_F",[20.7349,54.375,0],38.4693,1,0,[0,0],"Fuel_cont","",true,false], 
	["B_Slingload_01_Ammo_F",[16.5435,57.5566,0],38.4693,1,0,[0,0],"Ammo_cont","",true,false], 
	[BCar2,[50.2563,-42.5205,0.149763],130.139,1,0,[-0.510772,0.368713],"car_4","",true,false], 
	[BCar2,[54.2559,-37.7148,0.149414],130.139,1,0,[-0.295489,0.350416],"car_3","",true,false], 
	[BCar2,[46.2651,-47.626,0.149067],131.376,1,0,[-0.165151,-0.0436674],"car_8","",true,false], 
	[BCar2,[57.6646,-34.3037,0.149036],129.719,1,0,[0.00994371,0.107582],"car_2","",true,false], 
	[Bcar1,[42.1426,-52.334,0.149122],131.376,1,0,[-0.222466,-0.0941557],"car_7","",true,false], 
	[Bcar1,[61.6392,-29.4668,0.149105],129.719,1,0,[0.019886,0.215142],"car_1","",true,false], 
	[Bcar1,[38.8481,-56.3408,0.149191],130.631,1,0,[-0.231914,-0.19899],"car_6","",true,false], 
	[Bquad,[66.709,-18.1357,0.236357],128.666,1,0,[-4.45338,2.39623],"quad_1","",true,false], 
	[Bquad,[68.3843,-16.0234,0.236359],128.666,1,0,[-4.45338,2.39623],"quad_2","",true,false], 
	[Bcar1,[34.8359,-61.0869,0.150633],130.634,1,0,[-0.695666,-0.59698],"car_5","",true,false], 
	[Bquad,[70.0576,-14.1523,0.232874],128.791,1,0,[-4.77203,-0.512017],"quad_3","",true,false], 
	[Bquad,[71.7329,-12.0498,0.232407],128.79,1,0,[-4.67697,-0.631021],"quad_4","",true,false], 
	[Bquad,[70.0142,-20.6611,0.206726],128.702,1,0,[-1.9315,-0.764937],"quad_12","",true,false], 
	[BHeliT,[11.125,-72.8096,0.00232124],131.34,1,0,[0.7387,0.548145],"Huron_1","",true,false], 
	[Bquad,[73.3008,-9.78223,0.222195],128.681,1,0,[-3.56331,1.6447],"quad_5","",true,false], 
	[Bquad,[71.8003,-18.6523,0.232916],128.791,1,0,[-4.77203,-0.512017],"quad_11","",true,false], 
	["Land_HelipadCircle_F",[12.5435,-73.9346,0],131.673,1,0,[0,-0],"","",true,false], 
	[Bquad,[73.1377,-16.8906,0.210056],128.648,1,0,[-1.56212,2.07537],"quad_10","",true,false], 
	[Bquad,[74.9717,-7.66699,0.222139],128.681,1,0,[-3.56331,1.6447],"quad_6","",true,false], 
	[Bquad,[74.9302,-14.6836,0.205809],128.698,1,0,[-1.8483,-0.502307],"quad_9","",true,false], 
	[Bquad,[76.604,-12.3691,0.205793],128.698,1,0,[-1.8483,-0.502307],"quad_8","",true,false], 
	[Bquad,[78.4082,-10.2861,0.22621],128.777,1,0,[-3.92755,-1.68981],"quad_7","",true,false], 
	[BHeliLB,[-41.1997,-86.834,0.00956726],216.221,1,0,[-2.39787,-1.37831],"LB_2","",true,false], 
	["Land_HelipadRescue_F",[64.9204,-71.3271,0],310.463,1,0,[0,0],"VVS_Support_1","",true,false], 
	["Land_HelipadCircle_F",[-41.4492,-87.3672,0],306.006,1,0,[0,0],"","",true,false], 
	["Land_HelipadRescue_F",[83.939,-49.6328,0],310.37,1,0,[0,0],"VVS_car_1","",true,false], 
	[BHeliLB,[-21.8301,-100.86,0.00557327],216.196,1,0,[-2.05318,-0.556462],"LB_1","",true,false], 
	["Land_HelipadCircle_F",[-22.354,-101.776,0],306.009,1,0,[0,0],"","",true,false], 
	["Land_HelipadRescue_F",[46.1577,-93.5332,0],310.386,1,0,[0,0],"VVS_air_1","",true,false], 
	["Land_HelipadRescue_F",[101.248,-28.9639,0],310.318,1,0,[0,0],"VVS_tank_1","",true,false], 
	["RoadCone_L_F",[-52.1587,-98.3975,0.00469971],219.714,1,0,[-2.39711,-1.29685],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-50.4155,-99.79,0.00210571],40.1686,1,0,[2.38676,1.31583],"Sign_4","",true,false], 
	["RoadCone_L_F",[-48.4316,-101.458,0.00405884],219.688,1,0,[-1.96801,-1.33576],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[8.40137,-112.937,0.00269318],129.396,1,0,[3.04566,-0.461965],"Sign_7","",true,false], 
	["RoadCone_L_F",[-32.1475,-111.095,0.00267792],216.678,1,0,[-1.19138,0.0651111],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[79.1406,-85.4609,0.000226974],130.284,1,0,[0.394063,0.834683],"Supportsign_2","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-30.29,-112.575,0.000331879],36.1922,1,0,[1.19078,-0.0752062],"Sign_5","",true,false], 
	["SignAd_Sponsor_Vrana_F",[98.0869,-64.0771,0.014389],130.512,1,0,[6.88633,0.486417],"Supportsign_3","",true,false], 
	["RoadCone_L_F",[-28.2759,-113.963,0.00285721],216.646,1,0,[-1.405,0.0971689],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[3.27686,-120.016,-0.0469322],129.348,1,0,[-0.415744,1.83185],"Sign_6","",true,false], 
	["SignAd_Sponsor_Vrana_F",[62.2886,-106.189,-0.308699],130.127,1,0,[-1.79779,4.96597],"Supportsign_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[117.026,-40.7441,0.0296307],130.731,1,0,[9.79606,0.453331],"Supportsign_4","",true,false]
];

BaseHill1 = 
[
	["Land_HelipadEmpty_F",[5.19531,8.08984,0],27.272,1,0,[0.577354,3.04518],"Ammo_2_marker","",true,false], 
	["Land_HelipadEmpty_F",[9.5293,5.67773,0],27.3359,1,0,[0.932263,4.34336],"Ammo_1_marker","",true,false], 
	["SignAd_Sponsor_Vrana_F",[5.48047,12.3867,0.0207825],26.5359,1,0,[8.24469,-0.209206],"Sign_3","",true,false], 
	["SignAd_Sponsor_Vrana_F",[8.91602,10.5664,0.0200195],27.2912,1,0,[4.92928,6.39107],"Sign_2","",true,false], 
	["SignAd_Sponsor_Vrana_F",[12.4717,8.77344,0.0200806],27.2912,1,0,[4.92928,6.39107],"Sign_1","",true,false], 
	[Bquad,[11.0391,19.6992,0.253845],28.8907,1,0,[-2.98693,5.40173],"quad_4","",true,false], 
	["Land_HelipadEmpty_F",[22.4492,-2.4707,0],0.443231,1,0,[6.1323,4.16575],"Respawn_pos_pad","",true,false], 
	[Bquad,[13.374,18.3672,0.253937],28.8907,1,0,[-2.98693,5.40173],"quad_3","",true,false], 
	["Land_HelipadEmpty_F",[22.6514,-2.28906,0],118.521,1,0,[-6.55066,3.46293],"Start_pos_pad","",true,false], 
	[Bquad,[8.59375,21.1191,0.328491],28.3986,1,0,[-6.94674,6.61758],"quad_5","",true,false], 
	[Bquad,[15.3613,17.1074,0.248749],28.9042,1,0,[-2.84085,5.13572],"quad_2","",true,false], 
	[Bquad,[5.76074,22.3984,0.213013],29.0643,1,0,[-2.60251,-1.4471],"quad_6","",true,false], 
	["Land_HelipadEmpty_F",[-20.46,10.8594,0],121.761,1,0,[-0.473237,1.05486],"MedicalTruck_1_Marker","",true,false], 
	[BTruckF,[-18.1367,15.2813,0.115936],121.336,1,0,[-0.618581,0.42828],"Fuel_Truck_1","",true,false], 
	[Bquad,[17.71,15.8379,0.248657],28.9042,1,0,[-2.84085,5.13572],"quad_1","",true,false], 
	[BTruckA,[-23.6816,6.71875,0.115753],121.338,1,0,[0.680837,0.0567453],"AmmoTruck_1","",true,false], 
	[BTruckR,[-15.3564,19.5371,0.118103],121.332,1,0,[-0.831301,0.924837],"Repair_Truck_1","",true,false], 
	[Bquad,[13.1367,23.498,0.260742],28.7271,1,0,[-4.90495,4.35306],"quad_9","",true,false], 
	[Bquad,[10.5859,24.7813,0.260651],28.7271,1,0,[-4.90495,4.35306],"quad_8","",true,false], 
	[Bquad,[15.54,22.0957,0.243866],28.9042,1,0,[-2.84085,5.13572],"quad_10","",true,false], 
	[Bquad,[17.4375,20.8262,0.235352],29.0113,1,0,[-1.50256,4.74652],"quad_11","",true,false], 
	[Bquad,[8.24512,26.084,0.260742],28.7271,1,0,[-4.90495,4.35306],"quad_7","",true,false], 
	[Bquad,[19.8369,19.498,0.235382],29.0113,1,0,[-1.50256,4.74652],"quad_12","",true,false], 
	[BCar2,[14.3945,34.6289,0.171448],323.368,1,0,[0.947735,3.57462],"car_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-28.9873,29.3027,9.15527e-005],310.397,1,0,[0.523759,0.445713],"Sign_5","",true,false], 
	["RoadCone_L_F",[-30.6328,27.5742,0.00448608],130.843,1,0,[-1.45928,2.27148],"","",true,false], 
	["RoadCone_L_F",[-27.4736,31.3027,0.00686646],130.771,1,0,[1.97281,-3.3381],"","",true,false], 
	[BCar2,[19.2578,38.3848,0.157135],323.354,1,0,[-0.405232,2.01442],"car_2","",true,false], 
	["RoadCone_L_F",[-41.4199,12.0762,0.00369263],133.838,1,0,[1.36659,-1.86407],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-43.2119,10.1855,0.00119019],314.338,1,0,[-1.39028,1.2044],"Sign_4","",true,false], 
	["RoadCone_L_F",[-44.7695,8.5625,0.00311279],133.883,1,0,[1.38069,-1.21538],"","",true,false], 
	[BCar2,[23.5107,40.8184,0.170593],323.806,1,0,[1.15482,3.12769],"car_3","",true,false], 
	[BCar2,[28.4229,44.4004,0.155334],323.822,1,0,[1.48519,0.995695],"car_4","",true,false], 
	["Land_HelipadCircle_F",[-39.1563,38.0117,0],220.275,1,0,[0,0],"","",true,false], 
	[BHeliLB,[-40.1465,38.8457,0.019165],130.324,1,0,[2.34506,-3.1155],"LB_1","",true,false], 
	["Land_HelipadCircle_F",[-54.9365,20.0195,0],220.213,1,0,[0,0],"","",true,false], 
	[BHeliLB,[-55.6357,20.2598,0.00634766],130.369,1,0,[-0.305736,2.24567],"LB_2","",true,false], 
	["SignAd_Sponsor_Vrana_F",[12.3184,58.1699,0.00204468],338.369,1,0,[1.02844,2.3849],"Sign_7","",true,false], 
	[Bcar1,[37.6201,47.8379,0.150269],341.981,1,0,[0.454183,0.655376],"car_8","",true,false], 
	["SignAd_Sponsor_Vrana_F",[20.3906,61.4395,0.00296021],338.274,1,0,[-1.52095,2.57805],"Sign_6","",true,false], 
	["Land_HelipadCircle_F",[-65.5781,6.20117,0],131.652,1,0,[0,-0],"","",true,false], 
	[Bcar1,[43.6445,49.8809,0.15863],341.953,1,0,[-0.329015,2.19499],"car_7","",true,false], 
	[BHeliT,[-66.9297,7.10742,0.0121155],131.316,1,0,[-1.03124,1.6358],"Huron_1","",true,false], 
	[Bcar1,[48.541,51.666,0.159882],341.202,1,0,[-0.420273,2.32081],"car_6","",true,false], 
	[Bcar1,[54.1074,53.5918,0.159943],341.246,1,0,[-0.761335,-2.24133],"car_5","",true,false], 
	["Land_HelipadRescue_F",[543.576,157.27,0],269.761,1,0,[0,0],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[569.257,131.744,0.00949097],291.08,1,0,[3.56828,4.31647],"Supportsign_2","",true,false], 
	["SignAd_Sponsor_Vrana_F",[578.69,156.984,0.00408936],291.037,1,0,[1.02549,3.50044],"Supportsign_1","",true,false], 
	["Land_HelipadRescue_F",[587.317,123.096,0],111.076,1,0,[0,-0],"VVS_Support_1","",true,false], 
	["Land_HelipadRescue_F",[597.711,150.219,0],111.068,1,0,[0,-0],"VVS_air_1","",true,false], 
	["Land_HelipadRescue_F",[607.051,115.572,0],291.654,1,0,[0,0],"VVS_car_1","",true,false], 
	["Land_HelipadRescue_F",[616.77,140.717,0],291.317,1,0,[0,0],"VVS_tank_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[623.205,109.646,0.00265503],111.237,1,0,[2.89671,-0.922271],"Supportsign_3","",true,false], 
	["SignAd_Sponsor_Vrana_F",[635.513,134.697,0.00505066],111.406,1,0,[2.16005,-3.41565],"Supportsign_4","",true,false], 
	["B_Slingload_01_Ammo_F",[680.405,156.422,0.0058136],0.729266,1,0,[-0.0287016,-3.73872],"Ammo_cont","",true,false], 
	["B_Slingload_01_Fuel_F",[685.738,156.463,4.57764e-005],0.724617,1,0,[0.233018,-0.302601],"Fuel_cont","",true,false], 
	["B_Slingload_01_Medevac_F",[691.299,156.273,3.05176e-005],0.725849,1,0,[0.229154,0.0029032],"Med_cont","",true,false], 
	["B_Slingload_01_Repair_F",[701.184,131.42,0.000701904],88.7534,1,0,[1.75607,-0.038225],"Rep_cont_1","",true,false], 
	["B_Slingload_01_Repair_F",[696.494,156.389,3.05176e-005],0.725849,1,0,[0.229154,0.0029032],"Rep_cont","",true,false], 
	["B_Slingload_01_Medevac_F",[701.035,136.299,0.00138855],88.7534,1,0,[1.76603,0.420008],"Med_cont_1","",true,false], 
	["B_Slingload_01_Fuel_F",[701.053,141.863,0.000732422],88.7537,1,0,[1.29816,-0.0282473],"Fuel_cont_1","",true,false], 
	["B_Slingload_01_Ammo_F",[700.847,147.111,0.00012207],88.754,1,0,[0.239085,0.453247],"Ammo_cont_1","",true,false], 
	["Land_HelipadEmpty_F",[736.181,80.6895,0],84.3512,1,0,[0.0610667,-0.15949],"Med_Fac_Pad","",true,false], 
	["Land_HelipadEmpty_F",[743.357,65.3418,0],84.3512,1,0,[0.00752694,0.0760976],"Rep_Fac_Pad","",true,false]
];

BaseCap =
[
	["Land_HelipadEmpty_F",[0.126953,0.0429688,0],0,1,0,[-0.305582,-0],"Respawn_pos_pad","",true,false], 
	["Land_HelipadEmpty_F",[0.330078,0.224609,0],118.497,1,0,[0.145796,-0.268559],"Start_pos_pad","",true,false], 
	["Land_HelipadEmpty_F",[2.63086,-16.2461,0],144.61,1,0,[0.735753,0.508087],"Ammo_2_marker","",true,false], 
	["Land_HelipadEmpty_F",[-1.49219,-18.9941,0],144.612,1,0,[1.06509,0.18041],"Ammo_1_marker","",true,false], 
	["SignAd_Sponsor_Vrana_F",[6.32422,-18.502,0.000156403],144.191,1,0,[0.870397,0.0313915],"Sign_3","",true,false], 
	["SignAd_Sponsor_Vrana_F",[3.13477,-20.6855,0.000301361],144.195,1,0,[1.04912,0.279285],"Sign_2","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-0.107422,-22.998,0.000244141],144.194,1,0,[1.06638,0.172638],"Sign_1","",true,false], 
	[BTruckA,[26.668,-0.46875,0.229088],142.742,1,0,[4.07022,-7.09597],"AmmoTruck_1","",true,false], 
	["Land_HelipadEmpty_F",[30.957,1.72266,0],143.582,1,0,[3.70956,-2.16987],"MedicalTruck_1_Marker","",true,false], 
	[BTruckF,[34.5938,5.20898,0.143444],143.296,1,0,[4.0723,0.103485],"Fuel_Truck_1","",true,false], 
	[BCar2,[14.0918,-36.959,0.149731],321.349,1,0,[-0.572604,-0.226787],"car_5","",true,false], 
	[BTruckR,[38.7324,8.20898,0.152416],143.296,1,0,[4.25396,0.348479],"Repair_Truck_1","",true,false], 
	[BCar2,[9.24414,-40.7695,0.152554],321.345,1,0,[-1.25259,0.512909],"car_6","",true,false], 
	[BCar2,[35.2383,-22.9922,0.151588],318.641,1,0,[-0.759112,0.871813],"car_1","",true,false], 
	[BCar2,[39.916,-18.8262,0.15192],318.64,1,0,[-0.765942,0.979609],"car_2","",true,false], 
	[Bcar1,[5.24805,-44.1797,0.152088],322.094,1,0,[-1.23251,0.282086],"car_7","",true,false], 
	[BCar2,[43.9199,-15.9883,0.156422],319.054,1,0,[0.0780427,1.95434],"car_3","",true,false], 
	[BCar2,[0.703125,-47.7539,0.237133],321.85,1,0,[-0.751706,6.68016],"car_8","",true,false], 
	[Bcar1,[48.5625,-11.9609,0.151394],319.066,1,0,[0.138934,1.09287],"car_4","",true,false], 
	[Bquad,[-10.752,-57.6602,0.201595],325.372,1,0,[0.758792,-0.245518],"quad_12","",true,false], 
	["Land_HelipadEmpty_F",[53.5586,26.9727,0],138.63,1,0,[-2.34018,-4.03899],"Rep_Fac_Pad","",true,false], 
	[Bquad,[-13.0039,-59.2266,0.201595],325.372,1,0,[0.758792,-0.245518],"quad_11","",true,false], 
	[Bquad,[-8.45117,-61.2598,0.20219],325.366,1,0,[0.2378,-0.999783],"quad_1","",true,false], 
	[Bquad,[-14.9512,-60.416,0.201458],325.376,1,0,[0.661532,0.285876],"quad_10","",true,false], 
	[Bquad,[-10.5625,-62.7598,0.201252],325.374,1,0,[0.410126,0.459469],"quad_2","",true,false], 
	[Bquad,[-17.1621,-62.0039,0.201462],325.376,1,0,[0.661532,0.285876],"quad_9","",true,false], 
	[Bquad,[-12.5742,-63.998,0.201256],325.374,1,0,[0.410126,0.459469],"quad_3","",true,false], 
	[Bquad,[-19.4922,-63.5879,0.205856],325.363,1,0,[-1.70113,0.89689],"quad_8","",true,false], 
	[Bquad,[-14.8105,-65.4902,0.201252],325.374,1,0,[0.410126,0.459469],"quad_4","",true,false], 
	[Bquad,[-21.709,-65.1328,0.205849],325.363,1,0,[-1.70113,0.89689],"quad_7","",true,false], 
	[Bquad,[-16.9805,-67.1563,0.215294],325.327,1,0,[-0.0930207,3.21925],"quad_5","",true,false], 
	[Bquad,[-19.375,-68.7695,0.203995],325.388,1,0,[-1.44846,-0.485263],"quad_6","",true,false], 
	["SignAd_Sponsor_Vrana_F",[64.5332,-49.623,0.000881195],228.214,1,0,[-0.124896,-1.62971],"Supportsign_3","",true,false], 
	["Land_HelipadRescue_F",[77.2051,-37.8809,0],48.5333,1,0,[0,0],"VVS_car_1","",true,false], 
	["Land_HelipadEmpty_F",[73.9863,44.2422,0],138.367,1,0,[2.8399,-5.06844],"Med_Fac_Pad","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-58.9414,-65.6504,0.00146484],141.932,1,0,[0.0609778,2.18301],"Sign_7","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-64.2988,-69.1777,0.00283051],322.92,1,0,[-2.39185,1.52104],"Sign_6","",true,false], 
	["Land_HelipadRescue_F",[91.5781,-23.6016,0],229.465,1,0,[0,0],"VVS_Support_1","",true,false], 
	["RoadCone_L_F",[104.908,3.52539,0.00396729],318.672,1,0,[-2.22844,-0.684306],"","",true,false], 
	["B_Slingload_01_Ammo_F",[-73.2441,-77.3809,0.0111008],149.115,1,0,[4.94221,-1.53877],"Ammo_cont","",true,false], 
	["SignAd_Sponsor_Vrana_F",[106.689,5.20508,0.00153732],138.215,1,0,[2.29065,0.615667],"Sign_5","",true,false], 
	["SignAd_Sponsor_Vrana_F",[106.518,-10.9844,0.000240326],50.7081,1,0,[-0.752469,-0.075218],"Supportsign_2","",true,false], 
	["SignAd_Sponsor_Vrana_F",[81.3086,-71.9355,0.0152855],228.508,1,0,[1.87492,-6.72722],"Supportsign_4","",true,false], 
	["RoadCone_L_F",[108.525,6.66406,0.00403214],318.699,1,0,[-2.29233,-0.527222],"","",true,false], 
	["Land_HelipadRescue_F",[95.1914,-57.9551,0],48.4873,1,0,[0,0],"VVS_tank_1","",true,false], 
	["B_Slingload_01_Ammo_F",[-61.5938,-93.0781,0.00354767],145.649,1,0,[-2.52439,1.44852],"Ammo_cont_1","",true,false], 
	["B_Slingload_01_Fuel_F",[-77.6426,-80.2598,0.00187683],149.096,1,0,[0.77498,-1.97672],"Fuel_cont","",true,false], 
	["Land_HelipadRescue_F",[94.4434,60.2871,0],228.253,1,0,[0,0],"","",true,false], 
	["Land_HelipadCircle_F",[115.598,-4.79102,0],48.0103,1,0,[0,0],"","",true,false], 
	["B_Slingload_01_Fuel_F",[-65.8867,-96.0645,0.000144958],145.673,1,0,[-0.418528,0.470803],"Fuel_cont_1","",true,false], 
	[BHeliLB,[116.479,-5.51172,0.00163269],318.189,1,0,[-1.04853,-0.599419],"LB_1","",true,false], 
	["B_Slingload_01_Medevac_F",[-82.4453,-83.0254,0.00200272],149.096,1,0,[0.631024,-2.06851],"Med_cont","",true,false], 
	["Land_HelipadRescue_F",[110.514,-45.6035,0],229.568,1,0,[0,0],"VVS_air_1","",true,false], 
	["B_Slingload_01_Medevac_F",[-70.4746,-99.0156,0.00465393],145.618,1,0,[0.298578,-3.34775],"Med_cont_1","",true,false], 
	["B_Slingload_01_Repair_F",[-86.8555,-85.8457,0.00198364],149.107,1,0,[1.86123,-1.20285],"Rep_cont","",true,false], 
	["RoadCone_L_F",[121.334,20.6719,-0.00922394],321.587,1,0,[-1.97878,2.543],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[122.74,22.4121,0.0501556],142.108,1,0,[1.88163,-1.56131],"Sign_4","",true,false], 
	["B_Slingload_01_Repair_F",[-74.5156,-101.793,0.00547791],145.596,1,0,[0.718592,-3.54309],"Rep_cont_1","",true,false], 
	["RoadCone_L_F",[125.189,23.7188,0.0045166],321.632,1,0,[-1.25262,2.35463],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[125.525,-32.0059,0.00383759],49.3824,1,0,[-0.902172,3.28624],"Supportsign_1","",true,false], 
	["Land_HelipadCircle_F",[133.643,10.9121,0],48.0056,1,0,[0,0],"","",true,false], 
	[BHeliLB,[134.355,10.5488,0.00697708],318.15,1,0,[-0.23846,2.36598],"LB_2","",true,false], 
	["Land_HelipadCircle_F",[146.111,23.1855,0],319.408,1,0,[0,0],"","",true,false], 
	[BHeliT,[147.547,22.1582,0.0208359],319.067,1,0,[-0.179829,3.28709],"Huron_1","",true,false]
];

BaseBeach =
[
	["Land_HelipadEmpty_F",[-0.117188,-0.208984,0],177.971,1,0,[0.0162313,0.458072],"Respawn_pos_pad","",true,false], 
	["Land_HelipadEmpty_F",[-0.304688,-0.394531,0],296.468,1,0,[-0.410317,-0.204295],"Start_pos_pad","",true,false], 
	["Land_HelipadEmpty_F",[-4.88867,-27.5605,0],134.255,1,0,[3.26402,2.00957],"Ammo_2_marker","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-0.855469,-29.1084,1.71661e-005],133.753,1,0,[0.48722,0.0434288],"Sign_3","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-3.61035,-31.8125,0.000180244],133.748,1,0,[0.4707,-0.712671],"Sign_2","",true,false], 
	["Land_HelipadEmpty_F",[-8.41895,-31.0039,0],134.035,1,0,[3.1701,-4.0447],"Ammo_1_marker","",true,false], 
	[Bquad,[24.6592,24.209,0.259768],43.6877,1,0,[-5.46794,-3.54409],"quad_6","",true,false], 
	[Bquad,[26.8057,22.3643,0.281255],43.4496,1,0,[-7.45341,-1.41799],"quad_5","",true,false], 
	["RoadCone_L_F",[-17.2939,30.585,0.0343876],166.322,1,0,[9.93412,-1.73403],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-6.36133,-34.6787,0.000246048],133.748,1,0,[0.0891316,-0.866391],"Sign_1","",true,false], 
	[Bquad,[28.9912,20.501,0.281256],43.4496,1,0,[-7.45341,-1.41799],"quad_4","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-19.8389,29.8994,0.0351763],346.287,1,0,[-9.19349,4.84617],"Sign_4","",true,false], 
	[Bquad,[30.9102,18.5918,0.274745],43.4424,1,0,[-7.12614,-1.10202],"quad_3","",true,false], 
	[Bquad,[32.5459,16.8633,0.273456],43.4424,1,0,[-7.12614,-1.10202],"quad_2","",true,false], 
	["RoadCone_L_F",[-22.0459,29.4209,0.03617],165.828,1,0,[9.1553,-4.91972],"","",true,false], 
	[Bquad,[34.459,15.0605,0.264856],43.5153,1,0,[-6.55435,-1.72016],"quad_1","",true,false], 
	["RoadCone_L_F",[0.178711,37.9004,0.0120006],163.221,1,0,[4.71925,-3.09876],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[2.4668,38.3574,0.0105371],342.735,1,0,[-4.69296,3.13863],"Sign_5","",true,false], 
	[Bquad,[27.6719,27.084,0.213213],43.5922,1,0,[-2.72992,-1.22952],"quad_7","",true,false], 
	[Bquad,[29.6377,25.2402,0.217073],43.6002,1,0,[-3.06084,-1.54581],"quad_8","",true,false], 
	[Bquad,[31.7852,23.3662,0.217089],43.6002,1,0,[-3.06084,-1.54581],"quad_9","",true,false], 
	["RoadCone_L_F",[4.85352,39.248,0.00340033],162.839,1,0,[3.08328,-8.32957],"","",true,false], 
	[BCar2,[40.0332,0.367188,0.169637],127.921,1,0,[-0.721037,-3.17324],"car_5","",true,false], 
	[Bquad,[33.8105,21.5225,0.217771],43.5911,1,0,[-3.21863,-1.37944],"quad_10","",true,false], 
	[Bquad,[35.3916,19.8311,0.217771],43.5911,1,0,[-3.21863,-1.37944],"quad_11","",true,false], 
	[Bquad,[37.3701,17.9814,0.223913],43.6033,1,0,[-3.6593,-1.80129],"quad_12","",true,false], 
	[BCar2,[43.9668,5.47266,0.226221],127.775,1,0,[0.0693974,-6.29964],"car_6","",true,false], 
	[Bcar1,[46.835,9.50293,0.163574],128.652,1,0,[0.572303,-2.67064],"car_7","",true,false], 
	["Land_HelipadCircle_F",[-24.3809,44.4639,0],252.861,1,0,[0,0],"","",true,false], 
	["Land_HelipadCircle_F",[-1.44141,51.1455,0],252.786,1,0,[0,0],"","",true,false], 
	[BHeliLB,[-24.7451,45.4414,0.0565672],162.709,1,0,[5.8889,-3.1167],"LB_2","",true,false], 
	[BHeliLB,[-2.0332,52.3359,0.00851011],162.971,1,0,[2.5982,0.402141],"LB_1","",true,false], 
	[Bcar1,[50.6992,14.2842,0.151215],128.686,1,0,[0.155578,-1.04972],"car_8","",true,false], 
	["Land_HelipadCircle_F",[-40.8555,38.5176,0],163.809,1,0,[0,-0],"","",true,false], 
	[BHeliLB,[-41.2744,40.6553,0.201092],163.333,1,0,[11.2144,-6.24701],"Huron_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[72.2412,-20.5479,0.00589561],14.0583,1,0,[-1.76114,3.88432],"Supportsign_4","",true,false], 
	["Land_HelipadRescue_F",[68.6387,-39.9189,0],194.316,1,0,[0,0],"VVS_tank_1","",true,false], 
	[BTruckR,[79.3447,22.9385,0.156863],292.149,1,0,[-4.22458,-1.55743],"Repair_Truck_1","",true,false], 
	[BTruckF,[81.3701,27.793,0.190044],292.218,1,0,[-6.63896,0.164318],"Fuel_Truck_1","",true,false], 
	["Land_HelipadRescue_F",[62.9336,-58.7754,0],15.1959,1,0,[0,0],"VVS_air_1","",true,false], 
	["Land_HelipadEmpty_F",[83.3115,32.3721,0],292.476,1,0,[-4.87806,4.41678],"MedicalTruck_1_Marker","",true,false], 
	[BTruckA,[85.5547,37.2773,0.163724],292.109,1,0,[-4.76858,2.42712],"AmmoTruck_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[58.1953,-78.4443,0.00251484],195.117,1,0,[2.79437,1.07189],"Supportsign_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[98.6533,-29.541,0.00419569],13.8337,1,0,[3.64142,-1.06889],"Supportsign_3","",true,false], 
	["Land_HelipadRescue_F",[94.8135,-46.3906,0],194.104,1,0,[0,0],"VVS_car_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[66.7061,88.0635,0.00372887],11.1712,1,0,[-3.23408,-0.561465],"Sign_7","",true,false], 
	["Land_HelipadRescue_F",[90.9795,-66.2734,0],15.2635,1,0,[0,0],"VVS_Support_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[73.7314,86.4199,0.00197029],192.189,1,0,[2.4245,1.07098],"Sign_6","",true,false], 
	["SignAd_Sponsor_Vrana_F",[85.7393,-85.1133,0.011322],196.715,1,0,[4.60611,4.01189],"Supportsign_2","",true,false], 
	["Land_HelipadRescue_F",[54.7471,109.64,0],126.54,1,0,[0,-0],"","",true,false], 
	["B_Slingload_01_Ammo_F",[77.4844,121.37,0.0102067],312.719,1,0,[1.04996,-4.84177],"Ammo_cont","",true,false], 
	["B_Slingload_01_Ammo_F",[61.7998,133.076,0.0455036],309.765,1,0,[-7.17648,-7.64706],"Ammo_cont_1","",true,false], 
	["B_Slingload_01_Fuel_F",[81.1768,125.417,0.0142994],312.999,1,0,[4.19044,4.11637],"Fuel_cont","",true,false], 
	["B_Slingload_01_Fuel_F",[65.2842,137.215,0.000488281],309.408,1,0,[-0.729324,-0.796972],"Fuel_cont_1","",true,false], 
	["B_Slingload_01_Medevac_F",[84.9834,129.36,0.00827026],312.975,1,0,[4.10864,1.7458],"Med_cont","",true,false], 
	["B_Slingload_01_Medevac_F",[68.7246,141.5,0.0374613],309.909,1,0,[-8.86246,-3.48419],"Med_cont_1","",true,false], 
	[BBoat2,[144.442,-67.3008,0],180.602,1,0,[0,0],"car_4","",true,false], 
	["B_Slingload_01_Repair_F",[88.3818,133.515,0.0229945],312.578,1,0,[-0.712691,7.39601],"Rep_cont","",true,false], 
	["B_Slingload_01_Repair_F",[72.1182,145.342,0.0143623],309.246,1,0,[-0.275005,5.87068],"Rep_cont_1","",true,false], 
	[BBoat2,[148.783,-67.2734,0],180.602,1,0,[0,0],"car_3","",true,false], 
	["Land_HelipadEmpty_F",[98.6846,141.973,0],37.1226,1,0,[-0.789777,-4.51669],"Med_Fac_Pad","",true,false], 
	[BBoat2,[158.68,-71.957,0],180.181,1,0,[0,0],"car_2","",true,false], 
	["Land_HelipadEmpty_F",[79.0225,156.073,0],308.582,1,0,[5.17,4.51733],"Rep_Fac_Pad","",true,false], 
	[BBoat2,[165.521,-71.8174,0],180.181,1,0,[0,0],"car_1","",true,false]
];


BaseRound =
[
	["Land_HelipadEmpty_F",[-0.117188,-0.208984,0],177.779,1,0,[3.38614,-3.2625],"Respawn_pos_pad","",true,false], 
	["Land_HelipadEmpty_F",[-0.304688,-0.394531,0],296.421,1,0,[1.24117,4.5313],"Start_pos_pad","",true,false], 
	["Land_HelipadEmpty_F",[16.4492,-18.1025,0],126.595,1,0,[-1.96195,-1.45705],"Med_Fac_Pad","",true,false], 
	[BCar2,[-4.69141,-27.4932,0.171852],282.549,1,0,[-0.495924,-3.39354],"car_4","",true,false], 
	[Bquad,[-29.6035,-6.57129,0.201523],207.135,1,0,[-0.644988,-0.416384],"quad_6","",true,false], 
	["Land_HelipadEmpty_F",[31.041,1.63818,0],36.014,1,0,[-0.0161238,3.00776],"Rep_Fac_Pad","",true,false], 
	[Bquad,[-32.0234,-5.35986,0.201527],207.135,1,0,[-0.644988,-0.416384],"quad_5","",true,false], 
	[BCar2,[-6.11719,-32.3975,0.184574],282.102,1,0,[-0.154045,-5.09803],"car_2","",true,false], 
	[Bquad,[-31.6465,-10.4077,0.203979],207.138,1,0,[-1.39426,-0.628913],"quad_7","",true,false], 
	[Bquad,[-34.666,-4.19971,0.201885],207.134,1,0,[-0.850619,-0.350085],"quad_4","",true,false], 
	[Bquad,[-34.0586,-9.13037,0.201885],207.134,1,0,[-0.850619,-0.350085],"quad_8","",true,false], 
	[Bquad,[-37.168,-2.94092,0.213017],207.071,1,0,[-2.1017,2.09879],"quad_3","",true,false], 
	[Bquad,[-36.7832,-7.94971,0.213017],207.071,1,0,[-2.1017,2.09879],"quad_9","",true,false], 
	[Bcar1,[-6.86523,-37.2427,0.183891],282.136,1,0,[2.7268,-3.23861],"car_1","",true,false], 
	["Land_HelipadEmpty_F",[19.2109,33.8291,0],46.1526,1,0,[1.08006,0.0217331],"Ammo_1_marker","",true,false], 
	[Bquad,[-39.2188,-1.76514,0.214176],207.059,1,0,[-2.44091,1.92567],"quad_2","",true,false], 
	[Bquad,[-39.1992,-6.75293,0.206463],207.107,1,0,[-0.870177,1.69957],"quad_10","",true,false], 
	["Land_HelipadEmpty_F",[15.8887,37.4849,0],46.1575,1,0,[0.0572931,-0.160925],"Ammo_2_marker","",true,false], 
	["B_Slingload_01_Medevac_F",[-19.416,36.6377,0.00623322],328.394,1,0,[-2.29604,3.11484],"Med_cont_1","",true,false], 
	[Bquad,[-41.1563,-5.53564,0.205788],207.119,1,0,[-0.87052,1.6994],"quad_11","",true,false], 
	["B_Slingload_01_Fuel_F",[-24.2285,33.8501,0.00938416],328.438,1,0,[-4.22804,2.15267],"Fuel_cont_1","",true,false], 
	[Bquad,[-41.7539,-0.433594,0.214184],207.059,1,0,[-2.44091,1.92567],"quad_1","",true,false], 
	["B_Slingload_01_Repair_F",[-15.2734,39.2017,0.00527191],328.411,1,0,[-2.22195,2.79971],"Rep_cont_1","",true,false], 
	["B_Slingload_01_Ammo_F",[-28.7266,30.999,0.0058136],328.549,1,0,[-3.75361,0.149887],"Ammo_cont_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[22.9531,35.7612,0.000152588],45.7365,1,0,[0.493777,-0.587893],"Sign_1","",true,false], 
	[Bcar1,[-8.1875,-42.1577,0.19413],282.547,1,0,[2.82452,-3.90412],"car_3","",true,false], 
	["SignAd_Sponsor_Vrana_F",[20.1621,38.6221,0.0001297],45.7365,1,0,[0.493777,-0.587893],"Sign_2","",true,false], 
	[Bquad,[-43.625,-4.28027,0.205849],207.119,1,0,[-0.87052,1.6994],"quad_12","",true,false], 
	["B_Slingload_01_Repair_F",[-36.1367,26.4751,0.0202789],329.933,1,0,[-3.846,-5.8706],"Rep_cont","",true,false], 
	["SignAd_Sponsor_Vrana_F",[17.5742,41.4287,0.0001297],45.7365,1,0,[0.493777,-0.587893],"Sign_3","",true,false], 
	["B_Slingload_01_Medevac_F",[-40.4316,23.6812,0.00248337],329.756,1,0,[-1.87965,-1.55622],"Med_cont","",true,false], 
	["B_Slingload_01_Fuel_F",[-45.3262,20.9224,0.00928116],329.703,1,0,[-1.08641,-4.57564],"Fuel_cont","",true,false], 
	[BTruckA,[-11.3027,-49.2388,0.183762],315.107,1,0,[6.34813,0.0118893],"AmmoTruck_1","",true,false], 
	["Land_HelipadRescue_F",[-42.5352,-31.1167,0],239.73,1,0,[0,0],"","",true,false], 
	["B_Slingload_01_Ammo_F",[-49.8691,18.2725,0.0137482],329.933,1,0,[-5.55345,-1.54128],"Ammo_cont","",true,false], 
	["Land_HelipadEmpty_F",[-15.6426,-52.2783,0],315.406,1,0,[6.20184,-1.95386],"MedicalTruck_1_Marker","",true,false], 
	[BTruckF,[-18.6445,-56.3579,0.165672],315.035,1,0,[5.4398,-0.482779],"Fuel_Truck_1","",true,false], 
	[BTruckR,[-22.4414,-59.8477,0.151531],314.978,1,0,[4.15191,-0.703832],"Repair_Truck_1","",true,false], 
	[BCar2,[-29.5918,-65.5425,0.181297],326.042,1,0,[3.09932,-2.63997],"car_5","",true,false], 
	[BCar2,[-34.623,-68.8379,0.161785],326.16,1,0,[2.56237,0.120429],"car_6","",true,false], 
	[Bcar1,[-38.8594,-72.1934,0.226364],326.857,1,0,[5.97262,-1.9973],"car_7","",true,false], 
	[Bcar1,[-44.1641,-75.3584,0.159729],326.879,1,0,[2.27169,-0.570684],"car_8","",true,false], 
	["RoadCone_L_F",[-86.8555,-48.7241,0.00342941],324.3,1,0,[-1.15889,-1.61257],"","",true,false], 
	["RoadCone_L_F",[-96.2852,-33.0371,0.00365829],158.082,1,0,[-0.378685,2.12773],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-88.6973,-50.1143,0.00119781],144.754,1,0,[1.12778,1.7281],"Sign_4","",true,false], 
	[BHeliLB,[-100.607,-24.7529,0.0138588],260.017,1,0,[-1.94527,-2.68069],"LB_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-98.4805,-34.083,0.00141525],337.626,1,0,[0.361748,-2.13067],"Sign_5","",true,false], 
	["RoadCone_L_F",[-90.8203,-51.5859,0.00288773],324.262,1,0,[-0.785722,-1.22263],"","",true,false], 
	["Land_HelipadCircle_F",[-101.715,-24.9717,0],349.758,1,0,[0,0],"","",true,false], 
	[BHeliLB,[-104.855,-5.00293,0.012001],260.015,1,0,[-1.45676,2.73665],"LB_2","",true,false], 
	["Land_HelipadCircle_F",[-105.516,-5.45654,0],349.917,1,0,[0,0],"","",true,false], 
	[BHeliT,[-85.5098,-62.168,-0.000770569],256.044,1,0,[-2.55062,-3.29797],"Huron_1","",true,false], 
	["RoadCone_L_F",[-100.754,-34.7539,0.00364685],158.111,1,0,[-0.37976,2.12753],"","",true,false], 
	["Land_HelipadCircle_F",[-86.9863,-62.1855,0],256.356,1,0,[0,0],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-111.432,-106.545,0.0131912],227.345,1,0,[-6.25807,0.283291],"Sign_7","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-115.357,-102.345,0.0131569],234.433,1,0,[-6.24517,-0.494101],"Sign_6","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-175.943,-88.6963,0.0939674],65.068,1,0,[17.1972,-0.998172],"Supportsign_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-194.285,-43.7241,0.00895691],67.4021,1,0,[5.13334,1.82893],"Supportsign_2","",true,false], 
	["Land_HelipadRescue_F",[-176.662,-101.352,0],245.908,1,0,[0,0],"VVS_air_1","",true,false], 
	["Land_HelipadRescue_F",[-195.225,-58.1274,0],246.173,1,0,[0,0],"VVS_Support_1","",true,false], 
	["Land_HelipadRescue_F",[-194.938,-108.798,0],64.2256,1,0,[0,0],"VVS_tank_1","",true,false], 
	["Land_HelipadRescue_F",[-213.082,-67.6782,0],65.1005,1,0,[0,0],"VVS_car_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-204.154,-102.317,0.126686],243.984,1,0,[-19.4875,-2.00426],"Supportsign_4","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-222.596,-60.25,0.0399971],244.605,1,0,[-10.9351,-1.76316],"Supportsign_3","",true,false]
];

BaseSeaSide =
[
	["Land_HelipadEmpty_F",[-0.117188,-0.208984,0],177.829,1,0,[-4.04327,2.06385],"Respawn_pos_pad","",true,false], 
	["Land_HelipadEmpty_F",[-0.304688,-0.394531,0],296.394,1,0,[0.12309,-4.53479],"Start_pos_pad","",true,false], 
	["Land_HelipadEmpty_F",[-5.75708,-19.1465,0],201.256,1,0,[0.181836,1.21815],"Ammo_2_marker","",true,false], 
	["Land_HelipadEmpty_F",[-10.3188,-17.2207,0],201.253,1,0,[0.431126,0.577504],"Ammo_1_marker","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-9.18091,-21.9727,0.00295019],200.775,1,0,[-2.7639,0.829867],"Sign_2","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-5.62329,-23.4434,0.00496769],200.711,1,0,[-3.22103,2.04689],"Sign_3","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-12.8928,-20.5449,0.00128269],200.802,1,0,[-1.33791,1.37096],"Sign_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[21.0256,-15.8301,0.0046854],16.6218,1,0,[1.26069,-3.68452],"Sign_7","",true,false], 
	[BCar2,[10.0596,-26.6406,0.202754],202.353,1,0,[0.488602,5.22508],"car_5","",true,false], 
	["B_Truck_01_Repair_F",[-28.7825,-6.9668,0.115096],200.822,1,0,[-0.241371,-0.0100605],"Repair_Truck_1","",true,false], 
	[BCar2,[16.0496,-29.0117,0.164416],202.29,1,0,[1.69817,2.09898],"car_6","",true,false], 
	["SignAd_Sponsor_Vrana_F",[27.8577,-18.1387,0.0105209],197.518,1,0,[-2.42865,5.14718],"Sign_6","",true,false], 
	["B_Truck_01_fuel_F",[-33.625,-5.14844,0.131939],200.766,1,0,[-3.09298,0.623458],"Fuel_Truck_1","",true,false], 
	[Bcar1,[20.9478,-30.8203,0.163141],203.035,1,0,[1.67073,2.12087],"car_7","",true,false], 
	["Land_HelipadEmpty_F",[-38.3105,-3.53711,0],201.28,1,0,[-2.43457,-1.11264],"MedicalTruck_1_Marker","",true,false], 
	[Bcar1,[26.3708,-33.2598,0.228488],203.091,1,0,[-0.158489,6.38362],"car_8","",true,false], 
	["B_Truck_01_ammo_F",[-42.9543,-1.3125,0.123693],200.856,1,0,[-1.75355,-1.40377],"AmmoTruck_1","",true,false], 
	["RoadCone_L_F",[-16.7502,-40.2793,0.0130196],24.3716,1,0,[-4.91665,-2.81763],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-18.8892,-39.4512,0.00950813],204.827,1,0,[4.89424,2.85663],"Sign_4","",true,false], 
	["RoadCone_L_F",[-21.2751,-38.293,0.00971985],24.3621,1,0,[-3.30786,-3.42427],"","",true,false], 
	[Bquad,[-50.5107,3.41602,0.201356],198.441,1,0,[-0.676403,0.0965628],"quad_6","",true,false], 
	["RoadCone_L_F",[-39.5769,-33.4707,0.00401354],21.2315,1,0,[-0.123425,-2.42326],"","",true,false], 
	[Bquad,[-51.9392,-0.708984,0.205411],198.452,1,0,[-1.73868,-0.580284],"quad_7","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-41.6912,-32.457,0.00154543],200.765,1,0,[1.02969,2.02366],"Sign_5","",true,false], 
	[Bquad,[-53.1304,4.24023,0.201903],198.436,1,0,[-0.797172,0.458977],"quad_5","",true,false], 
	["RoadCone_L_F",[-44.042,-31.6992,0.00381517],21.2211,1,0,[-1.01356,-2.03178],"","",true,false], 
	[Bquad,[-54.5613,0.154297,0.2064],198.426,1,0,[-2.00426,0.217743],"quad_8","",true,false], 
	[Bquad,[-55.8931,5.00391,0.201902],198.436,1,0,[-0.797172,0.458977],"quad_4","",true,false], 
	[Bquad,[-57.2993,0.931641,0.2064],198.426,1,0,[-2.00426,0.217743],"quad_9","",true,false], 
	[Bquad,[-58.439,5.88672,0.20251],198.433,1,0,[-0.990357,0.555659],"quad_3","",true,false], 
	["Land_HelipadCircle_F",[-24.2129,-53.7305,0],110.54,1,0,[0,-0],"","",true,false], 
	[BHeliLB,[-24.4126,-54.3047,0.0348864],20.9432,1,0,[-3.37582,-3.98641],"LB_2","",true,false], 
	[Bquad,[-59.8999,1.79883,0.202535],198.433,1,0,[-0.990357,0.555659],"quad_10","",true,false], 
	["Land_HelipadCircle_F",[-4.22949,-59.9902,0],22.0749,1,0,[0,0],"","",true,false], 
	[Bquad,[-60.7029,6.74219,0.20582],198.415,1,0,[-1.27967,1.42547],"quad_2","",true,false], 
	[Bquad,[-61.229,2.57617,0.171477],192.157,1,0,[5.85846,-36.3879],"quad_11","",true,false], 
	[BHeliT,[-5.07813,-61.3691,0.0182304],21.7434,1,0,[-1.20862,-2.94688],"Huron_1","",true,false], 
	[Bquad,[-63.2336,7.53516,0.205821],198.415,1,0,[-1.27967,1.42547],"quad_1","",true,false], 
	["Land_HelipadCircle_F",[-46.4402,-44.9688,0],110.53,1,0,[0,-0],"","",true,false], 
	[Bquad,[-64.7539,3.4707,0.216597],198.35,1,0,[-2.62824,2.10472],"quad_12","",true,false], 
	["SignAd_Sponsor_Vrana_F",[64.9253,4.4375,0.0173616],337.371,1,0,[-2.04531,-7.05669],"Supportsign_4","",true,false], 
	[BHeliLB,[-46.75,-45.9434,0.0227137],20.8526,1,0,[-3.19232,-2.76834],"LB_1","",true,false], 
	["Land_HelipadRescue_F",[73.6362,-13.1992,0],157.428,1,0,[0,-0],"VVS_tank_1","",true,false], 
	["B_Slingload_01_Medevac_F",[-6.95557,83.9258,0.000431061],354.614,1,0,[-0.321387,-0.967139],"Med_cont","",true,false], 
	["B_Slingload_01_Fuel_F",[-12.4502,83.4941,0.00028038],354.614,1,0,[0.796377,0.308574],"Fuel_cont","",true,false], 
	["B_Slingload_01_Repair_F",[-1.78027,84.6367,0.000442505],354.614,1,0,[-0.321387,-0.967139],"Rep_cont","",true,false], 
	["B_Slingload_01_Ammo_F",[-17.6643,82.8672,0.00119877],354.634,1,0,[1.11724,1.27597],"Ammo_cont","",true,false], 
	["Land_HelipadEmpty_F",[11.7283,84.1113,0],78.7299,1,0,[3.59124,-0.327105],"Med_Fac_Pad","",true,false], 
	["Land_HelipadRescue_F",[80.406,-31.7441,0],338.298,1,0,[0,0],"VVS_air_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[91.4497,13.0957,0.0124493],337.007,1,0,[-0.569506,-6.20698],"Supportsign_3","",true,false], 
	["Land_HelipadRescue_F",[98.4888,-2.69922,0],157.389,1,0,[0,-0],"VVS_car_1","",true,false], 
	["Land_HelipadRescue_F",[-42.5784,89.25,0],168.385,1,0,[0,-0],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[88.4045,-50.3066,0.00744534],158.236,1,0,[0.933056,4.79844],"Supportsign_1","",true,false], 
	["B_Slingload_01_Medevac_F",[-10.8298,103.498,0.000331879],351.15,1,0,[0.684295,-0.570415],"Med_cont_1","",true,false], 
	["B_Slingload_01_Fuel_F",[-16.3442,102.785,6.29425e-005],351.157,1,0,[-0.389171,-0.0167678],"Fuel_cont_1","",true,false], 
	["B_Slingload_01_Ammo_F",[-21.4897,101.922,0.00113869],351.134,1,0,[-1.21719,1.11758],"Ammo_cont_1","",true,false], 
	["B_Slingload_01_Repair_F",[-6.02295,104.268,0.00128365],351.138,1,0,[0.50767,-1.70231],"Rep_cont_1","",true,false], 
	["Land_HelipadEmpty_F",[6.45825,107.721,0],350.126,1,0,[0.346527,-2.46262],"Rep_Fac_Pad","",true,false], 
	["Land_HelipadRescue_F",[107.34,-20.9023,0],338.241,1,0,[0,0],"VVS_Support_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[114.436,-39.125,0.0041275],159.582,1,0,[0.60826,3.60007],"Supportsign_2","",true,false], 
	[BBoat1,[-146.595,4.21289,7.15256e-007],271.126,1,0,[0,-0],"car_2","",true,false], 
	[BBoat1,[-146.167,12.5527,1.19209e-006],271.547,1,0,[0,-0],"car_3","",true,false], 
	[BBoat1,[-147.41,-6.26758,4.76837e-007],271.126,1,0,[0,-0],"car_1","",true,false], 
	[BBoat1,[-146.049,21.9844,9.53674e-007],271.547,1,0,[0,-0],"car_4","",true,false]
];

BaseHawk =
[
	[BHeliLB,[114.979,-28.3086,0.00787544],311.011,1,0,[1.53863,-2.00177],"LB_2","",true,false], 
	[BHeliLB,[98.4902,-43.0361,0.0178213],310.994,1,0,[2.7993,-2.52305],"LB_1","",true,false], 
	[BHeliT,[130.654,-11.3193,0.0161095],312.01,1,0,[2.58681,1.91959],"Huron_1","",true,false], 
	[BCar2,[135.008,-65.0801,0.195312],40.5409,1,0,[3.29045,-3.61144],"car_1","",true,false], 
	[BCar2,[139.484,-68.7295,0.149161],40.6512,1,0,[-0.0333786,0.273412],"car_2","",true,false], 
	[BCar1,[141.773,-57.3574,0.155382],41.0514,1,0,[-1.49926,1.02391],"car_4","",true,false], 
	[BCar1,[143.541,-72.415,0.149824],41.0746,1,0,[0.310137,0.574304],"car_3","",true,false], 
	[BCar3,[150.133,-76.6123,0.149944],354.623,1,0,[0.579813,-0.361494],"car_8","",true,false], 
	[BCar3,[160.293,-60.5869,0.174171],305.537,1,0,[1.89974,-3.05207],"car_5","",true,false], 
	[BCar3,[160.75,-67.0332,0.152813],305.601,1,0,[0.984571,0.986746],"car_6","",true,false], 
	[BCar3,[157.814,-71.3828,0.156148],306.342,1,0,[0.962488,1.65614],"car_7","",true,false], 
	[BBoat1,[-39.5527,36.5762,-0.0084486],126.465,1,0,[0,0],"quad_10","",true,false], 
	[BBoat1,[-43.0039,32.0752,-0.00384665],126.465,1,0,[0,0],"quad_11","",true,false], 
	[BBoat2,[-43.9863,22.6924,0.187301],130.208,1,0,[24.7535,8.56277],"quad_12","",true,false], 
	[Bquad,[28.7539,-1.11523,0.218945],144.489,1,0,[0.862981,-3.52079],"quad_1","",true,false], 
	[Bquad,[30.873,0.453125,0.213988],144.511,1,0,[0.775098,-2.98942],"quad_2","",true,false], 
	[Bquad,[32.8848,1.72559,0.21314],144.511,1,0,[0.775098,-2.98942],"quad_3","",true,false], 
	[Bquad,[35.2383,3.36328,0.258254],144.311,1,0,[1.51945,-6.24011],"quad_4","",true,false], 
	[Bquad,[37.4766,4.89648,0.225415],144.659,1,0,[-2.67775,-3.24718],"quad_5","",true,false], 
	[Bquad,[39.6406,6.45996,0.220373],144.66,1,0,[-2.8043,-2.50357],"quad_6","",true,false], 
	[Bquad,[73.1777,-60.3896,0.21688],47.0906,1,0,[3.38713,0.394057],"quad_7","",true,false], 
	[Bquad,[75.0254,-62.3955,0.21688],47.0906,1,0,[3.38713,0.394057],"quad_8","",true,false], 
	[BBoat2,[-41.6387,25.3066,0.319528],123.237,1,0,[15.209,-2.30428],"quad_9","",true,false], 
	["B_Slingload_01_Ammo_F",[62.1875,-22.8408,0.00648403],321.454,1,0,[-3.92028,0.588736],"Ammo_cont","",true,false], 
	["B_Slingload_01_Ammo_F",[97.5254,7.44531,0.0160103],319.431,1,0,[-5.56572,-2.76031],"Ammo_cont_1","",true,false], 
	["B_Slingload_01_Fuel_F",[101.596,11.0088,0.00896549],319.048,1,0,[-2.85861,3.69153],"Fuel_cont_1","",true,false], 
	["B_Slingload_01_Fuel_F",[66.2129,-19.4141,0.0109482],321.408,1,0,[-4.81081,1.7953],"Fuel_cont","",true,false], 
	["B_Slingload_01_Medevac_F",[105.801,14.5029,0.00490475],319.222,1,0,[-3.41774,0.12654],"Med_cont_1","",true,false], 
	["B_Slingload_01_Medevac_F",[70.5938,-16.1436,0.0038414],321.471,1,0,[-2.96661,-0.662939],"Med_cont","",true,false], 
	["B_Slingload_01_Repair_F",[109.473,17.6758,0.00696945],319.267,1,0,[-3.04439,-2.71712],"Rep_cont_1","",true,false], 
	["B_Slingload_01_Repair_F",[74.543,-12.7178,0.00390625],321.473,1,0,[-2.95443,-0.770395],"Rep_cont","",true,false], 
	[BTruckR,[64.3926,54.6279,0.155576],142.498,1,0,[4.34106,0.8993],"Repair_Truck_1","",true,false], 
	[BTruckA,[52.084,46.0254,0.348208],142.271,1,0,[10.79,-4.47901],"AmmoTruck_1","",true,false], 
	[BTruckF,[60.0332,51.5498,0.215623],142.751,1,0,[6.34433,4.45625],"Fuel_Truck_1","",true,false], 
	["Land_CamoNetVar_NATO",[23.5566,-14.5137,0.0386171],307.654,1,0,[-3.23239,5.30389],"","",true,false], 
	["Land_GuardShed",[222.617,-17.7051,-0.0592041],315.291,1,0,[3.67205,-0.737561],"","",true,false],
	["Land_HelipadCircle_F",[114.279,-27.8525,0],40.8963,1,0,[0,0],"","",true,false], 
	["Land_HelipadCircle_F",[129.053,-10.1611,0],312.311,1,0,[0,0],"","",true,false], 
	["Land_HelipadCircle_F",[97.4512,-42.2207,0],40.9494,1,0,[0,0],"","",true,false], 
	["Land_HelipadEmpty_F",[0.0234375,-0.283203,0],296.482,1,0,[-3.81809,1.84979],"Start_pos_pad","",true,false], 
	["Land_HelipadEmpty_F",[0.210938,-0.0976563,0],178.121,1,0,[3.44056,2.48424],"Respawn_pos_pad","",true,false], 
	["Land_HelipadEmpty_F",[117.379,26.8428,0],318.181,1,0,[-4.12497,1.33905],"Rep_Fac_Pad","",true,false], 
	["Land_HelipadEmpty_F",[20.9316,-15.7334,0],135.605,1,0,[3.89228,-0.823116],"Ammo_1_marker","",true,false], 
	["Land_HelipadEmpty_F",[24.543,-12.3574,0],135.369,1,0,[3.91449,-4.82513],"Ammo_2_marker","",true,false], 
	["Land_HelipadEmpty_F",[45.5566,-28.0078,0],232.43,1,0,[-0.633379,3.1827],"Med_Fac_Pad","",true,false], 
	["Land_HelipadEmpty_F",[56.7715,48.0605,0],143.422,1,0,[10.4338,1.39796],"MedicalTruck_1_Marker","",true,false], 
	["Land_HelipadRescue_F",[107.898,-95.3184,0],320.074,1,0,[0,0],"VVS_Support_1","",true,false], 
	["Land_HelipadRescue_F",[120.248,-108.961,0],319.947,1,0,[0,0],"VVS_air_1","",true,false], 
	["Land_HelipadRescue_F",[123.893,-81.4463,0],320.022,1,0,[0,0],"VVS_car_1","",true,false], 
	["Land_HelipadRescue_F",[136.795,-94.9639,0],316.192,1,0,[0,0],"VVS_tank_1","",true,false], 
	["Land_HelipadRescue_F",[62.4375,-50.0313,0],136.414,1,0,[0,-0],"","",true,false], 
	["Land_Sun_chair_F",[14.7344,11.1104,0],319.819,1,0,[-1.29028,0],"","",true,false], 
	["Land_fortified_nest_big",[207.186,-25.3398,-0.202939],317.088,1,0,[4.23836,-0.818117],"","",true,false], 
	["RoadCone_L_F",[100.832,-19.6885,0.00460148],314.529,1,0,[-2.58752,0.453425],"","",true,false], 
	["RoadCone_L_F",[104.266,-16.1348,0.0124779],314.603,1,0,[-5.43085,1.28003],"","",true,false], 
	["RoadCone_L_F",[85.8555,-35.3311,0.00254154],311.493,1,0,[-0.822973,0.699846],"","",true,false], 
	["RoadCone_L_F",[89.0449,-31.7139,0.00882435],311.496,1,0,[-3.80167,2.3425],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[102.721,-17.8887,0.00923061],135.059,1,0,[5.44078,-1.23663],"Sign_4","",true,false], 
	["SignAd_Sponsor_Vrana_F",[115.457,-72.0195,0.000491142],144.989,1,0,[0.331278,-1.25786],"Supportsign_3","",true,false], 
	["SignAd_Sponsor_Vrana_F",[129.646,-119.185,0.0041647],145.057,1,0,[-3.47529,-0.178198],"Supportsign_2","",true,false], 
	["SignAd_Sponsor_Vrana_F",[145.564,-104.273,0.0220823],137.014,1,0,[-8.15411,-0.180575],"Supportsign_4","",true,false], 
	["SignAd_Sponsor_Vrana_F",[219.25,-18.3711,0.00399685],321.703,1,0,[3.6935,-0.000430128],"Sign_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[25.7344,-16.6563,0.0172749],135.305,1,0,[7.41966,-1.25655],"Sign_2","",true,false], 
	["SignAd_Sponsor_Vrana_F",[28.5664,-14.0186,0.0283537],134.834,1,0,[7.39539,-6.15595],"Sign_3","",true,false], 
	["SignAd_Sponsor_Vrana_F",[79.623,-9.74316,0.00842381],226.887,1,0,[-2.83943,4.2226],"Sign_6","",true,false], 
	["SignAd_Sponsor_Vrana_F",[87.3691,-33.4268,0.00592613],131.011,1,0,[3.78176,-2.37462],"Sign_5","",true,false], 
	["SignAd_Sponsor_Vrana_F",[91.748,3.1416,0.0146999],49.7073,1,0,[5.14052,-4.66024],"Sign_7","",true,false], 
	["SignAd_Sponsor_Vrana_F",[98.0059,-85.6719,0.0124922],142.643,1,0,[-6.04889,-0.651212],"Supportsign_1","",true,false]
];

BasePenin =
[
	["Land_HelipadEmpty_F",[-0.117188,-0.208984,0],177.894,1,0,[-1.33517,3.18012],"Respawn_pos_pad","",true,false], 
	["Land_HelipadEmpty_F",[-0.304688,-0.394531,0],296.479,1,0,[-2.15542,-2.69377],"Start_pos_pad","",true,false], 
	["Land_HelipadEmpty_F",[-25.3623,15.3711,0],0.765836,1,0,[-2.36157,-0.413584],"Ammo_1_marker","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-24.1104,19.3857,0.0026803],0.331026,1,0,[-2.74804,-0.0158892],"Sign_1","",true,false], 
	["Land_HelipadEmpty_F",[-30.3145,15.5693,0],0.70258,1,0,[-2.38073,1.11665],"Ammo_2_marker","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-28.1035,19.416,0.00268078],0.331026,1,0,[-2.74804,-0.0158892],"Sign_2","",true,false], 
	[BCar2,[-34.9219,-4.26855,0.160394],88.7664,1,0,[-1.04048,-2.19247],"car_8","",true,false], 
	[BCar2,[-34.7109,-10.457,0.177336],88.7673,1,0,[-1.75369,-3.39681],"car_7","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-31.9395,19.5459,0.00242662],0.283518,1,0,[-2.37251,1.13403],"Sign_3","",true,false], 
	[Bcar1,[-34.416,-15.7217,0.161525],88.0218,1,0,[-0.771479,-2.41799],"car_6","",true,false], 
	["B_Truck_01_ammo_F",[-0.0380859,-39.4219,0.133114],179.832,1,0,[0.601709,-3.20699],"AmmoTruck_1","",true,false], 
	["Land_HelipadEmpty_F",[4.96973,-39.9824,0],180.069,1,0,[5.71333,-2.2837],"MedicalTruck_1_Marker","",true,false], 
	[Bcar1,[-34.1172,-21.7773,0.200483],88.025,1,0,[-2.37336,-4.57122],"car_5","",true,false], 
	["B_Truck_01_fuel_F",[9.93457,-39.7119,0.121932],179.852,1,0,[-1.98447,0.38708],"Fuel_Truck_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[41.96,-2.9541,0.0021534],268.7,1,0,[0.24658,-2.60188],"Sign_6","",true,false], 
	["SignAd_Sponsor_Vrana_F",[41.917,4.25684,0.000797272],87.7022,1,0,[1.34336,1.09279],"Sign_7","",true,false], 
	["B_Truck_01_Repair_F",[15.6221,-39.6328,0.318074],179.781,1,0,[1.56366,-10.4317],"Repair_Truck_1","",true,false], 
	[Bquad,[-46.2676,-31.9307,0.261131],142.638,1,0,[1.88538,-6.31617],"quad_6","",true,false], 
	[Bquad,[-43.7568,-35.457,0.246115],142.705,1,0,[1.82323,-5.4063],"quad_7","",true,false], 
	[Bquad,[-48.3984,-33.6328,0.252958],142.69,1,0,[1.40539,-5.94827],"quad_5","",true,false], 
	[Bquad,[-45.8975,-37.0908,0.252957],142.69,1,0,[1.40539,-5.94827],"quad_8","",true,false], 
	[Bquad,[-50.6172,-35.5283,0.241013],142.741,1,0,[1.30889,-5.20475],"quad_4","",true,false], 
	[Bquad,[-48.0938,-38.9277,0.240946],142.741,1,0,[1.30889,-5.20475],"quad_9","",true,false], 
	["B_Heli_Transport_03_F",[-63.2363,-10.3926,0.0146503],180.435,1,0,[2.44828,-0.668926],"Huron_1","",true,false], 
	["Land_HelipadCircle_F",[-63.2969,-12.3789,0],180.771,1,0,[0,0],"","",true,false], 
	[Bquad,[-52.8701,-37.0938,0.231669],142.769,1,0,[2.05034,-4.23751],"quad_3","",true,false], 
	[Bquad,[-50.2412,-40.6211,0.238245],142.757,1,0,[1.128,-5.06679],"quad_10","",true,false], 
	[Bquad,[-54.71,-38.3174,0.274981],142.565,1,0,[2.39024,-6.89649],"quad_2","",true,false], 
	[Bquad,[-52.1357,-41.8838,0.24648],142.7,1,0,[1.19534,-5.59858],"quad_11","",true,false], 
	[Bquad,[-56.8076,-40.083,0.249722],142.718,1,0,[1.01207,-5.83894],"quad_1","",true,false], 
	[Bquad,[-54.333,-43.54,0.249721],142.718,1,0,[1.01207,-5.83894],"quad_12","",true,false], 
	["RoadCone_L_F",[-68.0508,-45.7871,0.00466919],174.136,1,0,[2.73947,-0.972622],"","",true,false], 
	["Land_HelipadCircle_F",[-75.9717,-32.6777,0],263.47,1,0,[0,0],"","",true,false], 
	[BHeliLB,[-76.8076,-31.3838,0.157017],174.271,1,0,[3.51849,10.5064],"LB_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-70.4668,-46.2256,0.00512505],353.621,1,0,[-3.40302,1.84081],"Sign_5","",true,false], 
	["RoadCone_L_F",[-72.8145,-46.2305,0.00677967],174.106,1,0,[3.41844,-1.81191],"","",true,false], 
	[BBoat1,[-16.6123,87.7305,2.34842e-005],353.57,1,0,[0,-0],"car_2","",true,false], 
	[BBoat2,[3.4502,89.5977,1.14441e-005],353.991,1,0,[0,-0],"car_4","",true,false], 
	[BBoat1,[-37.2402,86.5,-2.88486e-005],353.57,1,0,[0,-0],"car_1","",true,false], 
	[BBoat2,[-53.7695,84.9141,-2.5034e-005],353.991,1,0,[0,-0],"car_3","",true,false], 
	[BHeliLB,[-95.791,-34.2725,0.0392132],173.459,1,0,[3.24558,-4.51547],"LB_2","",true,false], 
	["Land_HelipadCircle_F",[-95.7119,-35.2178,0],263.547,1,0,[0,0],"","",true,false], 
	["RoadCone_L_F",[-91.3643,-50.25,0.00296116],177.208,1,0,[1.63171,0.532256],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-93.9502,-50.3496,0.00110054],357.691,1,0,[-1.62716,-0.546015],"Sign_4","",true,false], 
	["RoadCone_L_F",[-96.2676,-50.4658,0.00477791],177.182,1,0,[2.8633,-0.829357],"","",true,false], 
	["Land_HelipadEmpty_F",[-158.548,-42.0664,0],1.973,1,0,[-5.86627,-2.18916],"Rep_Fac_Pad","",true,false], 
	["Land_HelipadEmpty_F",[-158.135,-66.2451,0],90.3608,1,0,[-2.12023,-2.83768],"Med_Fac_Pad","",true,false], 
	["B_Slingload_01_Repair_F",[-171.359,-42.8516,0.00673008],2.62457,1,0,[-3.02656,2.68872],"Rep_cont_1","",true,false], 
	["B_Slingload_01_Medevac_F",[-176.363,-42.627,0.00466061],2.85417,1,0,[-2.81344,-1.82252],"Med_cont_1","",true,false], 
	["B_Slingload_01_Repair_F",[-171.206,-62.9736,0.00269794],6.16378,1,0,[-1.94303,1.63377],"Rep_cont","",true,false], 
	["B_Slingload_01_Fuel_F",[-181.807,-42.21,0.0101833],2.64945,1,0,[-4.79082,1.30708],"Fuel_cont_1","",true,false], 
	["B_Slingload_01_Medevac_F",[-176.445,-62.6738,5.53131e-005],6.21831,1,0,[-0.26093,0.278953],"Med_cont","",true,false], 
	["B_Slingload_01_Ammo_F",[-187.095,-42.0498,0.00508785],2.7534,1,0,[-3.52033,0.136414],"Ammo_cont_1","",true,false], 
	["B_Slingload_01_Fuel_F",[-181.929,-61.9551,8.7738e-005],6.21936,1,0,[-0.0496567,0.455655],"Fuel_cont","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-192.799,-36.0713,0.0239267],2.98868,1,0,[-8.48592,-0.36981],"Supportsign_3","",true,false], 
	["B_Slingload_01_Ammo_F",[-187.204,-61.5029,8.7738e-005],6.21936,1,0,[-0.0496567,0.455655],"Ammo_cont","",true,false], 
	["Land_HelipadRescue_F",[-197.968,-5.58496,0],181.561,1,0,[0,0],"","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-191.509,-68.835,0.000335693],185.471,1,0,[1.17695,-0.270978],"Supportsign_2","",true,false], 
	["Land_HelipadRescue_F",[-203.794,-40.9951,0],183.507,1,0,[0,0],"VVS_car_1","",true,false], 
	["Land_HelipadRescue_F",[-203.771,-61.2373,0],4.2311,1,0,[0,0],"VVS_Support_1","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-238.591,-32.5732,0.0408115],2.99157,1,0,[-11.5799,0.686893],"Supportsign_4","",true,false], 
	["SignAd_Sponsor_Vrana_F",[-239.799,-63.9111,0.000818253],184.126,1,0,[-1.45841,0.0479547],"Supportsign_1","",true,false], 
	["Land_HelipadRescue_F",[-248.628,-37.6904,0],182.84,1,0,[0,0],"VVS_tank_1","",true,false], 
	["Land_HelipadRescue_F",[-250.65,-57.3213,0],4.31627,1,0,[0,0],"VVS_air_1","",true,false]
];

//////////////////////////////////////////////////////////////////////

BASETYPE = Base1;
if (rndBase == StadBase) then {BASETYPE = BaseStad};
if (rndBase == HillBase1) then {BASETYPE = BaseHill1};
if (rndBase == CapBase) then {BASETYPE = Basecap};
if (rndBase == BeachBase) then {BASETYPE = BaseBeach};
if (rndBase == RoundBase) then {BASETYPE = BaseRound};
if (rndBase == SeaSide) then {BASETYPE = BaseSeaSide};
if (rndBase == Hawk_Base) then {BASETYPE = BaseHawk};
if (rndBase == Penin) then {BASETYPE = BasePenin};

		
		0 = [getPosATL rndBase, getdir rndBase, BASETYPE] call BIS_fnc_ObjectsMapper;

waituntil {!isNil "VVS_tank_1"};
BaseCreated = true;publicVariable "BaseCreated";
diag_log format ["BaseCreated = %1",BaseCreated];


  