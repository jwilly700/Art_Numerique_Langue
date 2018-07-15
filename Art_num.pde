import java.util.Map;

Button[][] buttons;

Table table;
Table table1;

// dataModel store all the data of each theme
String[][] dataModel = {};
// dataLinked store all the dataLinked to each button
HashMap<String,String[]> dataLinked;
// graphe used to draw lines
PGraphics graphe;


void setup() {
  background(backgroundColor);
  size (1280, 800);
  graphe = createGraphics(1280, 800);
  //fullScreen();
  smooth(0);

  // Load Table - Be careful with the csv format, there is a difference between te "," for french and the ";" for american. 
  // Sol : Convert to csv from googlexml file  
  //dataModel = readDataModelFromCsv(dataModelFile);
  dataModel = readDataModelFromCsv(dataModelFile, csvIndex);
  
  // Create HashMap for data correspondance
  dataLinked = readLinkFromCsv(linksFile);

  /*-- Create all the buttons --*/
  createAllButtons(dataModel);
}


void draw() {
  /*
  // draw a square if the mouse curser is over the button
   if (on_button.MouseIsOver()) {
   rect(200, 20, 50, 50);
   }
   else {
   // hide the square if the mouse cursor is not over the button
   background(0);
   }*/
  drawAllButtons(dataModel);
}


// Function to create all the buttons in the array data
void createAllButtons(String[][] data) {
  // prevButtonWidth used to calculate the space needed for the button
  float prevButtonWidth = 0;
  buttons = new Button[data.length][];
  for (int y = 0; y < data.length; y++) {
    buttons[y] = new Button[data[y].length];
    for (int x = 0; x < data[y].length; x++) {
      // Change the width according to the text size
      float buttonWidth = data[y][x].length()*textSizeDefault/2;
      float buttonHeigth = textSizeDefault*2;
      
      // added a random parameter for the y position of the button
      if (randomPos) buttons[y][x] = new Button(data[y][x], xButtonOffset + prevButtonWidth + random(0,20), (yButtonOffset + buttonHeigth)*(y+1) + random(-20,20), buttonWidth, buttonHeigth);
      else buttons[y][x] = new Button(data[y][x], xButtonOffset + prevButtonWidth, (yButtonOffset + buttonHeigth)*(y+1), buttonWidth, buttonHeigth);

      prevButtonWidth += buttonWidth + xButtonOffset;
      
      // Link the button clicked with the hashmap elements
      buttons[y][x].setElementLinked();
      
      // Change color of buttons with element linked
      if(buttons[y][x].elementLinked != null && buttons[y][x].elementLinked.length > 0){ buttons[y][x].textColor = textColorElementLinked; buttons[y][x].previousTextColor = buttons[y][x].textColor;}
    }
    prevButtonWidth = 0;
  }
}

void drawAllButtons(String[][] data) {
  for (int y = 0; y < data.length; y++) {
    for (int x = 0; x < data[y].length; x++) {
      buttons[y][x].Draw();
    }
  }
}
