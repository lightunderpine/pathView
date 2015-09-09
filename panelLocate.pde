// パネルの初期描画用関数
void panelLocate(int _beaconNum) {
  
  // draw a base map
//  PImage mapImage = loadImage("takatsuki.png");
  image(mapImage, 0, 0);
 // mapDraw();

  // draw chart pannels
  for (int i=0; i< _beaconNum; i++) {
    if (i%2 ==0) {
//      aChart[i].init(mapImage.width + 10, 50*i, aBeacon[i].myColor);
     aChart[i].init(mapImage.width + 10, 50*i);
    } 
    else {
//      aChart[i].init(mapImage.width + 310, 50*(i-1), aBeacon[i].myColor);
      aChart[i].init(mapImage.width + 310, 50*(i-1));
    }
  }
}

void mapDraw(){
  if(!isPathDisplay){
  image(mapImage, 0, 0);
  }
}
