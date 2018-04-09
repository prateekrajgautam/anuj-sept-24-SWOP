function[G,V,matrix,links,workingnodes,emptynodes]=graph(totalnoofnodes,totalnoofworkingnodes,k)
%[G,matrix,links,workingnodes,emptynodes]=graph(totalnoofnodes,totalnoofworkingnodes,k)
V=[];
matrix1=zeros(totalnoofnodes);
matrix=zeros(totalnoofnodes);
workingnodes=[];
while numel(workingnodes)~=totalnoofworkingnodes
    workingnodes=unique(randi(totalnoofnodes,1,totalnoofworkingnodes));
end
for i=1:totalnoofnodes
    x=workingnodes(:,unique(randi(totalnoofworkingnodes,1,k)));    
    for j=1:length(x);
        if i~=x(1,j)
            matrix1(i,x(1,j))=1;
        end
    end
        x=[];
end

% emptynodes1=SETDIFF([1:totalnoofnodes],x);
remove=SETDIFF([1:totalnoofnodes],workingnodes)
links=[];
matrix=matrix1;
for i=1:length(remove)
    matrix(remove(1,i),:)=zeros(1,totalnoofnodes);
    matrix(:,remove(1,i))=zeros(totalnoofnodes,1);
end
for i=1:totalnoofnodes
    temp=find(matrix(i,:)==1);
    for j=1:length(temp);
        links=cat(1,links,[i,temp(1,j)]);
    end    
end
emptynodes=intersect(find(sum(matrix)==0),find(sum(matrix')==0));
% emptynodes=intersect(emptynodes1,emptynodes2);
for i=1:totalnoofnodes
    G(i).V=[];
    G(i).E=[];
    if sum(matrix(i,:))~=0
        V=cat(2,V,i);
        E{i}=find(matrix(i,:)==1);
        G(i).V=i;
        G(i).E=E{i};
    end
    G(i);
end
end