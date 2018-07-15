int rowNumberModelTable;

// Read CSV file and store it into an array[][]
String[][] readDataModelFromCsv(String file) {
  table = loadTable(file);

  data = new String[table.getRowCount()][];
  // Store the value of the rowIndex
  int rowIndex = 0;
  for (TableRow row : table.rows()) {    
    // Be careful  getColumnCount() is shit
    data[rowIndex] = new String[row.getColumnCount()];

    String[] dataTheme = {};
    for (int i = 0; i < row.getColumnCount(); ++i) {
      // add condition as getColumnCount() is shit
      if (row.getString(i) != null && row.getString(i) != "") {
        dataTheme = append(dataTheme, row.getString(i));
      }
    }
    data[rowIndex] = dataTheme;
    rowIndex++;
  }
  return data;
}

String[][] readDataModelFromCsv(String file, int index) {
  table = loadTable(file);
  rowNumberModelTable = table.getRowCount();
  
  data = new String[table.getRowCount()-index][];
  // Store the value of the rowIndex
  for (int j =0; j < table.getRowCount()-index ; j++){
    TableRow row = table.getRow(index + j);

  //for (TableRow row : table.rows()) {    
    // Be careful  getColumnCount() is shit
    data[j] = new String[row.getColumnCount()];

    String[] dataTheme = {};
    for (int i = 0; i < row.getColumnCount(); ++i) {
      // add condition as getColumnCount() is shit
      if (row.getString(i) != null && row.getString(i) != "") {
        dataTheme = append(dataTheme, row.getString(i));
      }
    }
    data[j] = dataTheme;
  }
  return data;
}




// Read the csv file for links
HashMap<String,String[]> readLinkFromCsv(String file){
  HashMap<String,String[]> hm = new HashMap<String,String[]>();

  table = loadTable(file);
  
  // Read line  
  for (TableRow row : table.rows()) {    
    // Read col of the line
    for (int i = 0; i < row.getColumnCount() ; i++){
      // Read sub element of the line, the plus 1 is to not take the first element which is the current element as a link, so the minus 1 is to reduce the length of the array
      String[] correspTmp = new String[row.getColumnCount() - i -1];
      for (int j = i; j < row.getColumnCount()-1 ; j++){
        correspTmp[j-i] = row.getString(j+1);
      }
      hm.put(row.getString(i),correspTmp);
    }
  }
  return hm;
}
