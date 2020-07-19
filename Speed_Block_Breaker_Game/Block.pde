class Block{
  PVector pos;
  float r;
  boolean breakable;
  boolean broken;
  
  Block(PVector pos, float r, boolean breakable){
    this.pos = pos;
    this.r = r;
    this.breakable = breakable;
  }
  
  boolean isInside(Ball ball){
    float dstx = abs(pos.x - ball.pos.x);
    float dsty = abs(pos.y - ball.pos.y);
    float d = (ball.r+r);
    return dstx < d && dsty < d;
  }
  
  void show(){
    if(!broken)rect(pos.x-r, pos.y-r, r*2, r*2);
  }
}
