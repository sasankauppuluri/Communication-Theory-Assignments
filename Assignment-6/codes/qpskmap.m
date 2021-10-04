

function out=qpskmap(bitarr)

len=length(bitarr);
out=zeros(1, len/2);
jj=1;
for ii=1:2:len
    if(bitarr(ii)==0 && bitarr(ii+1)==0)
            out(jj)=-1-i;
    elseif(bitarr(ii)==0 && bitarr(ii+1)==1)
            out(jj)=-1+i;
    elseif(bitarr(ii)==1 && bitarr(ii+1)==1)
            out(jj)=1-i;
    else
            out(jj)=1+i;
    end
        jj=jj+1; 
end

end