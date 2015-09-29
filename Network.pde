class Network {
  float[][] relation;
  int nodeNum;

  Network(int _nodeNum) {
    nodeNum=_nodeNum;
    relation = new float[nodeNum][nodeNum];
  }

  void init() {
    for (int i=0; i<nodeNum; i++) {
      for (int j=0; j<nodeNum; j++) {
        float dValue = distance(aBeacon[i], aBeacon[j]);
        //print(dValue+" ");
        if (dValue < 1.0) {
          relation[i][j]= 0;
        } else {
          relation[i][j]=max(300-dValue, 0)/300;
        }

        print(relation[i][j]+" ");
      }
      println();
    }
  }

  void display() {
    if (isNetworkDisplay) {
      for (int i=0; i<beaconNum; i++) {
        for (int j=i+1; j<beaconNum; j++) {
          if (network.relation[i][j]!=0.0) {
            strokeWeight(round(pow(network.relation[i][j], 2)*5));
            line(aBeacon[i].posX, aBeacon[i].posY, aBeacon[j].posX, aBeacon[j].posY);
            fill(0);
            textFont(font, 14);
            text(network.relation[i][j], (aBeacon[i].posX + aBeacon[j].posX)/2, (aBeacon[i].posY + aBeacon[j].posY)/2);
          }
        }
      }
    }
  }
}

