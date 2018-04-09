function[served,queue]=servingqueue(seed,queue,dep)
served=[];
for i=1:length(seed)
    if length(queue(seed(1,i)).queue)>dep
        served1=queue(seed(1,i)).queue(1,1:dep);
    elseif length(queue(seed(1,i)).queue)<=dep
        served1=queue(seed(1,i)).queue;
    end
    queue(seed(1,i)).queue=setdiff(queue(seed(1,i)).queue,served1);
    served=cat(2,served,served1);
end
