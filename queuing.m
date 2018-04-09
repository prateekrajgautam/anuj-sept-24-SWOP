function[queue,failed]=queuing(seed,leech,q,queue)
num=1;
failed=[];
for i=1:q   
    for j=1:length(seed)    
        if length(queue(seed(1,j)).queue)<=q&&length(queue(seed(1,j)).queue)<i
            queue(seed(1,j)).queue=[queue(seed(1,j)).queue ,leech(1,num)];
                num=num+1;
                if num>length(leech)
                    break
                end
        end
    end
    if num>length(leech)
        break
    end
end
if num<=length(leech)
    failed=leech(1,num:length(leech));
end
end    