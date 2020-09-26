void logg()
{
  Vector tuioObjectList = tuioClient.getTuioObjects();
  for (int i=0; i<tuioObjectList.size (); i++) {
    TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i);
    delay(1000);
    if (screen == "haptics")
    {
      if (tobj.getScreenX(width)>=250)
      {
        loggerh1.println(tobj.getScreenX(width) + " , " + tobj.getScreenY(height)); // Writing to file
        loggerh1.flush(); // append to file

        variable_Calculator(tobj.getScreenX(width), tobj.getScreenY(height));

        //        var_Calc.println();
        //        loggerh1.flush(); // append to file
      }
    } 
    else if (screen == "visual")
    {
      if (tobj.getScreenX(width)>=250)
      {
        loggerv1.println(tobj.getScreenX(width) + " , " + tobj.getScreenY(height)); // Writing to file
        loggerv1.flush(); // append to file

        variable_Calculator(tobj.getScreenX(width), tobj.getScreenY(height));
      }
    }
  }
}
