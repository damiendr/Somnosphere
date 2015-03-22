int[] cells = {1,0,1,0,1,0,0,0,1,1,0,0,0,0,1,0,1,0,0,0};
 
int generation = 0;
 
 
 
void setup() {
 
size(400, 800);
 
frameRate(2);
 
// draw the first generation
 
for (int a=0; a<cells.length; a++) {
 
if (cells[a] == 0) {
 
fill(255);
 
} else {
 
fill(0);
 
}
 
rect(a*20, generation*20, 20, 20);
 
}
 
generation++;
 
}
 
 
 
void draw() {
 
// calculate the new generation
 
int[] newcells = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
 
for(int i=1; i<cells.length-1; i++) {
 
int left = cells[i-1];
 
int middle = cells[i];
 
int right = cells[i+1];
 
if (left==1 && middle==1 && right==1) newcells[i] = 0;
 
else if (left==1 && middle==1 && right==0) newcells[i] = 1;
 
else if (left==1 && middle==0 && right==1) newcells[i] = 0;
 
else if (left==1 && middle==0 && right==0) newcells[i] = 1;
 
else if (left==0 && middle==1 && right==1) newcells[i] = 1;
 
else if (left==0 && middle==1 && right==0) newcells[i] = 0;
 
else if (left==0 && middle==0 && right==1) newcells[i] = 1;
 
else if (left==0 && middle==0 && right==0) newcells[i] = 0;
 
}
 
cells = newcells;
 
// draw the new generation
 
for (int a=0; a<cells.length; a++) {
 
if (cells[a] == 0) {
 
fill(255);
 
} else {
 
fill(0);
 
}
 
rect(a*20, generation*20, 20, 20);
 
}
 
generation++;
 
}
