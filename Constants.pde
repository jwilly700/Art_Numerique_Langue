/*  Background */
int backgroundColor = 255;

/*  CSV file */
  String dataModelFile = "ressources/Thème _ langue - thèmes.csv";
  //String linksFile = "ressources/donne_table3.csv";
  String linksFile = "ressources/Thème _ langue - correspondances.csv";  
  int csvIndex = 0;

/*  Buttons attributes */
  /* Buttons Text */
    color textColorDefault = color(122); 
    color textColorOnClick = color(0,0,200);   // rgb format
    color textColorElementLinked = color(0); 
    float textSizeDefault = 14;
    float textIncrementInterval = 1; // Increment of the text after each click
    float textSizeMax = 30; // Maximal value of the text

  // Offset between each buttons
  int xButtonOffset = 10; 
  int yButtonOffset = 20; 

  // RandomPosition enable
  boolean randomPos = true;
  
/* Graphe attributes */
  color strokeColor = color(150); // Lines color
  
  // If fill the inside of the curves
  boolean fillCurves = false;
  color fillCurvesColor = color(60, 160, 0);
  
  
  
/* Debbugging options */
  boolean debugGraphe = false;
