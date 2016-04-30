%Image Processing Lab4 -- Nathan Dwek
function psnr = psnr(compressed, orig)
    psnr = 10 * log10(max(max(orig))^2*numel(orig)/sum(sum((compressed - orig).^2)));
