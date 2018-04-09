function[pcycle]=findpcyclenew(G,a11,b11)
for i=1:length(G)
    
net(i).node=G(i).V
net(i).edge=G(i).E
end
noofnodes=length(net);
pcycle{noofnodes}=[];
net;
% matrix;
loopset=[];
parentnode=0;
stage=1;
loopseta{noofnodes}=[];
% for i=1:noofnodes
for i=a11
    a1=net(i).edge;
    lena1=length(a1);
    num=1;
    temploop(1,num)=i;
    
    [temploop,loopset,loopseta]=newfunction(a1,temploop,num,loopset,stage,noofnodes,net,loopseta,b11);
    
end

for i=1:noofnodes
    if numel(loopseta{i})>0
        pcycle1{i}=sortrows(unique(loopseta{i},'rows'),1);
        pcycle{i}=removeidenticalcycle(pcycle1{i});
%         pcycle{i}=pcycle1{i};
    end
end


% celldisp(pcycle1)
end

function[temploop,loopset,loopseta]=newfunction(a1,temploop,num,loopset,stage,noofnodes,net,loopseta,b11)
% a1
% lena1=length(a1);
[c]=newfn2(temploop,a1);
lenc=length(c);
for i=1:lenc
    b2=c(1,i);
%     [loopfound,loop]=checkloop(temploop,b2);
[loopfound,loop]=checkloop(temploop,b11);
    if loopfound==0
        num=num+1;
        lastnode=c(1,i);
        temploop(1,num)=c(1,i);
        [temploop,loopset,loopseta]=newfunction(net(lastnode).edge,temploop,num,loopset,stage,noofnodes,net,loopseta,b11);
        num=num-1;
        temploop=temploop(1,1:num);
    end
    if loopfound==1
        [rr,cc]=size(loop);
        [r2,c2]=size(loopseta{cc});
        loopseta{cc}(r2+1,:)=loop;
        %%
        num=num-1;
        temploop=temploop(1,1:num);
        break
        
        %%
    end
end
end



function[c]=newfn2(temploop,a1)
if length(temploop)>0
    if length(temploop)==1
        c=setdiff(a1,temploop(1,length(temploop)));
%                 c=a2;
    end
    if length(temploop)>1
        c=setdiff(a1,temploop(1,length(temploop)-1:length(temploop)));
    end
end
if length(temploop)==0
    c=a1;
end
end

function[loopfound,loop]=checkloop(temploop,b2)
loopfound=0;
loop=[];
temploop1=temploop;
    if intersect(temploop1,b2)~=0 
        temploop=cat(2,temploop1,b2);
%         loopfound=1;
        [int,index,temp]=intersect(temploop1,b2);
        storeloop=temploop(1,index:length(temploop));
        if length(storeloop)>2
            loopfound=1;
            loopa=storeloop(1,1:length(storeloop)-1);
            for kk=1:length(loopa)
                xxx=circshift(loopa',kk)';
                if min(xxx)==xxx(1,1)
                    loop=xxx;
                    break
                end
            end
        end
    end
end    


function[out]=removeidenticalcycle(in)
[r,c]=size(in);
for i=1:r
    x=in(i,:);
    x1=fliplr(x);
    x2=circshift(x1',1)';
    if x2(1,2)<x(1,2)
        out1(i,:)=x2;
    else
        out1(i,:)=x;
    end       
end
out=unique(out1,'rows');
end