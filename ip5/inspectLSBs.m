function imout = inspectLSBs(imin, n)
    m = 2^n;
    imout = mod(imin,m);
    high = (m-1)/255;
    imout = imadjust(imout, [0 0 0; high high high], []);
end
