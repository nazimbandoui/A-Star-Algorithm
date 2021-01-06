import java.util.Comparator;
class node 
{
  int [][] mat;
  double nodecost;
  double pathcost;
  double totalcost;
  node father;
  
  node(int[][] x , double xx , double xxx , node z)
  {
    mat=x;
    nodecost=xx;
    pathcost=xxx;
    totalcost=xx+xxx;
    father=z;
  }
  node (double a , double b)
  {
    int[][] temp = {{0,0,0},{0,0,0},{0,0,0}};
    nodecost=a;
    pathcost=b;
    totalcost=a+b;
    mat=temp;
  }
  String toString()
  {
    return "nodecost ==> "+nodecost +"  pathcost ==> "+pathcost+"   totalcost ==> "+totalcost+"\n" ;
  }
}

class nodecomp implements Comparator<node>
{
    int compare(node a , node b)
  {
    if (a.totalcost<b.totalcost)
      return -1;
    if (a.totalcost>b.totalcost)
      return 1;
    return 0;
  }
}
