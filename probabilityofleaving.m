function[workingnodes,degreein,degreeout,pleave]=probabilityofleaving(workingnodes,matrix)
%[probability_of_leaving_first,degreein,degreeout]=probabilityofleaving(workingnodes,matrix)
workingnodes;
degreein=sum(matrix(workingnodes,workingnodes));
degreeout=sum(matrix(workingnodes,workingnodes)');
probability_of_leaving1=sortrows(sortrows(cat(2,(cat(2,workingnodes',(degreein+degreeout)')),degreeout'),3),2);
pleave=probability_of_leaving1(:,1);
end