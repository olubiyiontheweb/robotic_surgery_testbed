/***********************************************************************************
 *
 *  This code was written by Olubiyi OluwaTosin Gabriel
 *  
 *  Can the Application of Force Feedback Improve Accuracy in Robotic surgery?
 *  
 *  Copyright c) 2014 olubiyiontheweb.
 **********************************************************************************/


import TUIO.*;
import java.util.*;
import processing.serial.*;


HashMap <Integer, surgeon> surgery=new HashMap <Integer, surgeon>();
//HashMap <Integer, trail> see=new HashMap <Integer, trail>();

int isEx =0, isEnd=1, showCal=0, userCounterV=0, userCounterH=0, noOfslips=0, chgImg=0, wait=0, staticCal = 130;

PImage path_h, path_v, path_h1, path_v1, bg, start, knife, body;
PFont tektonpro;
int fiducial_id;
String screen= "menu";
//String write = "Please select the type of feedback you are evaluating";
//String write1 = "Haptic Feedback";
//String write2 = "Visual Feedback";
color vcol;
boolean starter=false, ended=false;
int ch_col;
color red = color(255, 0, 0);
int distance;
//int x1, y1;


float dragbarx = 117; //drag bar x
float dragbary = 250; //dragbar starting Y
float dragbarw = 35; //dragbar width
float dragbarh = 10; //dragbar height
float rectx = 100; // large rectangle x
float recty = 350; // large rectangle y
float rectw = 70; // large rectangle width
float recth = 350; // large rectangle height
float linex1 = 135;
float liney1 = 250;
float linex2 = 135;
float liney2 = 700;
int cal_value;
PrintWriter cal_setting, loggerv1, loggerh1, user, var_Calc;
//String filename = "data/calibrate.csv";

float tx[], ty[], values[];


TuioProcessing tuioClient;
VibroBox box;

