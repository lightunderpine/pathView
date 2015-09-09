// Beacon の設定
class Beacon {
  int posX;
  int posY;
  int ID;
  int beaconRadius = 8; //Beacon 本体の半径
  int accumulatedEncount=0; //累積(accumulated)のエンカウント数
  
//  color myColor = color(random(255), 100+random(155), random(128));
  String name;

  //Beacon(X座標, Y座標, 名前)
  Beacon(int _posX, int _posY, int _ID) {
    posX = _posX;
    posY = _posY;
    ID = _ID;
    name = "beacon"+ID;
  }


  void display(int encount) {
    // BeaconAcitivateRegion
//    strokeWeight(1);
//    fill(255, 255 - 40*encount, 255-40*encount);
//    ellipse(posX, posY, detectRegion, detectRegion);
//    fill(myColor);
  accumulatedEncount += encount;
  float decColor = max(255-0.8*accumulatedEncount, 0);
    strokeWeight(2);
    fill(255, decColor, decColor);
    ellipse(posX, posY, beaconRadius, beaconRadius);
    fill(0);
     textFont(font, 14);
    text(ID, posX-4, posY-10);
  }
}

