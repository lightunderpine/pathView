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
    prevValue = 90;
  }

//  void init (int _posX, int _posY, color _myColor) {
    void init (int _posX, int _posY) {
    posX = _posX;
    posY = _posY;
    pushMatrix();
    translate(posX, posY);
    fill(240);
    rect(0, 0, chartWidth, chartHeight); //枠線
    line(10, 90, 10, 10);
    line(10, 90, 270, 90);
    fill(0);
    text(myBeacon.name, 12, 30);
    fill(255);
    popMatrix();
  }

  void display(int _count, int _value) {
    pushMatrix();
    translate(posX, posY);
    stroke(255, 0, 0);
    strokeWeight(2);
    int currentValue = max(90 - _value*15,0);
    line(int((_count-1)*0.1)+10, prevValue, int(_count*0.1)+10, currentValue);
    stroke(0);
    popMatrix();
    prevValue = currentValue;
  }
}

