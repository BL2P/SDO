waitUntil {!isNull player && player == player};
if(player diarySubjectExists "Server rules")exitwith{};

player createDiarySubject ["Falcons","Information"];
	
player createDiaryRecord 
	["Falcons",
		[
			"Information", 
				"
				Feel free to join us on TeamSpeak 3 at<br/>
				ts.sulcorp.com<br/><br/>
				Or on our web site at<br/>
				https://fluitarma.wordpress.com/the-falcons/server-info/<br/>
				"
		]
	];	
