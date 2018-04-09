function[]=plotgraph(noofnodes,matrix,r,arrowsize,V,en)
% r=10;
fcolor=['b';'g';'r';'c';'k';'m'];
theta=[0:2*pi/noofnodes:2*pi];
xx=r*sin(theta);
yy=r*cos(theta)/1.5;
xy=cat(2,xx',yy');
axis([-r-2,r+2,-r-2,r+2])
num=1;
for i=1:noofnodes
    if num==7
        num=1;
    end
%     text(xy(i,1),xy(i,2),['.']);
%     text(1.02*xy(i,1),1.02*xy(i,2),['.']);
%     text(1.04*xy(i,1),1.04*xy(i,2),['.']);
%     text(1.06*xy(i,1),1.06*xy(i,2),['.']);
%     text(1.08*xy(i,1),1.08*xy(i,2),['.']);
    if numel(intersect(i,en))~=1
        if numel(intersect(i,V))~=0
            text(1.2*xy(i,1),1.2*xy(i,2),['\bullet' num2str(i)]);
        else
            text(1.2*xy(i,1),1.2*xy(i,2),['~' num2str(i)]);
        end
    else
        text(1.2*xy(i,1),1.2*xy(i,2),['*\ldots' num2str(i)]);
    end
       
    for j=1:noofnodes
%         text(1.2*xy(j,1),1.2*xy(j,2),['.' num2str(j)]);
        if matrix(i,j)==1
%             line([xx(1,i),xx(1,j)],[yy(1,i),yy(1,j)])
            arrow([xx(1,i),yy(1,i)],[xx(1,j),yy(1,j)],'Length',arrowsize,'FaceColor',fcolor(num,:),'EdgeColor',fcolor(num,:))
            
%             text(1.1*(xx(1,i)+xx(1,j))/2, 1.1*(yy(1,i)+yy(1,j))/2 ,[num2str(linkrowweight(num,1))])
%             weight=[num2str(links(num,:)) ' ---  ' num2str(linkweight(num,:)) ];
            num=num+1;
    if num==7
        num=1;
    end
        end
    end
    
end
title(['example of small-world network with ' num2str(length(V)) ' nodes'])
axis([-r-2,r+2,-r-2,r+2])
xlabel(['working nodes are ' num2str(V)])
% saveas(gcf,newname,'jpg')