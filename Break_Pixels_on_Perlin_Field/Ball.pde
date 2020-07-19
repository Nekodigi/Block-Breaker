class Ball{
  PVector pos, vel = new PVector();
  float r;
  
  Ball(float r){
    pos = new PVector(width/2+random(-spawnRange, spawnRange), height/2+random(-spawnRange, spawnRange));
    //this.vel = new PVector(random(-height/100, height/100), random(-height/100, height/100));
    this.r = r;
  }
  
  void update(){
    float angle = noise(pos.x/nscale, pos.y/nscale, zoff)*TWO_PI*8;
    vel.add(PVector.fromAngle(angle).mult(pnoise));
    if(pos.x < 0 || pos.x > width){vel.x = -vel.x;}
    if(pos.y < 0 || pos.y > height){vel.y = -vel.y;}
    int i = int(pos.x/bs);
    int j = int(pos.y/bs);
    if(i >= 0 && j>= 0 && i < ni && j < nj && blocks[i][j] == true){blocks[i][j] = false;reset();}
    vel.setMag(constrain(vel.mag() , 0, bs));
    pos.add(vel);
  }
  
  void reset(){
    pos = new PVector(width/2+random(-spawnRange, spawnRange), height/2+random(-spawnRange, spawnRange));
    this.vel = new PVector();
    //this.vel = new PVector(random(-height/100, height/100), random(-height/100, height/100));
  }
  
  void show(){
    rect(pos.x-r, pos.y-r, r*2, r*2);
  }
}
