if (isServer) exitwith {diag_log "***I was kicked from 3CB_VA.sqf";};
diag_log "***READING VA_3CB.SQF ****====////";

/////////////////////////////////////////////////////////////////

			CB_Weapons_ATs =
				[
					"UK3CB_BAF_AT4_AT_Launcher",
					"UK3CB_BAF_AT4_AP_Launcher",
					"UK3CB_BAF_AT4_CS_AT_Launcher",  
					"UK3CB_BAF_AT4_CS_AP_Launcher",
					"UK3CB_BAF_NLAW_Launcher",
					"UK3CB_BAF_Javelin_Launcher",
					"UK3CB_BAF_Javelin_Slung_Tube"
				];

/////////////////////////////////////////////////////////////////	

/////////////////////////////////////////////////////////////////
GrenadierItems = GrenadierItems+
	[
	"UK3CB_BAF_AT4_AP_Launcher"
	];

/////////////////////////////////////////////////////////////////			
/////////////////////////////////////////////////////////////////
ATItems = ATItems+
	[
		"UK3CB_BAF_AT4_AP_Launcher",
		"UK3CB_BAF_Javelin_CLU"
	] + CB_Weapons_ATs;

/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
EODItems = EODItems+
	[
		"UK3CB_BAF_AT4_AP_Launcher"
	];
				
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
RifelmanItems = RifelmanItems+
	[	
	"UK3CB_BAF_AT4_AP_Launcher"
	] ;
				
/////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////
	
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
ReconItems = ReconItems+
	[	
	"UK3CB_BAF_AT4_AP_Launcher"
	];
/////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////
RconExp = RconExp+
	[		
		"UK3CB_BAF_AT4_AP_Launcher"
	];
