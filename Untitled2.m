clear
clc
load temp2
traced=[];
pathfound=0;
path=[];
depth=0;
a2=1;
b2=3;

[pathseq12,pathfound,traced]=pathtracer(a2,b2,traced,mat,pathfound,path,depth)
x=cat(2,a2,pathseq12);
x2=cat(2,x,b2)