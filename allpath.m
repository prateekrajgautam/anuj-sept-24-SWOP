function[pathfound,pathlength,path]=allpath(V,matrix,head,swop,totalnoofnodes)
pathfound=zeros(length(matrix));
pathlength=zeros(length(matrix));
for i=1:length(V)
    for j=1:length(V)
        if i~=j          
            save('temp')
            [path{V(1,i),V(1,j)},pathlength(i,j)]=findpath(V(1,i),V(1,j),head,swop,V,matrix,totalnoofnodes);
            if pathlength(V(1,i),V(1,j))~=0
                pathfound(V(1,i),V(1,j))=1;
            end
        end
    end
end
end