/***************************************************************
                 FLUIT IS BEING INITIALIZED
 **************************************************************/
diag_log "***Fluit is initializing...";
 
// Initialze common functions
_scriptHandle = [] execVM "Common\Common_Scripts\Fluit\FluitFunctions.sqf"; 
waitUntil {scriptDone _scriptHandle};

// Initialze camp functions
_scriptHandle = [] execVM "Common\Common_Scripts\Fluit\Camps\FluitCampsInit.sqf"; 
waitUntil {scriptDone _scriptHandle};

fluitfunctions = true; publicVariable "fluitfunctions"; // waitUntil {!isNil "fluitfunctions"}; to check if functions are loaded

diag_log "***Fluit is successfully initialized!";
/***************************************************************
                 FLUIT SUCCESSFULLY INITIALIZED
 **************************************************************/