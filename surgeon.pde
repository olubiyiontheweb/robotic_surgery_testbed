class surgeon {
  float x=500;
  int y=500, xSize; 

  surgeon(float xx, int yy, int sx) 
  {
    x=xx;
    y=yy; 
    xSize=sx;
  };

  void bring_surgeon()
  {
    pushStyle();
    fill(vcol);
    stroke(100);
    strokeWeight(3);
    if (x<250 && screen=="haptics")
    {
      rect(x, y, xSize, xSize/2);
    } else {
      image(knife, x-15, y-90, xSize+100, xSize+100);
      rect(x, y, xSize, xSize);
    }
    popStyle();
  }
}
