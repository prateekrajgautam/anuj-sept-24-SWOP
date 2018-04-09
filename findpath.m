function[pathseq,nodes]=findpath(a0,b0,head,swop,V,matrix,totalnoofnodes)
a=find(V==a0);
b=find(V==b0);
h1=[];
h2=[];
% if %diff cluster
    
    pathseq1=[];
    pathseq12=[];
    pathseq2=[];
    mat=matrix(V,V);
    pathfound=0;
    %[pathseq,nodes]=findpathseq(a,b,head,swop,workingnodes)
    head=cell2mat(head);
    noofclusters=length(swop);
    pathseq=[];
    pathseq1=[];
    pathseq2=[];
    cont=0;
    a1=[];
    b1=[];
    a2=[];
    b2=[];
    % mat=[]
    if numel(intersect(a,V))==1
        for i=1:noofclusters
            if intersect((swop(i).clusternodes),a)==a
                h1=swop(i).headnode;
            end
        end
        if numel(intersect(a,head))==1
            pathseq1=cat(2,pathseq1,a);
        elseif numel(intersect(a,head))==0
            pathseq1=cat(2,pathseq1,a);
            for i=1:noofclusters
                if intersect((swop(i).clusternodes),a)==a
%                     h1=swop(i).headnode;
                    pathseq1=cat(2,pathseq1,swop(i).headnode);
                    break
                end
            end
        end
        cont=1;
    %     pathseq=cat(2,pathseq,pathseq1);
    end



    if numel(intersect(b,V))==1
        for i=1:noofclusters
            if intersect((swop(i).clusternodes),b)==b
                h2=swop(i).headnode;
            end
        end
        if numel(intersect(b,head))==1
            pathseq2=cat(2,pathseq2,b);
        elseif numel(intersect(b,head))==0
            pathseq2=cat(2,pathseq2,b);
            for i=1:noofclusters
                if intersect((swop(i).clusternodes),b)==b
%                     h2=swop(i).headnode;
                    pathseq2=cat(2,swop(i).headnode,pathseq2);
                    break
                end
            end
        end
        cont=cont+1;
    %     pathseq=cat(2,pathseq,pathseq2);
    end
    
    if h1==h2
       if numel(a)==numel(h1)
           pathseq2=[];
           pathseq2=b;
       end
       if numel(b)==numel(h2)
           pathseq1=[];
           pathseq1=a;
       end
    end
           
%     end
    if cont==2
        pathfound=0;
        a1=pathseq1(1,length(pathseq1));
        b1=pathseq2(1,1);
    %     a2=find(V==a1)
    %     b2=find(V==b1)
    a2=a1;
    b2=b1;
        pathseq12=[];
    %     if mat(a2,b2)~=1
            save('temp2')
    %         save('pathmatrix','mat','V','a2','b2','pathseq')
            traced=[];
            pathfound=0;
            path=[];
            depth=0;
            [pathseq12,pathfound,traced]=pathtracer(a2,b2,traced,mat,pathfound,path,depth);
            %%find pathseq in matrix form a2 to b2
    %     elseif mat(a2,b2)==1
    %         pathfound=1;
    %         pathseq12=[];         
    %     end
    end
    %     pathseq1
    %     pathseq12
    %     pathseq2
    if pathfound==1
        pathseq0=cat(2,pathseq1,pathseq12);
        pathseq=cat(2,pathseq0,pathseq2);
        nodes=length(pathseq);
        pathseq=V(1,pathseq);
    elseif pathfound==0
        nodes=0;
        pathseq=[];

    end
    
end