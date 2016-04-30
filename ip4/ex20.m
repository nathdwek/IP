%Image Processing Lab4 -- Nathan Dwek
BLKSIZE = 8;

dct = @(block_struct) dct2(block_struct.data);
idct = @(block_struct) idct2(block_struct.data);

lena = im2double(imread('lenagray.tif', 'TIFF'));
lenaFreq = blockproc(lena, [BLKSIZE BLKSIZE], dct);

figure;
i = 1;
for diagshift = round(linspace(7,-7,4))
    mask = flipud(tril(ones(BLKSIZE),diagshift));
    compressedFreq = blockproc(lenaFreq, [BLKSIZE BLKSIZE], @(block_struct) mask .* block_struct.data);
    subplot(2,2,i);
    compressed = blockproc(compressedFreq,[BLKSIZE BLKSIZE], idct);
    imshow(compressed)
    title(sprintf('%d/%d components kept\nPSNR = %g', sum(sum(mask)), BLKSIZE^2, psnr(compressed, lena)));
    i = i +1;
end
%We see that most of the information is concentrated in the low
%frequencies, since visually, there isn't much difference between the three
%first compression ratios. However, the PSNR still shows that errors are
%indeed introduced. The fourth image shows that if too few coefficients are
%kept, blocking artifacts occur.