void setup ()
{
  size(1400, 800);

  body = loadImage("human2.png");

  path_h = loadImage("human2h.png");
  path_v = loadImage("human2v.png");
  path_h1 = loadImage("humanfadeh.png");
  path_v1 = loadImage("humanfadev.png");
  knife = loadImage("knife.png");
  bg = loadImage("backg.png");
  start = loadImage("start.png");

  tektonpro = loadFont("TektonPro-BoldObl-50.vlw");

  //Initialising the Tuio object
  tuioClient  = new TuioProcessing(this);
  box=new VibroBox(this);

  colorMode(RGB);
  textFont(tektonpro);
  textSize(45);
  stroke(255);



  //  fileExists("calibrate.csv");

  File file = new File(dataPath("calibrate.csv"));
  if (!file.exists())
  {
    cal_setting = createWriter("data/calibrate.csv");
    cal_setting.println("Calibration_value" + "," + "PositionX" + "," + "PositionY" + "," + "Angle_of_rotation"); // // Writing to file
    cal_setting.flush(); // Writes the remaining data to the file
  } 
  else {
    // Load everything from the file
    String[] cal_positions = loadStrings("calibrate.csv");
    // Create a print writer (will clear the file)
    cal_setting = createWriter("data/calibrate.csv");
    if (cal_positions != null) {
      // Read all the lines from the file and convert to two integers (xy coordinate)
      for (int i = 0; i < cal_positions.length; i++) {
        cal_setting.println(cal_positions[i]);
        //println("working");
      }
      cal_setting.flush(); // Writes the remaining data to the file
    }
  }

  //  trail_file = createWriter("data/trailer.txt");
  //  trail_file.flush(); // Writes the remaining data to the file

  loggerv1 = createWriter("data/loggerv1.csv");
  loggerv1.flush();
  loggerh1 = createWriter("data/loggerh1.csv");
  loggerh1.flush();
  var_Calc = createWriter("data/var_Calc.csv");
  var_Calc.flush();

  vcol=color(#25BCCE);
}

void draw()
{

  background(0);
  if (screen=="menu")
  {
    starter=false;
    image(bg, 0, 0, 1400, 800);
    //    fill(255);
    //    text(write, (width/2)-700, 50);
    //    rect(650, 250, 300, 80);
    //    rect(650, 550, 300, 80);

    //    pushStyle();
    //    fill(0);
    //    text(write1, 660, 300);
    //    text(write2, 660, 600);
    //    popStyle();

    for (surgeon p : surgery.values ()) {
      p.bring_surgeon();
    }

    vcol=color(#25BCCE);
    reset();
  }



  if (screen=="haptics")
  {
    if (ended == true)
    {
      image(path_h1, 0, 0, 1400, 800);
      draw_trail("loggerh1.csv");

      for (surgeon p : surgery.values ()) {
        p.bring_surgeon();
      }

      if (isEnd == 1)
      {

        box.turnOff();
        box.stopPulses();

        userCounterH++;

        saveFrame("Haptic_user" + userCounterH + ".png");
        println("Image Saved.");
        isEnd = 2;

        String[] oldname = loadStrings("loggerh1.csv");
        String[] oldVal = loadStrings("var_Calc.csv");
        user = createWriter("data/Haptic_log4User"+ userCounterH +".csv");
        user.println("PositionX" + " , " + "PositionY" + " , " + "Line/corridor_following_distance_error" + " , " + "Number_of_slip_offs");
        if (oldname != null) {
          // Read all the lines from the file and convert to two integers (xy coordinate)

          for (int i = 0; i < oldname.length; i++) {
            if (oldVal != null) {
              user.println(oldname[i] + " , " + oldVal[i]);
            } 
            else
            {
              user.println(oldname[i]);
            }
          }
          user.close();
        }
      }
    } 
    else if (ended==false)
    {
      if (chgImg==1)
      {
        image(body, 0, 0, 1400, 800);
      }
      else
      {
        image(path_h, 0, 0, 1400, 800);
      }
      image(start, 475, 208, 200, 150);
      draw_trail("loggerh1.csv");

      if (showCal==1)
      {
        calibrator();
      }

      for (surgeon p : surgery.values ()) {
        p.bring_surgeon();
      }
    }


    //    text(write1, 50, 50);

    //saveFrame("calligraphic" + frameCount + ".png");

    //    for (trail t : see.values ()) {
    //      t.draw_trail();
    //    }
    //draw_trail("loggerh1.csv");
  }


  if (screen=="visual")
  {
    if (ended == true)
    {
      image(path_v1, 0, 0, 1400, 800);
      draw_trail("loggerv1.csv");

      for (surgeon p : surgery.values ()) {
        p.bring_surgeon();
      }

      if (isEnd == 1)
      {

        userCounterV++;

        saveFrame("Visual_user" + userCounterV + ".png");
        println("Image Saved.");
        isEnd = 2;

        String[] oldname = loadStrings("loggerv1.csv");
        String[] oldVal = loadStrings("var_Calc.csv");
        user = createWriter("data/Visual_log4User"+ userCounterV +".csv");
        user.println("PositionX" + " , " + "PositionY" + " , " + "Line/corridor_following_distance_error" + " , " + "Number_of_slip_offs");
        if (oldname != null) {
          // Read all the lines from the file and convert to two integers (xy coordinate)

          for (int i = 0; i < oldname.length; i++) {
            if (oldVal != null) {
              user.println(oldname[i] + " , " + oldVal[i]);
            } 
            else
            {
              user.println(oldname[i]);
            }
          }
          user.close();
        }
      }
    } 
    else if (ended==false)
    {
      image(path_v, 0, 0, 1400, 800);
      image(start, 559, 558, 200, 150);
      draw_trail("loggerv1.csv");

      for (surgeon p : surgery.values ()) {
        p.bring_surgeon();
      }
    }




    //    text(write2, 50, 50);
    //loadPixels();

    //    for (trail t : see.values ()) {
    //      t.draw_trail();
    //    }
    if (starter==true && isEx==0)
    {

      ch_col=1;
      isEx=1;
    }
    //fill(0,255,0);
    //rect (400,300,300,150);

    //    change_col();



    //fill(vcol);
    //rect(0, (height/2)-100, 100, 120);



    //    visual_path();
  }
}

void drag_calbar() {
  Vector tuioObjectList = tuioClient.getTuioObjects();
  for (int i=0; i<tuioObjectList.size (); i++) {
    TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i);
    dragbary = constrain(tobj.getScreenY(height), 280, 690);
    float sY = norm(tobj.getScreenY(height), 200, 690);
  }
}

// called when a fiducial is added to the scene
void addTuioObject(TuioObject tobj) 
{
  fiducial_id = tobj.getSymbolID();  //assignment

  if (fiducial_id==2 && screen=="menu")
  {
    surgeon p= new surgeon(0, 0, 40);  //when a symbol is dissurgeryed, show a shape, creating identifier of the class cursor
    surgery.put(new Integer(fiducial_id), p);
  }

  //  if (fiducial_id==2 && screen=="visual")
  //  {
  //    surgeon p= new surgeon(661, 630, 40);  //when a symbol is dissurgeryed, show a shape, creating identifier of the class cursor
  //    surgery.put(new Integer(fiducial_id), p); //creating identifier of the class knife
  //  }
}

// called when a fiducial is removed from the scene
void removeTuioObject(TuioObject tobj) 
{
}

// called when a fiducial is moved
void updateTuioObject (TuioObject tobj) 
{
  fiducial_id = tobj.getSymbolID();  //assignment

  if (fiducial_id==2 && screen=="menu")
  {


    //when a symbol is shown, bring the knife.
    surgeon p= new surgeon(tobj.getScreenX(width), tobj.getScreenY(height), 40);  //when a symbol is dissurgeryed, show a shape, creating identifier of the class cursor
    surgery.put(new Integer(fiducial_id), p); //creating identifier of the class knife

    if (tobj.getAngleDegrees()>=30 && tobj.getScreenY(height)>351 && tobj.getScreenY(height)<437 && tobj.getScreenX(width)>229 && tobj.getScreenX(width)<561)
    {
      screen="haptics";
    } 
    else if (tobj.getAngleDegrees()>=30 && tobj.getScreenY(height)>351 && tobj.getScreenY(height)<437 && tobj.getScreenX(width)>829 && tobj.getScreenX(width)<1160)
    {
      screen="visual";
    }
  }

  if (fiducial_id==2 && screen=="haptics")
  {

    if (wait==1)
    {
      if (tobj.getAngleDegrees()>=30 && tobj.getScreenY(height)>recty-200 && tobj.getScreenY(height)<recty-170 && tobj.getScreenX(width)>rectx && tobj.getScreenX(width)<rectx+rectw)
      {
        cal_setting.println(cal_value + "," + tobj.getScreenX(width) + "," + tobj.getScreenY(height) + "," + tobj.getAngleDegrees()); // Writing to file
        cal_setting.flush(); // append to the file
      }

      if (tobj.getAngleDegrees()>=30 && tobj.getScreenY(height)>liney1-20 && tobj.getScreenY(height)<liney2 && tobj.getScreenX(width)>rectx && tobj.getScreenX(width)<rectx+rectw)
      {
        drag_calbar();
      }
      surgeon p= new surgeon(tobj.getScreenX(width), tobj.getScreenY(height), 35);  //when a symbol is dissurgeryed, show a shape, creating identifier of the class cursor
      surgery.put(new Integer(fiducial_id), p); //creating identifier of the class knife
    }
    else
    {
      surgeon p= new surgeon(553, 263, 35);  //when a symbol is dissurgeryed, show a shape, creating identifier of the class cursor
      surgery.put(new Integer(fiducial_id), p); //creating identifier of the class knife
    }
  }

  if (fiducial_id==2 && screen=="haptics" && starter==true)
  {
    end_Tester();
    //when a symbol is shown, bring the knife.
    surgeon p= new surgeon(tobj.getScreenX(width), tobj.getScreenY(height), 35);  //when a symbol is dissurgeryed, show a shape, creating identifier of the class cursor
    surgery.put(new Integer(fiducial_id), p); //creating identifier of the class knife

    //    trail t= new trail(tobj.getScreenX(width), tobj.getScreenY(height));  //when a symbol is dissurgeryed, show a shape, creating identifier of the class cursor
    //    see.put(new Integer(fiducial_id), t); //creating identifier of the class knife



    //    if (starter==true)
    //    {
    thread("logg");
    haptic_path();


    //    }

    //    trail_file.println(tobj.getScreenX(width) + "," + tobj.getScreenY(height)); // Writing to file
    //    trail_file.flush(); // append to file
    //    if (tobj.getScreenX(width)>=1300)
    //    {
    //      starter=false;
    //      draw_trail(tobj.getScreenX(width), tobj.getScreenY(height));
    //    }
  }

  if (fiducial_id==2 && screen=="visual" && starter==false)
  {
    surgeon p= new surgeon(641, 612, 35);  //when a symbol is dissurgeryed, show a shape, creating identifier of the class cursor
    surgery.put(new Integer(fiducial_id), p); //creating identifier of the class knife
  }

  if (fiducial_id==2 && screen=="visual" && starter==true)
  {

    end_Tester();
    //when a symbol is shown, bring the knife.
    //    if (nwStarting == 0)
    //    {
    //      tobj.getScreenX(width) = 641;
    //      tobj.getScreenY(height) = 612;
    //      nwStarting = 1;
    //    }

    surgeon p= new surgeon(tobj.getScreenX(width), tobj.getScreenY(height), 35);  //when a symbol is dissurgeryed, show a shape, creating identifier of the class cursor
    surgery.put(new Integer(fiducial_id), p); //creating identifier of the class knife

    //    if (starter==true)
    //    {

    thread("logg");
    visual_path();


    //    }


    //    if (tobj.getScreenX(width)>=1000)
    //    {
    //
    //      ch_col=2;
    //    } else if (tobj.getScreenX(width)<300)
    //    {
    //
    //      ch_col=3;
    //    } else if (tobj.getScreenX(width)>300 && tobj.getScreenX(width) < 1000)
    //    {
    //      ch_col=1;
    //    }
    //    if (tobj.getScreenX(width)>=1300)
    //    {
    //      starter=false;
    //      
    //    }
  }

  if (fiducial_id==4)
  {

    starter=true;
  }

  if (fiducial_id==3)
  {
    screen="menu";
    //    reset();
    println("menu");
  }

  if (fiducial_id==5)
  {
    if (showCal==0)
    {
      chgImg=1;
      showCal=1;
      wait = 1;
    }
    else
    {
      chgImg=0;
      showCal=0;
      wait = 0;
    }
  }
}
