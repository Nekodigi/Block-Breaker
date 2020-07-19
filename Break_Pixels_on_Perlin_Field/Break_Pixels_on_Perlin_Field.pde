int iter = 100;//iteration 100
int nball = 100;//number of balls 100
int bs = 5;//block size 5
float nscale = 1000;//noise scale 1000
float spawnRange = nscale/10000;//nscale/10000
float pnoise = 0.1;//noise power 0.1
float zoffc = 0.00001;//zoff change 0.00001

ArrayList<Ball> balls = new ArrayList<Ball>();
boolean[][] blocks;
int ni, nj;
float zoff;

void setup(){
  fullScreen();
  //size(1000, 1000);
  colorMode(HSB, 360, 100, 100, 100);
  for(int i=0; i<nball; i++){
    balls.add(new Ball(bs/2));
  }
  ni = width/bs;
  nj = height/bs;
  blocks = new boolean[ni][nj];
  for(int i=0; i<ni; i++){
    for(int j=0; j<nj; j++){
      blocks[i][j] = true;
    }
  }
  noStroke();
  background(360);
}

void draw(){
  fill(0, 1);
  rect(0, 0, width, height);
  background(0);
  fill(360);
  fill(zoff*10%360, 100, 100);
  for(int i=0; i<iter; i++){
    for(Ball ball : balls){
      ball.update();
      ball.show();
    }
    zoff += zoffc;
  }
  fill(360);
  for(int i=0; i<ni; i++){
    for(int j=0; j<nj; j++){
      if(blocks[i][j])rect(i*bs, j*bs, bs, bs);
    }
  }
}
