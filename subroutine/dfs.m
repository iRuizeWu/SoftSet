
function [out,x,out_i]=dfs(out,out_i,su,len,x,sums,maxk)
if su==sums

    out(out_i,1:(maxk+1))=0;
    for i=2:len
       out(out_i,x(i)+1)=out(out_i,x(i)+1)+1;
    end

    out_i=out_i+1;
    return;
end
for i=1:maxk
    if (i>=x(len)&&((su+i)<=sums))
        x(len+1)=i;
        [out,x,out_i]=dfs(out,out_i,su+i,len+1,x,sums,maxk);
        x(len+1)=0;
    end
end
end

