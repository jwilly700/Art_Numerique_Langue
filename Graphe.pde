void clearGraphe(){
   background(backgroundColor);
   graphe.beginDraw(); 
   graphe.clear();
   graphe.endDraw(); 
}

void drawLine(float x1, float y1, float x2, float y2){
  // Draw line
  if (x1 != 0){
    graphe.beginDraw();
    graphe.stroke(strokeColor);
    graphe.line(x1, y1, x2, y2);
    graphe.endDraw();
    image(graphe, 20, 20); 
  }
}


void drawAllCurves(float[] xPos, float[] yPos){
  noFill();
  stroke(0);
  beginShape();
  stroke(strokeColor);
  
  if (fillCurves){
    fill(fillCurvesColor); // fill the inside of the curve
    noStroke();
  }
  if(xPos.length > 2){
    curveVertex(xPos[0],yPos[0]);
    for (int i = 0; i < xPos.length; i += 2) {
      if(debugGraphe) ellipse(xPos[i], yPos[i], 3, 3); // Show the points 
      curveVertex(xPos[i],yPos[i]);
      
    }
    curveVertex(xPos[xPos.length-1],yPos[yPos.length-1]);
    endShape();
  }
}
