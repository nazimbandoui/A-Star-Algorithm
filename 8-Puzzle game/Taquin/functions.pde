//retourne le x du 0 dans la matrice
int nullx(int[][]a)
{
  for (int i=0 ; i<a.length ; i++)
  {
    for (int j=0 ; j<a.length ; j++)
    {
      if(a[i][j]==0)
      return i;
    }
  }
  return -1;
}

  //retourne le y du 0 dans la matrice
int nully(int[][]a)
{
  for (int i=0 ; i<a.length ; i++)
  {
    for (int j=0 ; j<a.length ; j++)
    {
      if(a[i][j]==0)
      return j;
    }
  }
  return -1;
}


boolean adjc(int x , int y)
{
  if(y==1)
  {
    if(x==0)
    if(grid[y][x+1] == 0 ||grid[y-1][x] == 0 || grid[y+1][x] == 0)
  return true;
     else return false;
    if(x==1)
    if(grid[y][x+1] == 0 ||grid[y-1][x] == 0 || grid[y+1][x] == 0||grid[y][x-1] == 0 )
  return true;
     else return false;
    if(x==2)
    if(grid[y][x-1] == 0 ||grid[y-1][x] == 0 || grid[y+1][x] == 0 )
  return true;
     else return false;
  }
    if(y==2)
  {
    if(x==0)
    if(grid[y][x+1] == 0 || grid[y-1][x] == 0)
  return true;
     else return false;
    if(x==1)
    if(grid[y][x+1] == 0 || grid[y-1][x] == 0||grid[y][x-1] == 0 )
  return true;
     else return false;
    if(x==2)
    if(grid[y][x-1] == 0 || grid[y-1][x] == 0 )
  return true;
     else return false;
  }
      if(y==0)
  {
    if(x==0)
    if(grid[y][x+1] == 0 || grid[y+1][x] == 0)
  return true;
     else return false;
    if(x==1)
    if(grid[y][x+1] == 0 || grid[y+1][x] == 0||grid[y][x-1] == 0 )
  return true;
     else return false;
    if(x==2)
    if(grid[y][x-1] == 0 || grid[y+1][x] == 0 )
  return true;
     else return false;
  }
  return false;
}

//deux matrices sont egales
boolean equal(int [][]a , int [][] b)
{
  for (int i=0 ; i<a.length ; i++)
  {
      for(int j=0 ; j<a[0].length ; j++)
      {
        if(a[j][i] != b [j][i])
        return false;
      }
    }
  return true;
}



//nouvelle matrice avec substitution entre a[x1][y1] et a[x2][y2]
int[][] newmat(int [][] b, int x1 , int y1 , int x2 , int y2)
{
  int a[][]={{b[0][0],b[0][1],b[0][2]},{b[1][0],b[1][1],b[1][2]},{b[2][0],b[2][1],b[2][2]}};
    int temp=a[x1][y1];
a[x1][y1]=a[x2][y2];
 a[x2][y2]=temp;
 return a;
}
//possibilité de faire bouger le 0 dans les quatre directions
int upok(int [][]a)
{
  if (nullx(a)<=2 && nullx(a)>=1)
    return 1;
  return 0;
}
int downok(int [][]a)
{
  if(nullx(a)<=1 && nullx(a)>=0)
    return 1;
  return 0;
}
int rightok(int [][]a)
{
  if(nully(a)<=1 && nully(a)>=0)
    return 1;
  return 0;
}
int leftok(int [][]a)
{
  if (nully(a)<=2 && nully(a)>=1)
  return 1;
  return 0;
}

// permute entre deux noeuds
void subnode(node x , node y)
{
  node z = new node (0,0);
  z.mat=cop(x.mat);
  z.nodecost=x.nodecost;
  z.pathcost=x.pathcost;
  z.totalcost=x.totalcost;
   x.mat=cop(y.mat);
  x.nodecost=y.nodecost;
  x.pathcost=y.pathcost;
  x.totalcost=y.totalcost;
    y.mat=cop(z.mat);
  y.nodecost=z.nodecost;
  y.pathcost=z.pathcost;
  y.totalcost=z.totalcost;
  
}
//tri une liste par ordre croissant du totalcost

