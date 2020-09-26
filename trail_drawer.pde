void draw_trail(String file)
{

  String[] surg_position = loadStrings(file);

  if (surg_position != null) {
    //text("working", width/2, height/2);
    // Read all the lines from the file and convert to two integers (xy coordinate)
    trim(surg_position);
    tx = new float[surg_position.length]; //Allocate space to store the data so it can be plotted.
    ty = new float[surg_position.length]; //Do the same for the Y axis.

    for (int i = 0; i < surg_position.length; i++) //For each line...
    {
      //println(i);

      tx[i] = Float.valueOf(surg_position[i].substring(0, surg_position[i].indexOf(','))).floatValue();
      ty[i] = Float.valueOf(surg_position[i].substring(surg_position[i].indexOf(',')+1)).floatValue();
      //println(tx[i] +" , " +ty[i]);
    }

    for (int i = 0; i < tx.length; i++) //For each line...
    {
      strokeWeight(3);
      try {
        line(tx[i], ty[i], tx[i+1], ty[i+1]);
      }
      catch(Exception ex) {
      }
    }
  }
}


//void keyReleased() {
//  switch (key) {
//  case 'c':
//    clear();
//    background(255);
//    break;
//  case 's':
//    saveFrame("calligraphic" + frameCount + ".png");
//    println("Image Saved.");
//    break;
//  }
//}
