// Andrew Craigie
// TFace.pde

// Class for Tesseract face nodes and style

class TFace{
  
  TNode[] nodes;
  color col;
  boolean showFilled;;
  
  TFace(TNode tN1, TNode tN2, TNode tN3, TNode tN4){
    
    this.nodes = new TNode[]{tN1, tN2, tN3, tN4};
    this.col = color(255, 255, 255, 255);
    this.showFilled = false;
      
  }
  
  void setColor(color c){
    this.col = c;
  }
  
  void showFill(boolean sFill){
    this.showFilled = sFill;
  }
  
  
  
}
