


void setup()
{
  //Title
  surface.setTitle("Jeu du Taquin");
  //Resizable or not
  surface.setResizable(false);
  //window size , surface.setSize(x,y);
  surface.setSize(grid.length*cell_size+border+500,grid.length*cell_size+border+400);
  //surface.setLocation()
  surface.setLocation(600,0);
 /* println("Generation aleatoire de la matrice");
  random_shuffle(max,min);
  println("Matrice : ");
  printmatrix(grid);
  println("---------------------------");*/
  ts=System.currentTimeMillis();
  astar();
  te=System.currentTimeMillis()-ts;
  h=(float)te/1000;
  inb=road.size();
  mataff(first,road.get(0).mat);
  
}
int id=0;
int exec=0;
int done=0;
boolean cv=false;
boolean cv2 =false;
void draw()
{
    update(mouseX, mouseY);
 background(255);
 checkcolor();
 fill(todraw1);
 rect(rect1X, rect1Y, rect1SizeX, rect1SizeY);
  textSize(60);
 textAlign(CENTER,CENTER);
 fill(0);
 text("Prev. <",rect1X+190,rect1Y+45);
 fill(todraw2);
  rect(rect2X, rect2Y, rect2SizeX, rect2SizeY);
   textSize(60);
 textAlign(CENTER,CENTER);
 fill(0);
 text("Next >",rect2X+190,rect2Y+45);
   fill(todraw3);
    rect(rect3X, rect3Y, rect3SizeX, rect3SizeY);
    textSize(55);
 textAlign(CENTER,CENTER);
 fill(0);
 text("Reset",rect3X+180,rect3Y+45);

 fill(todraw4);
  fill(0);
     textSize(text_size2);
       textAlign(LEFT,CENTER);
   
       text("Mouvement : "+exec+"/"+(inb-1),50,cell_size*3+100);
      text("Total algorithm's iteration : "+iter,50,cell_size*3+170);
      text("Execution time : "+h+" Sec.",50,cell_size*3+240);
      if(g==1)
      mataff(grid,first);
 
 textSize(10);
 textAlign(CENTER,CENTER);
 fill(0);
 text("BANDOUI NAZIM USTHB 2019",grid.length*cell_size+border+410,grid.length*cell_size+border+380);
  for (int i=0;i<grid.length;i++)
  {
    for (int j=0;j<grid[0].length;j++)
    {

      //stroke(color) bordure de l'objet a dessiner
      stroke(0);
      //fill(color) couleur de l'objet a dessiner
      if(equal(grid,goal))
      {fill(#16F517);done=1;}
      else
      fill(#FFFFFF);
      //strokeWeight(color) epaisseur de la bordure
      strokeWeight(border);
      //rect(x,y,largeur,hauteur)
      rect(i*cell_size,j*cell_size,cell_size,cell_size);
      //info text
      textSize(text_size);
      fill(#F51616);
      String number="";
      if(grid[j][i]!=0)
      number=number+grid[j][i];
    textAlign(CENTER,CENTER);
    //text(text,x,y)
    text(number,i*cell_size+cell_size/2,j*cell_size+cell_size/2);
  }
  }
delay(0);
}
void mousePressed() {
  if (rect2Over) {
    if (id<road.size() && done==0)
    {
      g=0;
      if(id<=0)
      id=0;
     done=0;
       id++;
    mataff(grid,road.get(id).mat);
    exec++;
    }
  }
    if (rect1Over) {
    if (id>0)
    {
    id--;
    mataff(grid,road.get(id).mat);
    done=0;
    exec--;
    }
    if(id==0)
    g=1;
  }
  if (rect3Over)
  {
id=0;
exec=0;
done=0;
    g=1;
  }
}
