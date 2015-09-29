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
boolean isNetworkDisplay = true;
PImage mapImage;
//PImage man;

// 歩行者設定
int pedestorianNum = fileNames.length; // 歩行者の数
Pedestorian[] aPedestorian = new Pedestorian[pedestorianNum];

// Beacon 設定 
BufferedReader beaconPosition;
int beaconNum = 10; //設置する Beacon の数
Beacon[] aBeacon = new Beacon[beaconNum];
Chart[] aChart = new Chart[beaconNum];
Network network;




//-------------------------------------------------------
void setup() {
  size(1200, 510);
  ellipseMode(RADIUS);
  font = createFont("FFScala-32.vlw", 32); 
  mapImage = loadImage("takatsuki.png");
  
  network = new Network(beaconNum);

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

  // network no hyouji
  network.display();
  

  //beacons
  for (int i=0; i<beaconNum; i++) {

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

