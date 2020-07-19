class Ball{
  PVector pos, vel = new PVector();
  float r;
  
  Ball(PVector pos, PVector vel, float r){
    this.pos = pos;
    this.vel = vel;
    this.r = r;
  }
  
  void update(ArrayList<Block> blocks){
    if(pos.x < 0 || pos.x > width){vel.x = -vel.x;pos.add(vel);}
    if(pos.y < 0 || pos.y > height){vel.y = -vel.y;pos.add(vel);}
    for(Block block : blocks){
      if(block.broken == false){
        float dstx = abs(pos.x - block.pos.x);
        float dsty = abs(pos.y - block.pos.y);
        boolean inside = block.isInside(this);
        if(inside)block.broken = true && block.breakable;
        if(inside && dsty < dstx){vel.x = -vel.x;pos.add(vel);}
        if(inside && dstx <= dsty){vel.y = -vel.y;pos.add(vel);}
      }
    }
    pos.add(vel);
  }
  
  void show(){
    rect(pos.x-r, pos.y-r, r*2, r*2);
  }
}
