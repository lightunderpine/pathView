// 歩行者
class Pedestorian {
  int posX;
  int posY;
  color myColor;
  BufferedReader reader;
  String line;


  // Pedestorian(X座標, Y座標, name)
  Pedestorian(int _X, int _Y, String _dataName) {
    posX = _X;
    posY = _Y;
    reader = createReader(_dataName);
    println(">>"+ reader);
  }

  // 表示（引数は色）
  void display(color _myColor) {
    myColor = _myColor;
    strokeWeight(1);
    fill(myColor);
    if(isPathDisplay){
      stroke(0);
      ellipse(posX, posY, 2, 2);
    } else {    
    ellipse(posX, posY-10, 3, 3);
    line(posX,posY-7, posX, posY);
    line(posX-4, posY-3, posX+4, posY-3);
    line(posX-2, posY+6, posX, posY);
    line(posX+2, posY+6, posX, posY);
    }
  }

  // ファイルから１行読んで歩行者座標を更新
  void update() {
    line = null;
    try { //1行読む
      line = reader.readLine();
    } 
    catch (IOException err) { //エラー処理
      err.printStackTrace();
      println("読み取りエラー");
    }

    if (line == null) {
      //読み取り終了
      noLoop();
    } 
    else {  
      String[] col = split(line, ','); // , で分割
      println(">> col:"+ col[0]+ col[1]);
      if (col.length==2) {
        //整数に変換
        posX = int(col[0]);
        posY = int(col[1]);
        color pedestorianColor = color(255, 100, 100);

        //朝と夜で歩行者の色をかえる（朝：水色、夜：黄色）
        if (count <1600) {
          pedestorianColor = color(0, 255, 255);
        }
        else {
          pedestorianColor = color(255, 255, 0);
        }
        display(pedestorianColor);
      }
      else {
        println(line);
      }// , なし
    }
  }
}