//si 2 noeuds sont adjacants
boolean next(node a , node b)
{
  if (upok(a.mat)==1 && equal(newmat(a.mat,nullx(a.mat),nully(a.mat),nullx(a.mat)-1,nully(a.mat)),b.mat))
  return true;
  if (downok(a.mat)==1 && equal(newmat(a.mat,nullx(a.mat),nully(a.mat),nullx(a.mat)+1,nully(a.mat)),b.mat))
  return true;
  if (leftok(a.mat)==1 && equal(newmat(a.mat,nullx(a.mat),nully(a.mat),nullx(a.mat),nully(a.mat)-1),b.mat))
  return true;
   if (rightok(a.mat)==1 && equal(newmat(a.mat,nullx(a.mat),nully(a.mat),nullx(a.mat),nully(a.mat)+1),b.mat))
  return true;
  return false;
}

int[][] cop(int [][] a)
{
  int [][]b ={ {0,0,0}, {0,0,0}, {0,0,0}};
  for(int i=0;  i<3 ;i++)
  {
      for(int j=0; j<3 ;j++)
  {
    b[i][j]=a[i][j];
  }
  }
  return b;
}
//optimise les chemins des noeuds


//verifie si u existe dans ar
boolean unvisited( node u , ArrayList<node> ar)
{
  for(int i=0 ; i<ar.size() ;i++)
  {
    if(equal(u.mat,ar.get(i).mat))
    return false;
  }
  return true;
}

boolean currentokadd (node a , PriorityQueue<node> b)
{
  for(int i=0 ; i<b.size() ; i++)
  {
    if( (equal(b.peek().mat,a.mat) && b.poll().totalcost>a.totalcost))
    return false;
  }
  return true;
}

void update (node a ,PriorityQueue<node> b)
{
  ArrayList<node> p = new ArrayList<node> ();
  node l = null;
  boolean f=false;
  while(!b.isEmpty() && !f)
  { l=b.poll();
   p.add(l);
    if(equal(l.mat,a.mat))
      {f=true;
      break;}
  }
  if(f)
  {
    if (l.totalcost<a.totalcost)
    {
      l.pathcost=a.pathcost;
      l.totalcost=l.pathcost+l.nodecost;
    }
  }
  for(int i=0 ; i <p.size() ; i++)
  {
    b.add(p.get(i));
  }
}

void printq(PriorityQueue<node> b)
{
   node l = null;
    while(!b.isEmpty())
  {
    l=b.poll();
    print(l);
  }
}

boolean existinopen(node a ,PriorityQueue<node> b)
{
  node l=null;
  ArrayList<node> p = new ArrayList<node> ();
  boolean f = false;
  
  while(!b.isEmpty() && !f)
    { l=b.poll();
    p.add(l);
    if(equal(l.mat,a.mat))
      {f=true;
      break;}
    }
  for(int i=0 ; i <p.size() ; i++)
  {
    b.add(p.get(i));
  }
  return f;
}
void roadbuilder (node a,ArrayList<node> b)
{
 
  while(a!=null)
  {
    b.add(a);
    a=a.father;
  }
}

void mataff (int [][] a,int [][]b)
{
  for (int i = 0 ; i< a.length ; i++)
    {
        for (int j = 0 ; j< a[0].length ; j++)
        {
          a[i][j]=b[i][j];
        }
    }
}
void inv (ArrayList <node> list)
{
  int listsize=list.size();
  ArrayList <node> mclama19= new ArrayList <node> ();
  list.get(0).father=null;
  for(int i=1 ; i<list.size() ; i++)
  {
    list.get(i).father=list.get(i-1);
  }
    for(int i=list.size()-1 ; i>=0 ; i--)
  {
    mclama19.add(list.get(i));
  }
  list.clear();
   for(int i=0 ; i<listsize ; i++)
  {
    list.add(mclama19.get(i));
  }
}

void printmatrix(int [][]a)
{
  for (int i=0 ; i<a.length ; i++)
  {
    for (int j=0 ; j<a.length ; j++)
    {
      print(a[i][j]+" ");
    }
    print("\n");
  }
}

int fetchx (int a , int [] [] b)
{
 for (int i=0 ; i<b.length ; i++)
  {
    for (int j=0 ; j<b.length ; j++)
    {
         if(a==b[i][j])
         return i;
    }

  }
  return -1;
}

int fetchy (int a , int [] [] b)
{
 for (int i=0 ; i<b.length ; i++)
  {
    for (int j=0 ; j<b.length ; j++)
    {
         if(a==b[i][j])
         return j;
    }

  }
  return -1;
}
