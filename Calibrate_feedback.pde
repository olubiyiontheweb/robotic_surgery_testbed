void calibrator()
{
  rect(rectx, recty, rectw, recth); //large rectangle
  line(linex1, liney1, linex2, liney2); // center line
  line(rectx, liney1, rectw+rectx, liney1);
  rect(dragbarx, dragbary, dragbarw, dragbarh);

  rect(rectx, recty-200, rectw, recth-320);
  pushStyle();
  fill(255);
  textSize(25);
  text("SAVE", rectx+6, recty-178);
  popStyle();

  if (dragbary<320) {
    fill(255);
    text("100%", 50, dragbary);
    fill (#FF030B);
    cal_value = staticCal = 255;  //260 /13
  } 
  else if (dragbary<340) {
    fill(255);
    text("95%", 50, dragbary);
    cal_value = staticCal = 247;
    fill (#FF036C);
  } 
  else if (dragbary<360) {
    fill(255);
    text("90%", 50, dragbary);
    cal_value = staticCal = 234;
    fill (#FF03FB);
  } 
  else if (dragbary<380) {
    fill(255);
    text("85%", 50, dragbary);
    cal_value = staticCal = 221;
    fill (#9903FF);
  } 
  else if (dragbary<400) {
    fill(255);
    text("80%", 50, dragbary);
    cal_value = staticCal = 208;
    fill (#2703FF);
  } 
  else if (dragbary<420) {
    fill(255);
    text("75%", 50, dragbary);
    cal_value = staticCal = 195;
    fill (#034CFF);
  } 
  else if (dragbary<440) {
    fill(255);
    text("70%", 50, dragbary);
    cal_value = staticCal = 182;
    fill (#03C6FF);
  } 
  else if (dragbary<460) {
    fill(255);
    text("65%", 50, dragbary);
    cal_value = staticCal = 169;
    fill (#03FFB5);
  } 
  else if (dragbary<480) {
    fill(255);
    text("60%", 50, dragbary);
    cal_value = staticCal = 156;
    fill (#03FF3F);
  } 
  else if (dragbary<500) {
    fill(255);
    text("55%", 50, dragbary);
    cal_value = staticCal = 143;
    fill (#40FF03);
  } 
  else if (dragbary<520) {
    fill(255);
    text("50%", 50, dragbary);
    cal_value = staticCal = 130;
    fill (#BFFF03);
  } 
  else if (dragbary<540) {
    fill(255);
    text("45%", 50, dragbary);
    cal_value = staticCal = 117;
    fill (#FFC503);
  } 
  else if (dragbary<560) {
    fill(255);
    text("40%", 50, dragbary);
    cal_value = staticCal = 104;
    fill (#FF4603);
  } 
  else if (dragbary<580) {
    fill(255);
    text("35%", 50, dragbary);
    cal_value = staticCal = 91;
    fill (#8E0153);
  } 
  else if (dragbary<600) {
    fill(255);
    text("30%", 50, dragbary);
    cal_value = staticCal = 78;
    fill (#018E5B);
  } 
  else if (dragbary<620) {
    fill(255);
    text("25%", 50, dragbary);
    cal_value = staticCal = 65;
    fill (#8E4101);
  } 
  else if (dragbary<640) {
    fill(255);
    text("20%", 50, dragbary);
    cal_value = staticCal = 52;
    fill (#03018E);
  } 
  else if (dragbary<660) {
    fill(255);
    text("15%", 50, dragbary);
    cal_value = staticCal = 39;
    fill (#8E1901);
  } 
  else if (dragbary<680) {
    fill(255);
    text("10%", 50, dragbary);
    cal_value = staticCal = 26;
    fill (#718E01);
  } 
  else if (dragbary<700) {
    fill(255);
    text("5%", 50, dragbary);
    cal_value = staticCal = 13;
    fill (#479076);
  } 
  else {
    fill(255);
    cal_value = staticCal = 0;
  }
}

//255, 242, 229, 216, 203, 190, 177, 164, 151, 138, 125, 112, 99, 86, 73, 60, 47, 34, 21, 8, 0
