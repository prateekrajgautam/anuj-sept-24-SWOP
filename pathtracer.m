function[path,pathfound,traced]=pathtracer(a2,b2,traced,mat,pathfound,path,depth)
x=setdiff(find(mat(a2,:)==1),traced);
% x=setdiff(find(mat(:,a2)==1)',traced);
x1=intersect(x,b2);
if numel(intersect(traced,a2))==0
    traced=cat(2,traced,a2);
%     path=cat(2,path,a2)
end

if numel(x1)==1
%     path=cat(2,path,x1)
    pathfound=1;
    return
end
% if depth >length(mat)
% if depth >100
%     depth
%     return
% end
% if length(traced)==length(mat)
%     return
% end
% if pathfound==1
%     return
% end




if pathfound==0   
%     if numel(x1)~=1
    if numel(x1)==0
%         path=[];
        pathfound=0;
        for i=1:length(x)
%             traced=union(traced,x(1,i))
            path=cat(2,path,x(1,i));
            [path,pathfound,traced]=pathtracer(x(1,i),b2,traced,mat,pathfound,path,depth+1);
            if pathfound==1
                return
            end
            if pathfound==0
                path=path(1,1:length(path)-1);
            end
%             if pathfound==0
%                 if numel(path)>1
%                     path=path(1,1:length(path)-1);
%                 end
%             end
%             traced=union(traced,x(1,i));
        end
    end
end
end
        
