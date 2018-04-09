clc
clear
close 
n=100;
arrival=3;
lam=arrival/n;
departure=1;
u=departure/n;
q=5;
totalpeer=[1:n];
seed=randi(n,1,1);
servers=1;
peer=setdiff(totalpeer,seed);
loop=1;
queue(n).queue=[];
successrate=[];
failurerate=[];
num=0;
while loop==1
    num=num+1;
    [leech peer]=randselect(peer,randi(arrival,1,1));
    [queue,failed]=queuing(seed,leech,q,queue);
    queue(seed).queue;
    [served,queue]=servingqueue(seed,queue,departure);
    queue(seed).queue;
    seed=cat(2,seed,served);
    peer=cat(2,peer,failed);
    successrate=cat(2,successrate,length(served));
    failurerate=cat(2,failurerate,length(failed));
    if numel(peer)==0
        loop=0;
        break
    end
end
    noofsuccessfullrequest=cumsum(successrate);
    plot(noofsuccessfullrequest,'.')
    axis([0,length(successrate)*3,0,n])
    xlabel('time (1 iteration = 1sec) ')
    ylabel('no. of successfull request')
    legend('SWOP')