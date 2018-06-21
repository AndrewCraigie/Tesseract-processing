// Andrew Craigie
// Transform4D

class Transform4D{
  
  
  Transform4D(){
    
  }
 
   /**
   *   _                                  _
   *  |  cos(a)  -sin(a)    0        0     |
   *  |  sin(a)   cos(a)    0        0     |
   *  |   0        0        1        0     |
   *  |   0        0        0        1     |
   *   -                                  -
   */
   Vec4D rotateXY(Vec4D vec, float theta){
     
     //theta = radians(theta);
     
     float[] p = new float[] {
       vec.x * cos(theta) + vec.y * -sin(theta),
       vec.x * sin(theta) + vec.y *  cos(theta),
       vec.z,
       vec.u
     };
     
     vec.set(p);
     return vec;
   }
   
  
   /**
   *   _                                  _
   *  |   1        0        0        0     |
   *  |   0       cos(a)   sin(a)    0     |
   *  |   0      -sin(a)   cos(a)    0     |
   *  |   0        0        0        1     |
   *   -                                  -
   */
   Vec4D rotateYZ(Vec4D vec, float theta){
     
     //theta = radians(theta);
     
     float[] p = new float[]{
       vec.x,
       vec.y *  cos(theta) + vec.z * sin(theta),
       vec.y * -sin(theta) + vec.z * cos(theta),
       vec.u
     };
     
     vec.set(p);
     return vec;
   }
   
  
   /**
   *   _                                  _
   *  |  cos(a)    0      -sin(a)    0     |
   *  |   0        1        0        0     |
   *  |  sin(a)    0       cos(a)    0     |
   *  |   0        0        0        1     |
   *   -                                  -
   */
   Vec4D rotateXZ(Vec4D vec, float theta){
     
     //theta = radians(theta);
     
     float[] p = new float[]{
       vec.x * cos(theta) + vec.z * -sin(theta),
       vec.y,
       vec.x * sin(theta) + vec.z *  cos(theta),
       vec.u
     };
     
     vec.set(p);
     return vec;
   }
   
   
   /**
   *   _                                    _
   *  |  cos(a)    0        0       sin(a)   |
   *  |   0        1        0        0       |
   *  |   0        0        1        0       |
   *  | -sin(a)    0        0       cos(a)   |
   *   -                                    -
   */
   Vec4D rotateXU(Vec4D vec, float theta){
     
     //theta = radians(theta);
     
     float[] p = new float[]{
       vec.x *  cos(theta) + vec.u * sin(theta),
       vec.y,
       vec.z,
       vec.x * -sin(theta) + vec.u * cos(theta)
     };
     
     vec.set(p);
     return vec;
   }
   
   /**
   *   _                                    _
   *  |   1        0        0        0       |
   *  |   0       cos(a)    0      -sin(a)   |
   *  |   0        0        1        0       |
   *  |   0       sin(a)    0       cos(a)   |
   *   -                                    -
   */
   Vec4D rotateYU(Vec4D vec, float theta){
     
     //theta = radians(theta);
     
     float[] p = new float[]{
       vec.x,
       vec.y * cos(theta) + vec.u * -sin(theta),
       vec.z,
       vec.y * sin(theta) + vec.u * cos(theta)
     };
     
     vec.set(p);
     return vec;
   }
   
   /**
   *   _                                    _
   *  |   1        0        0        0       |
   *  |   0        1        0        0       |
   *  |   0        0       cos(a)  -sin(a)   |
   *  |   0        0       sin(a)   cos(a)   |
   *   -                                    -
   */
   Vec4D rotateZU(Vec4D vec, float theta){
     
     //theta = radians(theta);
     float[] p = new float[]{
       vec.x,
       vec.y,
       vec.z * cos(theta) + vec.u * -sin(theta),
       vec.z * sin(theta) + vec.u *  cos(theta)
     };
       
     vec.set(p);
     return vec;
       
   }
   
   PVector project4Dto2D(Vec4D vec){
     return new PVector(vec.x, vec.y);
   }
   
   
   
   
   
  
  
}
