%A normal parameter reduction algorithm in a numeration way based on Ma et al.¡¯s idea
% Only need to enter the soft set S.
function [R,D]=Algorithm_5(S,times,D,R)

if nargin==1
    times=1;
    D=[];
    R=[];
end

Row=size(S,1);
if times <size(S,2) 
    for kk=[0,1]
        D(times)=kk;
        [R,D]=Algorithm_5(S,times+1,D,R);
    end
elseif times==size(S,2)  
    for kk=[0,1]      
        D(times)=kk;
        dd=repmat(D,size(S,1),1);
        m=S.*dd;   
        Sum=sum(sum(m));
        if Sum/Row==fix(Sum/Row)&&Sum~=0 
            rowSum=sum(m,2);
            if all (~(diff(rowSum)))
                R=[R;D];
            end
        end
    end
end
end