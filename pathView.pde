// 歩行者の座標ファイル
String[] fileNames  = {
  "00.txt", "01.txt", "02.txt", "03.txt", "04.txt", 
  "05.txt", "06.txt", "07.txt", "08.txt", "09.txt"
};
int count = 0;
PFont font;

// 歩行者設定
int pedestorianNum = fileNames.length; // 歩行者の数
Pedestorian[] aPedestorian = new Pedestorian[pedestorianNum];

// Beacon 設定 
BufferedReader beaconPosition;
int beaconNum = 10; //設置する Beacon の数
int detectRegion = 30; //Beacon の検出半径
Beacon[] aBeacon = new Beacon[beaconNum];
Chart[] aChart = new Chart[beaconNum];



//-------------------------------------------------------
void setup() {
  size(1200, 510);
  ellipseMode(RADIUS);
  font = createFont("FFScala-32.vlw", 32); 

  beaconPosition = createReader("beaconPosition.txt");
//for (int i=0;i<10;i++){
//  println("beacon"+i);
//  int line = beaconPosition.readLine;
//  
//}



  // beacon[0] は規定の初期値に設定（テスト用）
//  aBeacon[0]=new Beacon(250, 380, "BEACON0");
//  aPedestorian[0]=new Pedestorian(20, 200, fileNames[0]);
//  aChart[0] = new Chart(280, 95, aBeacon[0]);
//  aChart[0].init(610, 0, aBeacon[0].myColor);

  //ビーコンとグラフの初期化 (beacon[0]以外の初期値は現時点ではランダム)
  for (int i=0;i<beaconNum;i++) {
    String line = beaconPosition.readLine();
    String[] col = split(line, ',');
    int sampleX =int(col[0]);//= int(40+random(520));
    int sampleY =int(col[1]);//= int(100+random(280));
    aBeacon[i] = new Beacon(sampleX, sampleY, "BEACON"+i);
    aChart[i] = new Chart(280, 95, aBeacon[i]);
  }

  //初期画面の描画
  panelLocate(beaconNum);

  //歩行データの準備
  for (int i=1;i<pedestorianNum;i++) {
        int sampleX = int(15+random(10));
            int sampleY = int (190 + random(20));
    aPedestorian[i] = new Pedestorian(sampleX, sampleY, fileNames[i]);
    aPedestorian[i].display(color(0, 255, 255));
  }


}

//-----------------------------------------
void draw() {

  //pedestorian
  for (int i=0;i<pedestorianNum;i++) {
    aPedestorian[i].update();
  }

  //beacons
  for (int i=0;i<beaconNum;i++) {
    int encount = 0;
    for (int j=0;j<pedestorianNum;j++) {
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

