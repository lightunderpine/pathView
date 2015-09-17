// isActive(Beacon, Pedestorian) -> True or False
boolean isActive(Beacon _beacon, Pedestorian _pedestorian, int _detectRegion) {
  if (distance(_beacon, _pedestorian) < _detectRegion) {
    return true;
  } else {
    return false;
  }
}

// distance from a Beacon and a Pedestorian
// distance(Beacon, Pedestorian) -> float
float distance(Beacon _beacon, Pedestorian _pedestorian) {
  return sqrt(
  pow(_pedestorian.posX - _beacon.posX, 2)
    + pow(_pedestorian.posY - _beacon.posY, 2));
}

// distance between two beacons
// distance(Beacon, Beacon) -> float
float distance(Beacon _beacon1, Beacon _beacon2) {
  return sqrt(
  pow(_beacon1.posX - _beacon2.posX, 2)
    + pow(_beacon1.posY - _beacon2.posY, 2));
}

