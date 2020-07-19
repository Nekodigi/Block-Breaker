Ball ball;
ArrayList<Block> blocks = new ArrayList<Block>();
int bs = 100;//block size
int ni, nj;

void setup(){
  fullScreen();
  //size(1000, 1000);
  ball = new Ball(new PVector(width/2, height/2+bs+EPSILON), new PVector(20, 10), bs/2);
  ni = width/bs;
  nj = height/2/bs;
  for(int i=0; i<ni; i++){
    for(int j=0; j<nj; j++){
      blocks.add(new Block(new PVector(i*bs+bs/2, j*bs+bs/2), bs/2, true));
    }
  }
}

void draw(){
  background(255);
  fill(0);
  ball.update(blocks);
  ball.show();
  for(Block block : blocks){
    block.show();
  }
  int second = millis()/1000;
  fill(255);
  textSize(200);
  textAlign(LEFT, TOP);
  text(second, 0, 0);
}

void mousePressed(){
  blocks.add(new Block(new PVector(mouseX, mouseY), bs, true));
}
