// Andrew Craigie
// Tesseract.pde

// Class to create and store vertices, lines and faces of a Tesseract

class Tesseract {
  

  float[][] unitVecs = new float[][]{
    {-1.0, -1.0, -1.0, -1.0}, 
    {-1.0, -1.0, -1.0,  1.0}, 
    {-1.0, -1.0,  1.0, -1.0}, 
    {-1.0, -1.0,  1.0,  1.0}, 
    {-1.0,  1.0, -1.0, -1.0}, 
    {-1.0,  1.0, -1.0,  1.0}, 
    {-1.0,  1.0,  1.0, -1.0}, 
    {-1.0,  1.0,  1.0,  1.0}, 

    { 1.0, -1.0, -1.0, -1.0}, 
    { 1.0, -1.0, -1.0,  1.0}, 
    { 1.0, -1.0,  1.0, -1.0}, 
    { 1.0, -1.0,  1.0,  1.0}, 
    { 1.0,  1.0, -1.0, -1.0}, 
    { 1.0,  1.0, -1.0,  1.0}, 
    { 1.0,  1.0,  1.0, -1.0}, 
    { 1.0,  1.0,  1.0,  1.0}, 

    {-1.0, -1.0, -1.0, -1.0}, 
    {-1.0, -1.0, -1.0,  1.0}, 
    {-1.0, -1.0,  1.0, -1.0}, 
    {-1.0, -1.0,  1.0,  1.0}, 
    {-1.0,  1.0, -1.0, -1.0}, 
    {-1.0,  1.0, -1.0,  1.0}, 
    {-1.0,  1.0,  1.0, -1.0}, 
    {-1.0,  1.0,  1.0,  1.0}, 

    { 1.0, -1.0, -1.0, -1.0}, 
    { 1.0, -1.0, -1.0,  1.0}, 
    { 1.0, -1.0,  1.0, -1.0}, 
    { 1.0, -1.0,  1.0,  1.0}, 
    { 1.0,  1.0, -1.0, -1.0}, 
    { 1.0,  1.0, -1.0,  1.0}, 
    { 1.0,  1.0,  1.0, -1.0}, 
    { 1.0,  1.0,  1.0,  1.0},
   
  };
  
  

  int[][] axises = new int[][]{
    { 0, 1}, 
    { 0, 2}, 
    { 0, 4}, 
    { 0, 8}, 

    { 1, 3}, 
    { 1, 5}, 
    { 1, 9}, 

    { 2, 3}, 
    { 2, 6}, 
    { 2, 10}, 

    { 3, 2}, 
    { 3, 7}, 
    { 3, 11}, 

    { 4, 5}, 
    { 4, 6}, 
    { 4, 12}, 

    { 5, 7}, 
    { 5, 13}, 

    { 6, 7}, 
    { 6, 14}, 

    { 7, 15}, 

    { 8, 9}, 
    { 8, 10}, 
    { 8, 12}, 

    { 9, 11}, 
    { 9, 13}, 

    {10, 11}, 
    {10, 14}, 

    {11, 15}, 

    {12, 13}, 
    {12, 14}, 

    {13, 15}, 

    {14, 15}, 
  };


  int[][] faceIndices = new int[][]{
    { 0,  1,  3,  2},     //  0
    { 2,  3, 11, 10},     //  1
    {10, 11,  9,  8},     //  2
    { 8,  9,  1,  0},     //  3
    { 0,  2,  10, 8},     //  4

    { 1,  3,  11, 9},     //  5 Bottom inner face

    { 4,  6,  7,  5},     //  6
    { 6, 14, 15,  7},     //  7
    {14, 12, 13, 15},     //  8
    {12,  4,  5, 13},     //  9
    { 4, 12, 14,  6},     // 10

    { 5, 13, 15,  7},     // 11 Top inner face

    { 0,  4,  5,  1},     // 12 Flaps
    { 2,  6,  7,  3},     // 13 
    {10, 11, 15, 14},     // 14 
    { 8, 12, 13,  9},     // 15

    { 1,  5,  7,  3},     // 16
    { 3,  7, 15, 11},     // 17  Back inner face

    {11, 15, 13,  9},     // 18 

    { 9, 13,  5,  1},     // 19 Front inner face

    { 3,  7,  5,  1},     // 20
    { 9, 13, 15, 11},     // 21

    { 0,  4,  6,  2},     // 22 Outer sides
    { 2,  6, 14, 10},     // 23 
    {10, 14, 12,  8},     // 24
    { 8, 12,  4,  0}      // 25

  };
  
  int[] innerFaceNodeIndexes = new int[]{
    5, 11, 17, 19
  };
  

  TNode[] nodes;
  TFace[] faces;
  
  Transform4D trans4D;

  float sideLength;
  float unitValue;

  Tesseract(float sideLength, float unitValue) {
    
    this.trans4D = new Transform4D();
    
    this.sideLength = sideLength;
    this.unitValue = unitValue;

    this.nodes = new TNode[this.unitVecs.length];
    for (int tNodeIndex = 0; tNodeIndex < this.unitVecs.length; tNodeIndex++) {
      
      float[] vs = unitVecs[tNodeIndex];
      float vs1 = vs[0] * this.unitValue;
      float vs2 = vs[1] * this.unitValue;
      float vs3 = vs[2] * this.unitValue;
      float vs4 = vs[3] * this.unitValue;
      
      this.nodes[tNodeIndex] = new TNode(new Vec4D(vs1, vs2, vs3, vs4), tNodeIndex);
    }

    this.faces = new TFace[faceIndices.length];

    for (int faceIndex = 0; faceIndex < faceIndices.length; faceIndex ++) {

      int[] faceIs = faceIndices[faceIndex];

      TNode tN1 = this.nodes[faceIs[0]];
      TNode tN2 = this.nodes[faceIs[1]];
      TNode tN3 = this.nodes[faceIs[2]];
      TNode tN4 = this.nodes[faceIs[3]];

      this.faces[faceIndex] = new TFace(tN1, tN2, tN3, tN4);  
    }

  }
  
  void tRotate(String ax, Float angleRads){
    
    for (int i = 0; i < this.nodes.length; i++) {
      
      if (ax == "XY") {
        trans4D.rotateXY(this.nodes[i].vec, angleRads);
      }
      if(ax == "YZ"){
        trans4D.rotateYZ(this.nodes[i].vec, angleRads);
      }
      if(ax == "XZ") {
        trans4D.rotateXZ(this.nodes[i].vec, angleRads);
      }
      if(ax == "XU"){
        trans4D.rotateXU(this.nodes[i].vec, angleRads);
      }
      if (ax == "YU") {
        trans4D.rotateYU(this.nodes[i].vec, angleRads);
      }
      if(ax == "ZU"){
        trans4D.rotateZU(this.nodes[i].vec, angleRads);
      }
      
    }
    
  }
  
  
}
