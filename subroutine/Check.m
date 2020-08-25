
function D=Check(A,origin)
m=size(A,1);
n=size(A,2);
j=1;
D=[];
for i=1:size(origin)
    b=A*origin(i,:)';
    if sum(b==0)==m
        D(j,:)=origin(i,:);
        j=j+1;
    end
end
end
