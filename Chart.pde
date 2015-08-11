class Chart {
  int chartWidth;
  int chartHeight;
  int posX;
  int posY;
  float prevValue; //preserving a previous number of encount
  Beacon myBeacon;

  Chart(int _chartWidth, int _chartHeight, Beacon _beacon) {
    chartWidth = _chartWidth;
    chartHeight = _chartHeight;
    myBeacon = _beacon;
    prevValue = 0;
  }

  void init (int _posX, int _posY, color _myColor) {
    posX = _posX;
    posY = _posY;
    pushMatrix();
    translate(posX, posY);
    fill(240);
    rect(0, 0, chartWidth, chartHeight); //枠線
    line(10, 90, 10, 10);
    line(10, 90, 270, 90);
    fill(_myColor);
    text(myBeacon.name, 10, 30);
    fill(255);
    popMatrix();
  }

  void display(int _count, int _value) {
    pushMatrix();
    translate(posX, posY);
    stroke(255, 0, 0);
    strokeWeight(2);
    line(int((_count-1)*0.1)+10, 90-prevValue*10, int(_count*0.1)+10, 90-_value*10);
    stroke(0);
    popMatrix();
    prevValue = _value;
  }
}

