//calcule l'heurestique d'une matrice (nombre de cases dans la mauvaise place)
int h1(int[][] a)
{
  int h=0;
  for( int i=0;i<3;i++)
  {
  for( int j=0;j<3;j++)
  {
    if(a[i][j]!=goal[i][j])
    h++;
  }
  }
  return h;
}



//retourne les coord du centre d'une case
double centeraxe (int x)
{
   return(x*cell_size+cell_size)/2;
}

double euclid(double a , double b , double x , double y)
{
  a=(a-x)*(a-x);
  b=(b-y)*(b-y);
  return Math.sqrt((double)a+b);
}



//calcule l'heurestique d'une matrice (distance euclidienne)
double h2 (int [] [] a)
{
  double h=0;
 for (int i=0 ; i<a.length ; i++)
  {
    for (int j=0 ; j<a.length ; j++)
    {
       //  h=h+euclid(centeraxe(i),centeraxe(j),centeraxe(fetchx(a[i][j],goal)),centeraxe(fetchy(a[i][j],goal)));
       if(a[i][j]==1)h=h+euclid(i,j,0,0);
       if(a[i][j]==2)h=h+euclid(i,j,0,1);
       if(a[i][j]==3)h=h+euclid(i,j,0,2);
       if(a[i][j]==4)h=h+euclid(i,j,1,2);
       if(a[i][j]==0)h=h+euclid(i,j,1,1);
       if(a[i][j]==5)h=h+euclid(i,j,2,2);
       if(a[i][j]==6)h=h+euclid(i,j,2,1);
       if(a[i][j]==7)h=h+euclid(i,j,2,0);
       if(a[i][j]==8)h=h+euclid(i,j,1,0);
       
       //h=h+euclid(i,j,fetchx(a[i][j],goal),fetchy(a[i][j],goal));
    }

  }
  return h;
}
