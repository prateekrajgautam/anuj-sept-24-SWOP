function[G,V,matrix,links,workingnodes,emptynodes]=graphfromexample(totalnoofnodes,links)
%[G,matrix,links,workingnodes,emptynodes]=graphfromexample(totalnoofnodes,links)
V=[];
matrix=zeros(totalnoofnodes);
for i=1:numel(links)/2
    matrix(links(i,1),links(i,2))=1;
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
workingnodes=V;
end