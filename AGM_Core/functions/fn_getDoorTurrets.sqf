/*
 * Author: jodav
 *
 * Gets the turret index of door gunners
 * 
 * Argument:
 * 0: Vehicle type (String)
 * 
 * Return value:
 * Turret indexes of the door gunner. Empty array means no gunner position. (Array)
 */

private ["_vehicleType", "_turrets", "_doorTurrets", "_config"];

_vehicleType = _this select 0;

_turrets = [_vehicleType] call AGM_Core_fnc_getTurrets;

_doorTurrets = [];

{
  _config = configFile >> "CfgVehicles" >> _vehicleType;
  _config = [_config, _x] call AGM_Core_fnc_getTurretConfigPath;

  if ((getNumber (_config >> "isCopilot") == 0) && count (getArray (_config >> "weapons")) > 0 ) then {
    _doorTurrets pushBack _x;
  };
} forEach _turrets;

_doorTurrets
