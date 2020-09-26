void reset()
{

  ended=false;
  starter=false;
  isEnd=1;
  
  distance = 0;
  noOfslips = 0;
  if (screen == "visual")
  {
//    String[] oldname = loadStrings("loggerv1.csv");
//    String[] oldVal = loadStrings("var_Calc.csv");
//    user = createWriter("data/Visual_log4User"+ userCounterV +".csv");
//    user.println("PositionX" + " , " + "PositionY" + " , " + "Line/corridor_following_distance_error" + " , " + "Number_of_slip_offs");
//    if (oldname != null) {
//      // Read all the lines from the file and convert to two integers (xy coordinate)
//
//      for (int i = 0; i < oldname.length; i++) {
//        //user.println(oldname[i]);
//        if (oldVal != null) {
//          user.println(oldname[i] + " , " + oldVal[i]);
//          println(oldVal[i]);
//        } 
//        else
//        {
//          user.println(oldname[i]);
//        }
//        
//        //user.println("me");
//      }
//      user.close();
//    }
    loggerv1 = createWriter("data/loggerv1.csv");
    loggerv1.flush();

    //println("working");
    var_Calc = createWriter("data/var_Calc.csv");
    var_Calc.flush();
  }
  else if (screen == "haptics")
  {
//    String[] oldname = loadStrings("loggerh1.csv");
//    String[] oldVal = loadStrings("var_Calc.csv");
//    user = createWriter("data/Haptic_log4User"+ userCounterH +".csv");
//    user.println("PositionX" + " , " + "PositionY" + " , " + "Line/corridor_following_distance_error" + " , " + "Number_of_slip_offs");
//    if (oldname != null) {
//      // Read all the lines from the file and convert to two integers (xy coordinate)
//
//      for (int i = 0; i < oldname.length; i++) {
//        if (oldVal != null) {
//          user.println(oldname[i] + " , " + oldVal[i]);
//        } 
//        else
//        {
//          user.println(oldname[i]);
//        }
//      }
//      user.close();
//    }
    loggerh1 = createWriter("data/loggerh1.csv");
    loggerh1.flush();
  }

  var_Calc = createWriter("data/var_Calc.csv");
  var_Calc.flush();
}
