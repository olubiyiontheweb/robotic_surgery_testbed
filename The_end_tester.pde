void end_Tester()
{
  Vector tuioObjectList = tuioClient.getTuioObjects();
  for (int i=0; i<tuioObjectList.size (); i++) {
    TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i);
    if (fiducial_id==2 && screen=="visual" && starter == true)
    {
      if (tobj.getScreenX(width) >= 1010 && tobj.getScreenX(width) <= 1025 && (tobj.getScreenY(height) >= 246 && tobj.getScreenY(height) <= 315))
      {
        //text("working", width/2, height/2);

        surgeon p= new surgeon(1008, 259, 40);  //when a symbol is dissurgeryed, show a shape, creating identifier of the class cursor
        surgery.put(new Integer(fiducial_id), p); //creating identifier of the class knife
        starter=false;
        ended = true;
      }
    } 
    else if (fiducial_id==2 && screen=="haptics" && starter == true)

    {
      if (tobj.getScreenX(width) >= 906 && tobj.getScreenX(width) <= 982 && (tobj.getScreenY(height) >= 610 && tobj.getScreenY(height) <= 625))
      {
        //text("working", width/2, height/2);

        surgeon p= new surgeon(1008, 259, 40);  //when a symbol is dissurgeryed, show a shape, creating identifier of the class cursor
        surgery.put(new Integer(fiducial_id), p); //creating identifier of the class knife
        starter=false;
        ended = true;
      }
    }
  }
}
