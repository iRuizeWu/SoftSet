% Our normal parameter reduction algorithm based on integer partition method
function R2=Algorithm_4(S)
factor=sum(S);

k=floor(sum(factor)/size(S,1));
sums=(1:k)*size(S,1);

P=cell(length(sums),1);
for i=1:length(sums)
    P{i}=Find_solution(factor,sums(i));
end
result=cell2mat(P);
R1=Expand(result,factor);
R2=Check(Coefficient_matrix(S),R1);

end