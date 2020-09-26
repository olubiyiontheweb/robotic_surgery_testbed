//void visual_path()
//{
//  Vector tuioObjectList = tuioClient.getTuioObjects();
//  for (int i=0; i<tuioObjectList.size (); i++) {
//    TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i);
//    color tl_col = get(tobj.getScreenX(width), tobj.getScreenY(height));
//    color tr_col = get(tobj.getScreenX(width)+40, tobj.getScreenY(height));
//    color bl_col = get(tobj.getScreenX(width), tobj.getScreenY(height)+40);
//    color br_col = get(tobj.getScreenX(width)+40, tobj.getScreenY(height)+40);
//
//
//    float greenValue1 = green(tl_col);
//    float greenValue2 = green(tr_col);
//    float greenValue3 = green(bl_col);
//    float greenValue4 = green(br_col);
//
//    float redValue1 = red(tl_col);
//    float redValue2 = red(tr_col);
//    float redValue3 = red(bl_col);
//    float redValue4 = red(br_col);
//
//    float blueValue1 = blue(tl_col);
//    float blueValue2 = blue(tr_col);
//    float blueValue3 = blue(bl_col);
//    float blueValue4 = blue(br_col);
//
//    println (mouseX, mouseY);
//
//    //color s_col = path_v.get(x1 + 40, y1);
//    println(redValue1, greenValue1, blueValue1, "next", redValue2, greenValue2, blueValue2, "next", redValue3, greenValue3, blueValue3, "next", redValue4, greenValue4, blueValue4);
//    if ((redValue1 == 0 && greenValue1 > 250 && blueValue1== 0) || (redValue2 == 0 && greenValue2 > 250 && blueValue2== 0) || (redValue3 == 0 && greenValue3 > 250 && blueValue3== 0) || (redValue4 == 0 && greenValue4 >250 && blueValue4 == 0))
//    {
//      text("working", width/2, height/2);
//      vcol=color(0, 255, 0);
//    } else 
//    {
//      vcol=color(255, 0, 0);
//    }
//  }
//}

void mouseClicked() {
  println (mouseX, mouseY);
}

void visual_path()
{
  Vector tuioObjectList = tuioClient.getTuioObjects();
  for (int i=0; i<tuioObjectList.size (); i++) {
    TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i);
    if (((tobj.getScreenX(width) >=569 && tobj.getScreenX(width)+40 <= 1052) && (tobj.getScreenY(height) >= 198 && tobj.getScreenY(height)+40 <= 367)) || ((tobj.getScreenX(width) >=569 && tobj.getScreenX(width)+40 <= 747) && (tobj.getScreenY(height) >= 198 && tobj.getScreenY(height)+40 <= 654)))
    {
      //text("working", width/2, height/2);
      vcol=color(0, 255, 0);
      //      if (tobj.getScreenX(width) >= 1050)
      //      {
      //      }
    } 
    else if (((tobj.getScreenX(width) >=433 && tobj.getScreenX(width)+40 <= 1164) && (tobj.getScreenY(height) >= 74 && tobj.getScreenY(height)+40 <= 489)) || ((tobj.getScreenX(width) >=433 && tobj.getScreenX(width)+40 <= 872) && (tobj.getScreenY(height) >= 74 && tobj.getScreenY(height)+40 <= 740)))
    {
      vcol=color(255, 255, 0);
    } 
    else
    {
      vcol=color(255, 0, 0);
    }
  }
}

void haptic_path()
{
  Vector tuioObjectList = tuioClient.getTuioObjects();
  for (int i=0; i<tuioObjectList.size (); i++) {
    TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i);
    if (((tobj.getScreenX(width) >=551 && tobj.getScreenX(width)+40 <= 1033) && (tobj.getScreenY(height) >= 203 && tobj.getScreenY(height)+40 <= 371)) || ((tobj.getScreenX(width) >=855 && tobj.getScreenX(width)+40 <= 1033) && (tobj.getScreenY(height) >= 203 && tobj.getScreenY(height)+40 <= 660)))
    {
      //text("working", width/2, height/2);
      //vcol=color(0, 255, 0);
      box.turnOff();
      box.stopPulses();
    } 
    else if (((tobj.getScreenX(width) >=433 && tobj.getScreenX(width)+40 <= 1164) && (tobj.getScreenY(height) >= 74 && tobj.getScreenY(height)+40 <= 489)) || ((tobj.getScreenX(width) >=724 && tobj.getScreenX(width)+40 <= 1164) && (tobj.getScreenY(height) >= 74 && tobj.getScreenY(height)+40 <= 736)))
    {
      //box.turnOnVal(100);
      //vcol=color(255, 255, 0);
      if (staticCal >= 255)
      {
        staticCal = staticCal - 48;
      }
      box.pulse(50, 60, staticCal);
    } 
    else
    {
      //vcol=color(255, 0, 0);
      box.pulse(50, 100, staticCal+48);
    }
  }
}
