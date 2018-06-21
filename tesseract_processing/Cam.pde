// Andrew Craigie
// Cam.pde

// Simple camera class

class Cam {

  PVector loc;
  PVector target;
  PVector orientation;

  float camRadius;
  float camAlpha;
  float camBeta;

  Cam (PVector location, PVector target, PVector orientation) {

    this.loc = location;
    this.target = target;
    this.orientation = orientation;

    calcRAB();
  }

  void calcRAB() {
    this.camRadius = PVector.dist(this.loc, this.target);
    this.camAlpha = asin((this.loc.y - this.target.y) / this.camRadius);
    this.camBeta = atan2(this.loc.x, this.loc.z);
  }

  void setLocation(PVector loc) {
    this.loc = loc;
    calcRAB();
  }

  void setTarget(PVector target){
    this.target = target;
    calcRAB();
  }
}
