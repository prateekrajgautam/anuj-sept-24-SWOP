function[a b]=randselect(in,n)
if length(in)>n
    x=uniqrandint(length(in)-1,min(n,length(in)))+1;
    a=in(1,x);
elseif length(in)<=n
    a=in;
end
b=setdiff(in,a);
end

function[out]=uniqrandint(in,l)
%[out]=uniqrandint(length)
%[ 1     3     5     9    10]=uniqrandint(5)
out=[];
while numel(out)~=l
a=unique(randint(1,4*l-1,in)+1);
out=[];
if numel(a)>=l
    out=a(1,1:l);
    break
end
end
end