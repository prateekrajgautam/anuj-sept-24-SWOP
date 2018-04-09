function[cluster,clusters,head,inner]=chustering(G,V,d,g,k,matrix,totalnoofnodes)
%function[cluster,clusters,head,inner]=chustering(G,V,d,g,k,matrix,totalnoofnodes)
clusters=[];,head=[];,inner=[];cluster=[];
v=V;
num=1;
while numel(v)~=0
%     x=randi(g);
    longlinks=0;
    clu1=[];
    for i=1:min(g,numel(v))
%     for i=1:min(x,numel(v))
        y=v(1,i);
        x1=[y-d:y+d];
        find(x1<1);
        rr=find(x1<1);
        x1(:,rr)=x1(:,rr)+totalnoofnodes;
        if i==1
            range=x1;
        else
            if numel(intersect(y,range))==0
                break
            end
        end

        longlinks=longlinks+numel(setdiff(G(y).E,x1));
        if longlinks<=g
            clu1=cat(2,clu1,y);
        else
            break
        end
    end
    cluster(num).nodes=clu1;
    num=num+1;
    v=setdiff(v,clu1);
end
        
       