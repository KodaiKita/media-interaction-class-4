class Leaf {

  PVector position;

  PVector velocity;

  PVector acceleration, gravity;

  PVector force;//外力を表すベクトル


  //コンストラクタ　物体のｘ座標、ｙ座標、質量、直径を設定

  Leaf(float xpos, float ypos) {

    position = new PVector(xpos, ypos);

    velocity = new PVector(0, 0);

    acceleration = new PVector(0, 0);

    gravity = new PVector(0, 0.1);

    force = new PVector(0, 0);//力ベクトルの初期値を0に設定

  }



  //加速度の加算という形で外力を与える

  void applyForce(PVector force) {

    acceleration.add(force);

  }



  void display() {

    fill(127);



    //外力による加速度を設定

    applyForce(force);//外力の力ベクトルforceを加速度に加算

    velocity.add(acceleration);//加速度を速度に加算



    //Leafの自由落下による速度を加算

    velocity.add(gravity);





    //Leafの位置を算出

    position.add(velocity);

    //Leafを描画

    image(getImage(), position.x, position.y);



    //外力による加速度を毎回ゼロリセットして，改めてaddForceで外力を与える

    acceleration.mult(0);

  }

}
