
function Origin=Expand(Uni,a)

if isempty(Uni)
    Origin=[];
    return
end

k=sort(unique(a));%'descend');
shulie=cell(length(k),2);
shulie(:,1)=num2cell(k');
for i=1:length(a)
    kk=find(k==a(i));
    shulie{kk,2}=[shulie{kk,2},i];
end
for i=1:size(shulie,1)
    num=length(shulie{i,2});
    for j=1:num
        mid=nchoosek(shulie{i,2},j);
          M=zeros(size(mid,1),length(a));
          xmid=1:size(mid,1);
          xmid=xmid';
          xmid=repmat(xmid,1,size(mid,2));
          index=sub2ind(size(M),xmid(:),mid(:));
          M(index)=1;
          shulie{i,j+2}=M';
    end
end
Origin=[];
for i=1:size(Uni,1)

    kk=find(Uni(i,:)>0);
    temp=cell(length(kk),1);
    for j=1:length(kk)
        temp{j,1}=shulie{kk(j),Uni(i,kk(j))+2};  
    end

    origin=digui(temp);
    Origin=[Origin,origin];
end
 Origin=Origin';

end


function [result,result_i]=digui(temp,result,result_i,now_result,temp_i)
if nargin==1
    result=zeros(size(temp{1},1),1);
    result_i=1;
    now_result=zeros(size(temp{1},1),1);
    temp_i=1;
end
if temp_i<length(temp)
    for k=1:size(temp{temp_i},2)
    now_result=now_result+temp{temp_i}(:,k);
    [result,result_i]=digui(temp,result,result_i,now_result,temp_i+1);
    now_result=now_result-temp{temp_i}(:,k);
    end
    return 
end
if temp_i==length(temp)
    for k=1:size(temp{temp_i},2)
        result(:,result_i)=now_result+temp{temp_i}(:,k);
        result_i=result_i+1;
    end
    return 
end

end

