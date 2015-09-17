// 歩行者の座標ファイル
String[] fileNames  = {
  "00.txt", "01.txt", "02.txt", "03.txt", "04.txt", 
  "05.txt", "06.txt", "07.txt", "08.txt", "09.txt"
};
/*
int[][] relation = {
 {//1 2  3  4  5  6  7  8  9 10
 0, 0, 0, 0, 2, 0, 0, 0, 0, 0 //0
 }
 , 
 {//1 2  3  4  5  6  7  8  9 10
 0, 0, 3, 2, 0, 0, 0, 0, 0, 0 //1
 }
 , 
 {//1 2  3  4  5  6  7  8  9 10
 0, 3, 0, 4, 0, 1, 0, 0, 0, 0 //2
 }
 , 
 { 
 0, 2, 4, 0, 1, 2, 0, 1, 0, 0 //3
 }
 , 
 { 
 2, 0, 0, 1, 0, 1, 0, 1, 0, 0
 }
 , 
 { 
 0, 0, 1, 2, 1, 0, 1, 1, 1, 1
 }
 , 
 { 
 0, 0, 0, 0, 0, 1, 0, 1, 1, 1
 }
 , 
 { 
 0, 0, 0, 1, 0, 1, 0, 0, 1, 1
 }
 , 
 { 
 0, 0, 0, 0, 0, 1, 0, 1, 0, 1
 }
 , 
 { 
 0, 0, 0, 0, 0, 1, 0, 1, 1, 0
 }
 };
 */

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

Network network;




//-------------------------------------------------------
void setup() {
  size(1200, 510);
  ellipseMode(RADIUS);
  font = createFont("FFScala-32.vlw", 32); 
  mapImage = loadImage("takatsuki.png");
  network = new Network(10);

  vinit();

  //初期画面の描画
  panelLocate(beaconNum);

  //歩行データの準備
  for (int i=0; i<pedestorianNum; i++) {
    int sampleX = int(15+random(10));
    int sampleY = int (190 + random(20));
    aPedestorian[i] = new Pedestorian(sampleX, sampleY, fileNames[i]);
    aPedestorian[i].display(color(0, 255, 255));
  }
  network.init();
}

//-----------------------------------------
void draw() {
  mapDraw();
  //pedestorian
  for (int i=0; i<pedestorianNum; i++) {
    aPedestorian[i].update();
  }

  for (int i=0; i<beaconNum; i++) {
    for (int j=i+1; j<beaconNum; j++) {
      //      if ((relation[i][j]+relation[j][i]) != 0) {
      if (network.relation[i][j]!=0.0) {
        strokeWeight(round(pow(network.relation[i][j], 2)*5));
        line(aBeacon[i].posX, aBeacon[i].posY, aBeacon[j].posX, aBeacon[j].posY);
        fill(0);
        textFont(font, 14);
        text(network.relation[i][j], (aBeacon[i].posX + aBeacon[j].posX)/2, (aBeacon[i].posY + aBeacon[j].posY)/2);
      }
    }
  }


  //beacons
  for (int i=0; i<beaconNum; i++) {
    //int encount = 0;
/*
    for (int j=0; j<pedestorianNum; j++) {
      if (isActive(aBeacon[i], aPedestorian[j])) {
        encount++;
      }
    }
    */
    //ビーコンの検出範囲内にいる人の数を取得する
    int encount = aBeacon[i].pedestorianDetect();
    for (int j=0; j<aBeacon.length; j++) {
      float tmp = network.relation[i][j] * encount;
      aBeacon[j].beaconRelationDegree += tmp;
    }
    aBeacon[i].display(encount);
    aChart[i].display(count, encount);
  } 


  //counter display
  counter(count);
  count++;
}

