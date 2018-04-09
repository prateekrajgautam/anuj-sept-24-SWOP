function[prob,pathlengthdist]=plotprobability(pathlength)
pathlengthdist=reshape(pathlength,1,numel(pathlength));
for i=3:max(pathlengthdist)
    p(1,i)=sum(pathlengthdist==i);
end
prob=p/sum(p);
plot(prob);
grid on
title('probability of no of nodes to be traced to find path')
xlabel('no of nodes traced')
ylabel('probability') 
axis([0,max(pathlengthdist)+1,0,1])
saveas(gcf,'prob','jpg');
end