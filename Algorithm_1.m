% Algorithm 1 The number of all k|U| parameter subsets
% Input soft set S
% Output the sum of all PS(M)
function num=Algorithm_1(S)

K=sum(S);% Sum of columns

k=floor(sum(K)/size(S,1));
M=(1:k)*size(S,1);

P=cell(length(M),1);
for i=1:length(M)
    P{i}=Find_solution(K,M(i)); % Depth first Search
end
result=cell2mat(P);
R=Expand(result,K);% Extend the decomposition result to 01 sequence
num=size(R,1);
end
