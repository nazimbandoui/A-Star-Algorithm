import java.util.*;
void random_shuffle (int max , int min)
{
  int times =new Random().nextInt(max-min)+min;
  int x,y;
  for(int i=0 ; i<times ; i++)
  {
     int direction = new Random().nextInt(4);
     if (direction==0 && leftok(grid)==1)
     {
       x=nullx(grid);
       y=nully(grid);
       grid[nullx(grid)][nully(grid)]=grid[nullx(grid)][nully(grid)-1];
       grid[x][y-1]=0;
     }
     if (direction==1 && downok(grid)==1)
     {//ok
       x=nullx(grid);
       y=nully(grid);
       grid[nullx(grid)][nully(grid)]=grid[nullx(grid)+1][nully(grid)];
       grid[x+1][y]=0;
     }
     if (direction==2 && upok(grid)==1)
     {
       x=nullx(grid);
       y=nully(grid);
       grid[nullx(grid)][nully(grid)]=grid[nullx(grid)-1][nully(grid)];
       grid[x-1][y]=0;
     }
     if (direction==3 && rightok(grid)==1)
     {
       x=nullx(grid);
       y=nully(grid);
       grid[nullx(grid)][nully(grid)]=grid[nullx(grid)][nully(grid)+1];
       grid[x][y+1]=0;
     }
   
  }
}
