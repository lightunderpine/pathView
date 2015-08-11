// isActive(Beacon, Pedestorian) -> T or F
boolean isActive(Beacon _beacon, Pedestorian _pedestorian) {
  if (distance(_beacon, _pedestorian) < detectRegion) {
    return true;
  } 
  else {
    return false;
  }
}

// distance from a Beacon and a Pedestorian
// distance(Beacon, Pedestorian) -> float
float distance(Beacon _beacon, Pedestorian _pedestorian) {
  return sqrt(
  (_pedestorian.posX - _beacon.posX) * (_pedestorian.posX - _beacon.posX)
    + (_pedestorian.posY - _beacon.posY) * (_pedestorian.posY - _beacon.posY)
    );
}

