
function out = bpskmap(bitarr)
len=length(bitarr);
out=zeros(1, len);

    for ii=1:len
    if(bitarr(ii)==0)
        out(ii)=-1;
    else
        out(ii)=1;
    end
    end
end