function origin=Take_small(origin)

i=1;
while (1)
    k=[];
    for j=(i+1):size(origin,1)
        kk=origin(i,:)-origin(j,:);
        k_1=length(find(kk<0));
        k1=length(find(kk>0));
        if k1==0
            k=[k,j];
        elseif k_1==0
            k=[k,i];
        end
    end
    origin(k,:)=[];
    if i>=(length(origin)-1)
        break;
    end
    i=i+1;
end

end