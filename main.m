%main2
clc
clear all
close all
arrowsize=10;
axissize=5;
totalnoofnodes=26;
totalnoofworkingnodes=11;
g=3;%cluster size
d=2;%g-1; cluster distance
k=3;%nooflonglinks
randomorexample=2;% set it one for example & 2 for random network & 3 ot load from example
switch randomorexample
	case 1
        %% example 1
%         links= [1,12;1,15;1,16;7,15;7,19;7,21;12,16;12,21;12,25;13,12;13,16;14, 1;14,15;14,25;15, 7;15,19;15,26;16, 1;16,15;19, 7;19,21;21,14;21,19;25,14;25,15;26,13;26,16;26,19;];
        %% example 2
        links=[2,10;2,14;2,24;4,11;4,14;4,24;7,10;8,11;8,24;9,11;9,14;,10, 2;,10,24;,11, 9;,14, 8;,14,11;,14,25;,16,24;,24,10;,24,16;,25, 4;,25, 9];   
        
        [G,V,matrix,links,workingnodes,emptynodes]=graphfromexample(totalnoofnodes,links);
    case 3
        filename=input('enter filename to load \n ','s');
        load(filename)
         [G,V,matrix,links,workingnodes,emptynodes]=graphfromexample(totalnoofnodes,links);
    otherwise
        [G,V,matrix,links,workingnodes,emptynodes]=graph(totalnoofnodes,totalnoofworkingnodes,k)
end
rpt=0;
while rpt~=2
    rpt=rpt+1;
    if rpt==2%%update network when rpt==2
        [G,V,matrix,links,workingnodes,emptynodes]=graphfromexample(totalnoofnodes,links);

        if sum(sum(matrix(workingnodes,workingnodes))==0)>0
            [r,c]=find(sum(matrix(workingnodes,workingnodes))==0);
            l=[];
            for i=1:length(c)
                x=setdiff(workingnodes,workingnodes(1,c(1,i)));
%                 x=setdiff(workingnodes,workingnodes(1,c(i,1)));
                x1=randi(length(x));
                l=cat(1,l,[x1,workingnodes(1,c(i,1))])
            end
            links=cat(1,links,l);
            [G,V,matrix,links,workingnodes,emptynodes]=graphfromexample(totalnoofnodes,links);
        end

    end
    close all
    plotgraph(totalnoofnodes,matrix,axissize,arrowsize,V,emptynodes);
    saveas(gcf,['plotname'],'jpg');
    save demo1;
    [cluster,clusters,head,inner]=chustering(G,V,d,g,k,matrix,totalnoofnodes);
    cluster(1:length(cluster)).nodes
    maxc=0;
    clear swop head inner longlinks currentcluster result;
    for i=1:length(cluster)
        swop(i).clusternumber=i;
        swop(i).clusternodes=cluster(i).nodes;
        currentcluster=cluster(i).nodes;
        maxc=max(numel(currentcluster),maxc);
        [head{i},inner{i},longlinks{i},innerlinks{i}]=setheadnode(G,currentcluster);
        swop(i).headnode=head{i};
        swop(i).innernode=inner{i};
        swop(i).longlinks=longlinks{i};
        swop(i).innerlinks=innerlinks{i};
        result{i}=swop(i);
        swop(i)


        addlinks{i}=connecthead2inner(head{i},inner{i});
        if numel(addlinks{i})>0
            links=unique(cat(1,links,addlinks{i}),'rows');
        end    
    end
    maxclustersize=maxc
end
save('demoexample','totalnoofnodes','links')
[workinnodes,degreein,degreeout,probability_of_leaving_first]=probabilityofleaving(workingnodes,matrix)



% [pathseq,nodes]=findpath(node1,node2,head,swop,V,matrix,totalnoofnodes);
[pathfound,pathlength,path]=allpath(V,matrix,head,swop,totalnoofnodes);
[prob,pathlengthdist]=plotprobability(pathlength);

        

