waitUntil {!isNull player && player == player};
if(player diarySubjectExists "Server rules")exitwith{};

player createDiarySubject ["Falcons","Information"];
	
player createDiaryRecord 
	["Falcons",
		[
			"Information", 
"
            <img image='core\Signs\Header.paa'  width='200' height='100'></img><br/><br/>
<font face ='EtelkaNarrowMediumPro'  size = '15'>Feel free to join us on TeamSpeak<br/>
ts.sulcorp.com<br/>
The TeamSpeak is Provided by BlitzerNL<br/><br/>
Info found in the Falcons Nest channel description<br/>
Or on our web site :-<br/>
https://fluitarma.wordpress.com/the-falcons/server-info<br/>
Web Provided by Fluit<br/><br/>
The Server is Provided by Fumbles<br/><br/>
The Falcons is a like minded group of friends who play Coop based mil sim Arma. The group was formed as somewhere for us all to play the mission type and game style we prefer. We will not tolerate people who Meta Game, Exploit or simply disrupt the Falcons group as a whole<br/>
Rules :<br/>
1. Dont be a dick<br/>
2. Have fun<br/><br/></font>
"
		]
	];	
