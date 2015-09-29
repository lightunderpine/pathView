// Beacon の設定
class Beacon {
  int posX;
  int posY;
  int ID;
  String name;
  private int detectRegion = 25; //Beacon の検出半径
  private int beaconRadius = 8; //Beacon 本体の半径
  private int beaconRelationRadius = 15;
  private int beaconRelationDegree = 0;
  private int accumulatedEncount=0; //累積(accumulated)のエンカウント数


  //Beacon(X座標, Y座標, 名前)
  Beacon(int _posX, int _posY, int _ID) {
    posX = _posX;
    posY = _posY;
    ID = _ID;
    name = "beacon"+ID;
  }

  //検出範囲にいる歩行者の数を返す
  int pedestorianDetect() {
    int currentDetect = 0;
    for (int i=0; i<pedestorianNum; i++) {
      if (isActive(this, aPedestorian[i], detectRegion)) {
        currentDetect++;
      }
    }
    return currentDetect;
  }


  void display(int encount) {
    //    // BeaconAcitivateRegion
    //    strokeWeight(1);
    //    fill(255, 255 - 40*encount, 255-40*encount);
    //    ellipse(posX, posY, detectRegion, detectRegion);
    //    fill(myColor);
    accumulatedEncount += encount;
    //beaconRelationDegree += encount;
    strokeWeight(0);
    float tmp = max(0, beaconRelationDegree - accumulatedEncount);
    fill (color(255-tmp, 255, 255-tmp));
    ellipse(posX, posY, beaconRelationRadius, beaconRelationRadius);

    float decColor = max(255-0.8*accumulatedEncount, 0);
    strokeWeight(2);
    fill(255, decColor, decColor);
    ellipse(posX, posY, beaconRadius, beaconRadius);
    fill(0);
    textFont(font, 14);
    text(ID, posX-4, posY-10);
  }
}

