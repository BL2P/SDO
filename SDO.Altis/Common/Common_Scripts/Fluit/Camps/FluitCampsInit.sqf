diag_log "***Fluit camps are initializing...";

_scriptHandle = [] execVM "Common\Common_Scripts\Fluit\Camps\FluitSAM.sqf"; 
waitUntil {scriptDone _scriptHandle};
_scriptHandle = [] execVM "Common\Common_Scripts\Fluit\Camps\FluitHMG.sqf"; 
waitUntil {scriptDone _scriptHandle};
_scriptHandle = [] execVM "Common\Common_Scripts\Fluit\Camps\FluitAT.sqf"; 
waitUntil {scriptDone _scriptHandle};
_scriptHandle = [] execVM "Common\Common_Scripts\Fluit\Camps\FluitAA.sqf"; 
waitUntil {scriptDone _scriptHandle};
_scriptHandle = [] execVM "Common\Common_Scripts\Fluit\Camps\FluitMortar.sqf"; 
waitUntil {scriptDone _scriptHandle};
_scriptHandle = [] execVM "Common\Common_Scripts\Fluit\Camps\FluitRoadblock.sqf"; 
waitUntil {scriptDone _scriptHandle};

diag_log "***Done initializing Fluit camps!";