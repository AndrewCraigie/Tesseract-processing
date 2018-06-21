// Andrew Craigie
// Vec4D

class Vec4D {
  
  int id = 0;
  float x = 0;
  float y = 0;
  float z = 0;
  float u = 0;
  
  Vec4D(){
    
  }
  
  
  Vec4D(float x, float y, float z, float u){
    this.x = x;
    this.y = y;
    this.z = z;
    this.u = u;
   
  }
  
  Vec4D set(float x, float y, float z, float u){
    this.x = x;
    this.y = y;
    this.z = z;
    this.u = u;
    return this;
  }
  
  Vec4D set(float[] source){
    this.x = source[0];
    this.y = source[1];
    this.z = source[2];
    this.u = source[3];
    return this;
  }
  
  float[] get(){
    float [] target = new float[]{this.x, this.y, this.z, this.u};
    return target;
  }
  
  float[] get(float[] target){
    if(target == null){
      return new float[] {this.x, this.y, this.z, this.u};
    }
    if(target.length >=3){
      target[0] = this.x;
      target[1] = this.y;
      target[2] = this.z;
      target[3] = this.u;
    }
    return target;
  }
  
  void setX(float x){
    this.x = x;
  }
  void setY(float y){
    this.y = y;
  }
  void setZ(float z){
    this.z = z;
  }
  void setU(float u){
    this.u = u;
  }
  
  float getX(){
    return this.x;
  }
  float getY(){
    return this.y;
  }
  float getZ(){
    return this.z;
  }
  float getU(){
    return this.u;
  }
  
  Vec4D add(Vec4D v){
    this.x += v.x;
    this.y += v.y;
    this.z += v.z;
    this.u += v.u;
    return this;
  }
  
  Vec4D sub(Vec4D v){
    this.x -= v.x;
    this.y -= v.y;
    this.z -= v.z;
    this.u -= v.u;
    return this;
  }
  
  Vec4D mult(float n){
    this.x *= n;
    this.y *= n;
    this.z *= n;
    this.u *= n;
    return this;
  }
  
  Vec4D div(float n) {
    this.x /= n;
    this.y /= n;
    this.z /= n;
    this.u /= n;
    return this;
  }
  
  float mag(){
    return sqrt(this.x * this.x + this.y * this.y + this.z * this.z + this.u * this.u);
  }
  
  Vec4D normalize(){
    float m = this.mag();
    if(m != 0 && m !=1){
      this.div(m);
    }
    return this;
  }
  
  @Override
  String toString(){
    return "[" + this.x + ", " + this.y + ", " + this.z + ", " + this.u + "]";
  }
  
}
