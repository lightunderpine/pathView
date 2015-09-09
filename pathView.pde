// 歩行者の座標ファイル
String[] fileNames  = {
  "00.txt", "01.txt", "02.txt", "03.txt", "04.txt", 
  "05.txt", "06.txt", "07.txt", "08.txt", "09.txt"
};
int count = 0;
PFont font;
String myLine;
boolean isPathDisplay = false;
PImage mapImage;
//PImage man;
  
// 歩行者設定
int pedestorianNum = fileNames.length; // 歩行者の数
Pedestorian[] aPedestorian = new Pedestorian[pedestorianNum];

// Beacon 設定 
BufferedReader beaconPosition;
int beaconNum = 10; //設置する Beacon の数
int detectRegion = 25; //Beacon の検出半径
Beacon[] aBeacon = new Beacon[beaconNum];
Chart[] aChart = new Chart[beaconNum];




//-------------------------------------------------------
void setup() {
  size(1200, 510);
  ellipseMode(RADIUS);
  font = createFont("FFScala-32.vlw", 32); 
  mapImage = loadImage("takatsuki.png");

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

  //初期画面の描画
  panelLocate(beaconNum);

  //歩行データの準備
  for (int i=0; i<pedestorianNum; i++) {
    int sampleX = int(15+random(10));
    int sampleY = int (190 + random(20));
    aPedestorian[i] = new Pedestorian(sampleX, sampleY, fileNames[i]);
    aPedestorian[i].display(color(0, 255, 255));
  }
}

//-----------------------------------------
void draw() {
    mapDraw();
  //pedestorian
  for (int i=0; i<pedestorianNum; i++) {
    aPedestorian[i].update();
  }

  //beacons

    for (int i=0; i<beaconNum; i++) {
    int encount = 0;
    for (int j=0; j<pedestorianNum; j++) {
      if (isActive(aBeacon[i], aPedestorian[j])) {
        encount++;
      }
    }
    aBeacon[i].display(encount);
    aChart[i].display(count, encount);
  } 


  //counter display
  counter(count);
  count++;
}

