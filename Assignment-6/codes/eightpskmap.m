function out=eightpskmap(bitarr)
    
    len=length(bitarr);
    power=zeros(1,floor(len/3));
    jj=1;
    
    for ii=1:3:len
        if(bitarr(ii)==1)
            power(jj)=(4 - ((fourpammap(bitarr((ii+1):(ii+2)))-3)/2));
        else
            power(jj)=(fourpammap(bitarr((ii+1):(ii+2)))+3)/2;
        end
        jj=jj+1;
    end
    out=exp(1i*2*pi*power/8);
    
end