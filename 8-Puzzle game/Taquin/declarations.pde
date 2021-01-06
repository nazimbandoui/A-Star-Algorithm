import java.util.*;
int [][] grid = {{4,6,8},{2,7,5},{0,3,1}};
int[][] first = {{0,0,0},{0,0,0},{0,0,0}};
int [][] goal = {{1,2,3},{8,0,4},{7,6,5}};
int cell_size = 350;
int border=4;
int text_size=150;
int text_size2=50;
int [] selected ={0,2};
int end=0;
int iter=0;
int inb;
long ts,te;
float h;
int g=0;
int delai=600;
ArrayList<node> road = new ArrayList<node> ();
PriorityQueue<node> child = new PriorityQueue<node> (1,new nodecomp());
ArrayList<node> visited = new ArrayList<node> ();


int [][] pred={ {0,0,0}, {0,0,0}, {0,0,0}} ;




Random random = new Random();
int min=10;
int max=50;


//Choix de l'heuristique
//0- Nombre de cases mal places (favorise le nombre de coups)
//1- Somme des distance euclidiennes entre les position actuelles des cases et leur position finale (favorise le temps d'execution)
int heuristic=0;
