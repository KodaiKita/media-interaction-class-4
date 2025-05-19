//例題7　風で雨粒が飛ばされる



ArrayList<Leaf> balls;

static PImage img;

//風のベクトルを定義

PVector wind;



void setup() {

  size(640, 360);

  balls = new ArrayList<Leaf>();

  img = loadImage("momiji.png");
  
  //風windに初期値を与える（横方向に0.1の力を加える）

  wind=new PVector(0.1, 0);

}

public static PImage getImage(){
  return img;
}



void draw() {

  background(0);

  balls.add(new Leaf(random(width), 10));



  for (Leaf obj : balls) {

    //キーが押されたら，風が吹く

    if (keyPressed) {
      if (key == CODED){
        if (keyCode == RIGHT) {
          obj.applyForce(wind);//applyForceを利用する
        }
        else if (keyCode == LEFT) {
          obj.applyForce(wind.mult(-1));
        }
      }
      
    }

    obj.display();

  }

}
