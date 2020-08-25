
function A=	Coefficient_matrix(tu)
[m,n]=size(tu);
for i=1:(size(tu,1)-1)
    D{1,i}=find((tu(1,:)-tu(i+1,:))>0);
    D{2,i}=find((tu(i+1,:)-tu(1,:))>0);
end

for i=1:size(D,2)
    A(i,D{1,i})=1;
    A(i,D{2,i})=-1;
end
if size(A,2)<n
    A(:,(end+1):n)=zeros(size(A,1),length((size(A,2)+1):n));
end
end