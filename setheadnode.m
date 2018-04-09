function[head,inner,longlinks,innerlinks]=setheadnode(G,cluster)
longlinks=[];
innerlinks=[];
len=numel(cluster);
head=[];
inner=[];
if len==1
    head=cluster(1,1);
    longlinks=setdiff(G(head).E,cluster);
else
    for i=1:len
        y=cluster(1,i);
        x=setdiff(G(y).E,cluster);
        longlinks1{i}=x;
        longlinkslen(1,i)=numel(x);
    end
% r=find(longlinkslen==max(longlinkslen));
r=find(cluster==min(cluster));
head=cluster(1,r(1,1));
longlinks=longlinks1{r(1,1)};
inner=setdiff(cluster,head);
innerlinks=intersect(G(head).E,inner);
end
end