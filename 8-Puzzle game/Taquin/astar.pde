

void astar()
{
  node currentnode = new node(grid,h1(grid),0,null);
  if(heuristic==1)
  currentnode = new node(grid,h2(grid),0,null);
  print("Finding the shortest path ...\n");
  child.add(currentnode);
  while(end==0)
  {
    currentnode=child.poll();
    if(equal(currentnode.mat,goal))
      {end=1;break;}
    if(existinopen(currentnode,child))
      update(currentnode,child);
     else
     {
       
        if(upok(currentnode.mat)==1)
         { 
           int[][] temp=newmat(currentnode.mat,nullx(currentnode.mat),nully(currentnode.mat),nullx(currentnode.mat)-1,nully(currentnode.mat));
           if((unvisited((new node(temp,0,0,currentnode)),visited))) 
           {
             if(heuristic==0)
             child.add(new node(temp,h1(temp),currentnode.pathcost+1,currentnode));
             else
             child.add(new node(temp,h2(temp),currentnode.pathcost+1,currentnode));
              //child.add(new node(temp,h1(temp),currentnode.pathcost+1));
           }
        }
        
        
        if(downok(currentnode.mat)==1)
         { 
           int[][] temp=newmat(currentnode.mat,nullx(currentnode.mat),nully(currentnode.mat),nullx(currentnode.mat)+1,nully(currentnode.mat));
           if((unvisited((new node(temp,0,0,currentnode)),visited))) 
           {
             if(heuristic==0)
             child.add(new node(temp,h1(temp),currentnode.pathcost+1,currentnode));
             else
             child.add(new node(temp,h2(temp),currentnode.pathcost+1,currentnode));
           }
        }
        
        if(leftok(currentnode.mat)==1)
         { 
           int[][] temp=newmat(currentnode.mat,nullx(currentnode.mat),nully(currentnode.mat),nullx(currentnode.mat),nully(currentnode.mat)-1);
           if((unvisited((new node(temp,0,0,currentnode)),visited))) 
           {
             if(heuristic==0)
             child.add(new node(temp,h1(temp),currentnode.pathcost+1,currentnode));
             else
             child.add(new node(temp,h2(temp),currentnode.pathcost+1,currentnode));
             
           }
        }
        
        if(rightok(currentnode.mat)==1)
         { 
           int[][] temp=newmat(currentnode.mat,nullx(currentnode.mat),nully(currentnode.mat),nullx(currentnode.mat),nully(currentnode.mat)+1);
           if((unvisited((new node(temp,0,0,currentnode)),visited))) 
           {
             if(heuristic==0)
             child.add(new node(temp,h1(temp),currentnode.pathcost+1,currentnode));
             else
             child.add(new node(temp,h2(temp),currentnode.pathcost+1,currentnode));
           }
        }
     }
     visited.add(currentnode);iter++;
    
  }

  print("Path found\n");
  print("Building path ...\n");
  roadbuilder(currentnode,road);
  inv(road);
   print("Build done\n");
  
}
