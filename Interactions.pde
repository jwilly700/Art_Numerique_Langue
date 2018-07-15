// mouse button clicked
void mousePressed()
{ 
  // Clear the graphe (all the lines)
  clearGraphe();
     
  // Set buttons[j][i].clicked attribute when the button and his links are activated
  checkButtonsPressed(dataModel);
  
  // Activate button by changing the attributes of the button clicked and his links
  //activateButtons(dataModel);
  bezierActivateButtons(dataModel);
}
void mouseWheel(MouseEvent event) {
   
  csvIndex += event.getCount();
  
    // Forbid to scroll to far up or down
  if (csvIndex >= rowNumberModelTable-10){ csvIndex = rowNumberModelTable-10;}
  else if (csvIndex < 1){ csvIndex = 0;}
  else setup();
}

void checkButtonsPressed(String[][] data){
  for(int y = 0; y < data.length; y++){
    for(int x = 0; x < data[y].length; x++){
        if (buttons[y][x].MouseIsOver()) {
          print("Clicked: ");
          println(buttons[y][x].label);
          buttons[y][x].clicked = true;
          
          // Check and process the element linked to the button 
          if(buttons[y][x].elementLinked != null){
            for(String element : buttons[y][x].elementLinked){
                for(int j = 0; j < data.length; j++){
                  for(int i = 0; i < data[j].length; i++){
                    if (element != null && element.equals(buttons[j][i].label)){
                      buttons[j][i].clicked = true;
                    }
                  }
                }
            }
          }
          // After finding the first button press quit the loop (dodge the clic on dual button on same time)
          x = data[y].length-1;
          y = data.length-1;
        }
    }
  }
}

void activateButtons(String[][] data){
  // Save the position of the previous button activated - For draw line
  float x1 = 0;
  float y1 = 0;

  for(int y = 0; y < data.length; y++){
    for(int x = 0; x < data[y].length; x++){
      
      if(buttons[y][x].clicked && buttons[y][x].label.length() != 0){
        // Change text Color
        buttons[y][x].textColor = textColorOnClick;
        
        // Change button TextSize 
        buttons[y][x].changeButtonTextSize();
        
        // Draw lines
        //println(buttons[y][x].label);
        drawLine(x1,y1,buttons[y][x].x,buttons[y][x].y); //<>//
        // Store the button position for next iteration
        x1 = buttons[y][x].x;
        y1 = buttons[y][x].y;
        
        buttons[y][x].clicked = false;
      }
      else{
        buttons[y][x].textColor = buttons[y][x].previousTextColor;
      }

    }
  }
}


void bezierActivateButtons(String[][] data){
  /*  
      use of :  
      for (int i = 0; i < coords.length; i += 2) {
        ellipse(coords[i], coords[i + 1], 3, 3);
      }
      to use that we need a function to store the buttonElementLinked position in an array[x0,y0, ... xn,yn]
  */
  
  float[] xPos = {};
  float[] yPos = {};
  
  for(int y = 0; y < data.length; y++){
    for(int x = 0; x < data[y].length; x++){  
      if(buttons[y][x].clicked && buttons[y][x].label.length() != 0){
        // Change text Color
        buttons[y][x].textColor = textColorOnClick;
        
        // Change button TextSize 
        buttons[y][x].changeButtonTextSize();
        
        // Store the button position for next iteration //<>//
        xPos = append(xPos,buttons[y][x].x);
        yPos = append(yPos,buttons[y][x].y);
        
        buttons[y][x].clicked = false;
      }
      else{
        buttons[y][x].textColor = buttons[y][x].previousTextColor;
      }
    }
  }
  drawAllCurves(xPos, yPos);
}
