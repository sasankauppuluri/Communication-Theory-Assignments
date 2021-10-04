
function out=fourpammap(bitarr)

len=length(bitarr);
out=zeros(1, len/2);
jj=1;
for ii=1:2:len
    if(bitarr(ii)==0 && bitarr(ii+1)==0)
            out(jj)=-3;
    elseif(bitarr(ii)==0 && bitarr(ii+1)==1)
            out(jj)=-1;
    elseif(bitarr(ii)==1 && bitarr(ii+1)==0)
            out(jj)=3;
    else
            out(jj)=1;
    end
        jj=jj+1; 
end

end