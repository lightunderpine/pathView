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
        if(dValue < 1.0){
          relation[i][j]= 0;
        } else {
          relation[i][j]=max(300-dValue,0)/300;
        }
        
        print(relation[i][j]+" ");
      }
      println();
    }
  }
}

