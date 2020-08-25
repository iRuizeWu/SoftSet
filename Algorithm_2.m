% Approximate number of all minimal k|U| parameter subsets
% Input soft set S
% Output Approximate decomposition number
function num=Algorithm_2(matrix)
K=sum(matrix);
U=size(matrix,1);


k=floor(sum(K)/U);
sums=(1:k)*U;
S=unique(K);
t=tabulate(K);
G=t(:,[1,2])';
L=find(G(2,:)==0);
G(:,L)=[];
G=fliplr(G);
if ~isempty(sums)

P(1)=partition(G,sums(1));
for i=2:length(sums)
    P(i)=partition_small(G,sums(i),U);
end

if isempty(P)
    num=0;
else
    num=sum(P);
end

else
    num=0;P=0;
end
end

%% Function subroutine
% Take the minimal number of combinations
function  PM=partition_small(G,M,U)

if M==0
    b=find(G(1,:)==0);
    if isempty(b)
        P=1;
    else
        P=2.^G(2,b);
    end
elseif isempty(G)&&M~=0
    P=0;
else
    P=zeros(size(G,2),1);
    for i=1:size(G,2)
        if G(1,i)>M ||G(1,i)==U
            P(i)=0;
        else
            P(i)=ff_small(M,i,G,U);
        end
    end
end
PM=sum(P);
end

function f= ff_small(m,i,G,U)

k=(1:G(2,i))*G(1,i);
k_c=k-m;
k_f=find(k_c<=0);

if isempty(k_f)
    
    f=partition_small(G(:,i+1:end),m,U);
else
    Jx=k_f(end);
    J=1:Jx;
    Ze=mod(J*G(1,i),U);
    Ze_i=Ze==0;
    J(Ze_i)=[];
    
    t=U-G(1,i);
    t_i=find(G(1,:)==t);
    G2=G;
    if t_i~=i
    
    G2(:,t_i)=[];
    Gx=G2(:,i+1:end);
    else
        Gx=G2(:,i+1:end);
    end

    f=[];
    for j=J
        %         temp=partition(G(:,i+1:end),m-j*G(1,i));
        temp=partition_small(Gx,m-j*G(1,i),U);
        f(j)=nchoosek(G(2,i),j)*temp;
    end
    
    f=sum(f);
end
end


% Total decomposition number£¨no minimal£©
% ku
%M:factored£¬G:factor

function  PM=partition(G,M)

if M==0
    b=find(G(1,:)==0);
    if isempty(b)        
        P=1;
    else
        P=2.^G(2,b);
    end
elseif isempty(G)&&M~=0
    P=0;
else
    P=zeros(size(G,2),1);
    for i=1:size(G,2)
        if G(1,i)>M 
            P(i)=0;
        else
            P(i)=ff(M,i,G);
        end
    end
end
PM=sum(P);
end

function f= ff(m,i,G)

k=(1:G(2,i))*G(1,i);
k_c=k-m;
k_f=find(k_c<=0);

if isempty(k_f)
    
    f=partition(G(:,i+1:end),m);
else
    Jx=k_f(end);
    for j=1:Jx
        temp=partition(G(:,i+1:end),m-j*G(1,i));
        f(j)=nchoosek(G(2,i),j)*temp;
    end
    f=sum(f);
end
end