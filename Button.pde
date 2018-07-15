// the Button class
class Button {
  String label; // button label
  float x;      // top left corner x position
  float y;      // top left corner y position
  float w;      // width of button
  float h;      // height of button
  color textColor = textColorDefault; // color of the buttonLabel
  color previousTextColor; // Store the previous textColor
  PFont myFont; // Font for the buttonLabel
  String[] elementLinked;
  boolean clicked = false;
  float textSize = textSizeDefault;
  
  // constructor
  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
    previousTextColor = textColor;
  }
  
  void Draw() {
    if (debugGraphe && w > 0){
      fill(255);
      stroke(141);
      rect(x, y, w, h, 10);
    }
    textAlign(CENTER, CENTER);
    fill(textColor);
    myFont = createFont("Arial", textSize);
    textFont(myFont);
    text(label, x + (w / 2), y + (h / 2));
  }
  
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
  
  // Change the button text Size till it reach the textSizeMax
  void changeButtonTextSize(){
    if (this.textSize < textSizeMax){
      this.textSize += textIncrementInterval;
    }
    else {
      this.textSize = textSizeDefault;
    }   
  }
  
  // Set elementLinked attribute  
  void setElementLinked(){
    for(Map.Entry me : dataLinked.entrySet()){
      if(me.getKey() != null && me.getKey().toString().length() >0){
        String keyTmp = me.getKey().toString();
        
        if(this.label.equals(keyTmp)){
          // Loop on all the linked elements
          for(int i = 0; i < dataLinked.get(keyTmp).length; i++){
            this.elementLinked = dataLinked.get(keyTmp);
          }
        }
      }
    }
  }
}
