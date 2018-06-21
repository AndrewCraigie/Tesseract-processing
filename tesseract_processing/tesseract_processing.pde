// Andrew Craigie
// tesseract_processing.pde

Axis axis;
Cam cam;

float camR                = 400.0;
float camAdjust           = 800;
float camX                = 0.0;
float camY                = 0.0;
float camZ                = 0.0;

float targetX             = 0.0;
float targetY             = 0.0;
float targetZ             = 0.0;

float camDirX             = 0.0;
float camDirY             = 1.0;
float camDirZ             = 0.0;

float alphaAngle          = 120;
float betaAngle           = 120;

float camAlpha            = -18.5;
float camBeta             = 45;

float camBetaIncrement    = 1.0;
float camAlphaIncrement   = 0.0;

boolean showAxis          = false;
boolean showText          = false;
boolean showPoints        = false;
boolean rotate4D          = true;
boolean orthoCam          = false;
boolean showInnerFaces    = false;

float camInc              = 0.1;
float camX2               = 0.0;

void keyPressed() {

  if (keyCode == DOWN) {
    camR += 10;
    println("Camera radius: ", camR);
  }
  
  if (keyCode == UP) {
    camR -= 10; 
    println("Camera radius: ", camR);
  }

  if (key == 'o' || key == 'O') {
    orthoCam = true;
  }

  if (key == 'p' || key == 'P') {
    orthoCam = false;
    perspective();
  }

  if (key == 'a' || key == 'A') {
    showAxis = !showAxis;
  }

  if (key == 't' || key == 'T') {
    showText = !showText;
  }

  if (key == 's' || key == 'S') {
    showPoints = !showPoints;
  }

  if (key == 'r' || key == 'R') {
    rotate4D = !rotate4D;
  }
  
  if (key == 'f' || key == 'F') {
    showInnerFaces = !showInnerFaces;
  }
  
}

void mouseDragged() {
  camAlpha  = map(mouseY, 0, height, 180, -180);
  camBeta   = map(mouseX, 0, width, -180,  180);
}

void updateCamera() {
  camX = camR * cos(radians(camAlpha)) * cos(radians(camBeta));
  camY = camR * sin(radians(camAlpha));
  camZ = camR * cos(radians(camAlpha)) * sin(radians(camBeta));
}

Tesseract tessRact1;

float angle     = -PI * 0.003;    // Controls speed of rotation
float angleData = 0;

void setup () {
  size(600, 600, P3D);

  colorMode(RGB, 255, 255, 255, 255);

  axis = new Axis(0.0, 0.0, 0.0, width, height, width, 2);
  cam = new Cam(new PVector(100, -200, -200), new PVector(0, 0, 0), new PVector(0.0, 1.0, 0.0));

  tessRact1 = new Tesseract(400, 0.20);
  
  int[] innerFaceNodeIndexes = tessRact1.innerFaceNodeIndexes;
  for(int i = 0; i < innerFaceNodeIndexes.length; i ++){
    TFace tF = tessRact1.faces[innerFaceNodeIndexes[i]];
    tF.setColor(color(255, 100, 0, 80));
    tF.showFill(true);
  }
  
}

void draw() {
  background(255);
  
  updateCamera();
  camera(camX, camY, camZ, targetX, targetY, targetZ, camDirX, camDirY, camDirZ);
  
  if(orthoCam){
    float m = width/height;
    float w = ((width ) * m /2) * (camR  / height) ;
    float h = ((height ) / 2)  * (camR * m / height) ;
    ortho(-w, w, -h, h);
  } else {
    perspective();
  }

  if (showAxis) {
    axis.draw(color(255, 0, 0), color(0, 255, 0), color(0, 0, 255));
  }
  
  if(showPoints){
    for (int i = 0; i < tessRact1.nodes.length-1; i++) {
      
      TNode tNode = tessRact1.nodes[i];
      float sLength1 = tessRact1.sideLength;
      float rf1 = 1 - (1 - tNode.vec.u) * sLength1;
      pushMatrix();
      pushStyle();
      fill(255, 100, 0);
      noStroke();
      translate(tNode.vec.x * rf1, tNode.vec.y * rf1, tNode.vec.z * rf1); 
      sphere(5);
      popStyle();
      popMatrix();
  
    }
  }

  for (int i = 0; i < tessRact1.faces.length; i++) {

    TFace tF = tessRact1.faces[i];

    beginShape();
    normal(0, 0, 1);
    stroke(0, 0, 0);
    strokeWeight(2);
    
    if (tF.showFilled){
      if(showInnerFaces){
        fill(tF.col);
      }
    } else {
      noFill();
    }
    
    for (int j = 0; j < tF.nodes.length; j++) {

      TNode tN = tF.nodes[j];
      float sLength = tessRact1.sideLength;
      float rf = 1 - (1 - tN.vec.u) * sLength;
      vertex(tN.vec.x * rf, tN.vec.y * rf, tN.vec.z * rf);
    }

    endShape(CLOSE);
    
  }


  if (rotate4D) {
    tessRact1.tRotate("XU", angle);
    //tessRact1.tRotate("XY", angle);
    angleData += angle;
  }
   
  
  //noLoop();
}
