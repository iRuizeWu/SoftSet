% Depth first Search

function [result,result_k,n,x,now_sum]=Find_solution_f(factor,goal_sum,n,x,now_sum,result,result_k)
if nargin==2
    n=1;
    x=zeros(length(factor),1);
    now_sum=0;                
    result=sort(unique(factor));

    result_k=2;
end

if now_sum>goal_sum  
    return
end
if now_sum==goal_sum  

    result(result_k,1)=0;
    for j=1:length(x)
        if x(j)==1
            k=find(result(1,:)==factor(j));
            result(result_k,k)=result(result_k,k)+1;
        end
    end
    result_k=result_k+1;
    return
end
if n==(length(factor)+1) 
    return
end
i=n;
while i<=length(factor)
    if x(i)==0       
        now_sum=now_sum+factor(i);
        x(i)=1;
        [result,result_k,n,x,now_sum]=Find_solution_f(factor,goal_sum,i+1,x,now_sum,result,result_k);
        x(i)=0;
        now_sum=now_sum-factor(i);
        while (i<length(factor)&&factor(i)==factor(i+1))
            i=i+1;
        end
    end
    i=i+1;
end
end