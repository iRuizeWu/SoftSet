function matrix=ZerosOneMatrix(m,n,bili)
if nargin==2
    bili=0.5;
end
matrix=rand(m,n);
matrix(matrix>=1-bili)=1;
matrix(matrix<1-bili)=0;
end