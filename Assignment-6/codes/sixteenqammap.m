function out = sixteenqammap(bitarr)
    
    len=length(bitarr);
    out=zeros(1,len/4);
    jj=1;
    for ii = 1:4:len
        out(jj)=fourpammap(bitarr(ii:ii+1))+1i*fourpammap(bitarr((ii+2):(ii+3))); 
        jj=jj+1;
    end
end