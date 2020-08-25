% Off-line and On-line Algorithms for all minimal k|U| parameter subsets
clc
clear
close all
%% Offline stage:

tic
maxk=5;
sums=(1:maxk-1)*maxk
output=cell(length(sums),1);

for i=1:length(sums)
    output{i,1}=dfs([],1,0,1,zeros(),sums(i),maxk);
end

small=Take_small(cell2mat(output));
toc
save('matrixData.mat','small')
%% Online stage:
row=maxk;
col=15;
ratio=0.5;


B=small;
matrix=ZerosOneMatrix(row,col,ratio);
a=sum(matrix);
times=hist(a,(1:row+1)-1);


kk=[];
for j=1:size(B,1)
    if ~isempty(find((times-B(j,:))<0))
        kk=[kk,j];
    end
end
B(kk,:)=[];

result=Expand(B(:,unique(a+1)),a);