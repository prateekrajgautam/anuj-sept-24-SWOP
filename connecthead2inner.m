function[links]=connecthead2inner(head,inner)
links=[];
n=numel(inner);
if n>0
    for i=1:n
        links=cat(1,links,[head,inner(1,i);inner(1,i),head]);
    end
end