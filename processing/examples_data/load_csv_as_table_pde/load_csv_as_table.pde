	

// The following short CSV file called "mammals.csv" is parsed 
// in the code below. It must be in the project's "data" folder.
//
// id,species,name
// 0,Capra hircus,Goat
// 1,Panthera pardus,Leopard
// 2,Equus zebra,Zebra

Table table;

void setup() {
  
  table = loadTable("../../../data/stages_with_id.csv", "header");

  println(table.getRowCount() + " total rows in table"); 

  for (TableRow row : table.rows()) {
    
    //int id = row.getInt("id");
    int sleep_phase = row.getInt("sleep_phase");
    String date = row.getString("date");
    String time = row.getString("time");
    String phase_name = "None";
    
    switch (sleep_phase) {
      case 0: phase_name = "AwAkE";
              break;
      case 1: phase_name = "lIght";
              break;
      case 2: phase_name = "dEEp";
              break;
      case 3: phase_name = "rEm";
              break;
    }
    
    println(date + " " + time + " (" + sleep_phase + ") " + phase_name);
  }
  
}

// Sketch prints:
// 3 total rows in table
// Goat (Capra hircus) has an ID of 0
// Leopard (Panthera pardus) has an ID of 1
// Zebra (Equus zebra) has an ID of 2
