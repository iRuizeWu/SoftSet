function result=Find_solution(factor,factored)
factor=sort(factor,'descend');
zero=find(factor==0);
if factored==0&&isempty(zero)
    result=[];
elseif factored==0&&~isempty(zero)
    kk=sort(unique(factor));
    result=zeros(length(zero)+1,length(kk));
    result(1,:)=kk;
    result(:,1)=0:length(zero);
    result(1,:)=[];
elseif isempty(zero)
    [result,result_k]=Find_solution_f(factor,factored);
    result(result_k:end,:)=[];
    if ~isempty(result)
        result(1,:)=[];
    end
elseif ~isempty(zero)
    factor(zero)=[];
    [result,result_k]=Find_solution_f(factor,factored);
    result(result_k:end,:)=[];
    if ~isempty(result)
        result(1,:)=[];
        Z=0:length(zero);
        Z=repmat(Z,size(result,1),1);
        Z=reshape(Z,[],1);
        result=[Z,repmat(result,length(0:length(zero)),1)];
    end
    
end
end