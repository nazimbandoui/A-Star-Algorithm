
int rect2X= grid.length*cell_size+border+50, rect2Y= 50;      // Position of square button
int rect2SizeX = 350;     // Diameter of rect
int rect2SizeY = 100;     // Diameter of rect
color rect2Color=#FFFFFF ;
color rect2Highlight=125;
boolean rect2Over = false;
color todraw2;

int rect1X= grid.length*cell_size+border+50, rect1Y=rect2Y+50+rect2SizeY;      // Position of square button
int rect1SizeX = 350;     // Diameter of rect
int rect1SizeY = 100;     // Diameter of rect
color rect1Color=#FFFFFF;
color rect1Highlight=125;
boolean rect1Over = false;
color todraw1;

int rect3X= grid.length*cell_size+border+50, rect3Y=(grid.length-1)*cell_size;      // Position of square button
int rect3SizeX = 350;     // Diameter of rect
int rect3SizeY = 100;     // Diameter of rect
color rect3Color=#FFFFFF;
color rect3Highlight=125;
boolean rect3Over = false;
color todraw3;

int rect4X= grid.length*cell_size+border+50, rect4Y=rect3Y+50+rect3SizeY;      // Position of square button
int rect4SizeX = 350;     // Diameter of rect
int rect4SizeY = 100;     // Diameter of rect
color rect4Color=0;
color rect4Highlight=51;
boolean rect4Over = false;
color todraw4;


void update(int x, int y) {
    if ( overRect(rect1X, rect1Y, rect1SizeX, rect1SizeY) )
    {
    rect1Over = true;
    rect2Over = false;
    rect3Over = false;
    rect4Over = false;
    }
    else if ( overRect(rect2X, rect2Y, rect2SizeX, rect2SizeY) ) {
    rect2Over = true;
    rect1Over = false;
    rect3Over = false;
    rect4Over = false;
  } 
      else if ( overRect(rect3X, rect3Y, rect3SizeX, rect3SizeY) ) {
    rect2Over = false;
    rect1Over = false;
    rect3Over = true;
    rect4Over = false;
  }
      else if ( overRect(rect4X, rect4Y, rect4SizeX, rect4SizeY) ) {
    rect2Over = false;
    rect1Over = false;
    rect3Over = false;
    rect4Over = true;
  }else {
    rect1Over = false;
    rect2Over = false;
    rect3Over = false;
    rect4Over = false;
  }

}


boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
void checkcolor()
{
  if (rect1Over) {
    todraw1=(rect1Highlight);
  } else {
    todraw1=(rect1Color);
  }
    if (rect2Over) {
    todraw2=(rect2Highlight);
  } else {
    todraw2=(rect2Color);
  }
    if (rect3Over) {
    todraw3=(rect3Highlight);
  } else {
    todraw3=(rect3Color);
  }
    if (rect4Over) {
    todraw4=(rect4Highlight);
  } else {
    todraw4=(rect4Color);
  }
}
