// Beacon の設定
class Beacon {
  int posX;
  int posY;
  int beaconRadius = 10; //Beacon 本体の半径
  color myColor = color(random(255), 100+random(155), random(128));
  String name;

  //Beacon(X座標, Y座標, 名前)
  Beacon(int _posX, int _posY, String _name) {
    posX = _posX;
    posY = _posY;
    name = _name;
  }


  void display(int encount) {
    strokeWeight(1);
    fill(255, 255 - 40*encount, 255-40*encount);
    ellipse(posX, posY, detectRegion, detectRegion);
    fill(myColor);
    strokeWeight(0);
    ellipse(posX, posY, beaconRadius, beaconRadius);
  }
}

