void variable_Calculator(int xpos, int ypos)
{
  if (screen == "haptics")
  {
    if (xpos > 1033 && (ypos < 660 && ypos > 204))
    {
      distance = xpos-1033;
      noOfslips++;
    }
    else if (ypos < 203 && (xpos < 1033 && xpos > 551))
    {
      distance = 203-ypos;
      noOfslips++;
    }
    else if ((xpos > 855 && xpos < width) && (ypos > 371 && ypos < height))
    {
      distance = xpos-855;
      noOfslips++;
    }
    else if ((xpos < 1033 && xpos > 855) && ypos > 660)
    {
      distance = 664634;//ypos-660;
      noOfslips++;
    }
    else if ((ypos > 203 && ypos < 371) && xpos < 551)
    {
      distance = 551-xpos;
      noOfslips++;
    }
    else if (ypos < 203 && xpos < 551)
    {
      distance = 203-ypos;
      noOfslips++;
    }
    else if (ypos < 203 && xpos > 1033)
    {
      distance = xpos-1033;
      noOfslips++;
    }
    else if (ypos > 660 && xpos > 1033)
    {
      distance = ypos-1033;
      noOfslips++;
    }
    else
    {
      distance = 0;
    }

    var_Calc.println(distance + " , " + noOfslips);
    var_Calc.flush();
  }
  else if (screen == "visual")
  {
    if (xpos < 569 && (ypos < 654 && ypos > 198))
    {
      distance = 569-xpos;
      noOfslips++;
    }
    else if (ypos < 198 && (xpos < 1052 && xpos > 569))
    {
      distance = 198-ypos;
      noOfslips++;
    }
    else if ((xpos > 748 && xpos < width) && (ypos > 367 && ypos < height))
    {
      distance = xpos-748;
      noOfslips++;
    }
    else if ((xpos < 748 && xpos > 569) && ypos > 654)
    {
      distance = ypos-654;
      noOfslips++;
    }
    else if ((ypos > 198 && ypos < 367) && xpos > 1052)
    {
      distance = xpos-1052;
      noOfslips++;
    }
    else if (ypos > 654 && xpos < 569)
    {
      distance = ypos-654;
      noOfslips++;
    }
    else if (ypos < 198 && xpos < 569)
    {
      distance = 198-ypos;
      noOfslips++;
    }
    else if (ypos < 198 && xpos > 1052)
    {
      distance = xpos-1052;
      noOfslips++;
    }
    else
    {
      distance = 0;
    }

    var_Calc.println(distance + " , " + noOfslips);
    var_Calc.flush();
  }
}
