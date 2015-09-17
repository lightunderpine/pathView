// パネルの初期描画用関数
//class Panel{
void panelLocate(int _beaconNum) {

  // draw a base map
  //  PImage mapImage = loadImage("takatsuki.png");
  image(mapImage, 0, 0);
  // mapDraw();

  // draw chart pannels
  for (int i=0; i< _beaconNum; i++) {
    if (i%2 ==0) {
      aChart[i].init(mapImage.width + 10, 50*i);
    } else {
      aChart[i].init(mapImage.width + 310, 50*(i-1));
    }
  }
}

void vinit() {
  // beacon の位置を読み込む 
  beaconPosition = createReader("beaconPosition.txt");

  //ビーコンとグラフの初期化
  for (int i=0; i<beaconNum; i++) {
    myLine = null;
    try { //1行読む
      myLine = beaconPosition.readLine();
    } 
    catch (IOException err) { //エラー処理
      err.printStackTrace();
      println("読み取りエラー");
    }
    if (myLine!=null) {   
      String[] col = split(myLine, ',');
      aBeacon[i] = new Beacon(int(col[0]), int(col[1]), i);
      aChart[i] = new Chart(280, 95, aBeacon[i]);
    }
  }
}

void mapDraw() {
  if (!isPathDisplay) {
    image(mapImage, 0, 0);
  }
}
//}

