
clear all;

f_rgb = imread('peppers.png');

transform = makecform('srgb2lab');
f_lab = applycform(f_rgb, transform);

% imshow(f_lab)
% title('L*a*b* colour space')


% K = 2;
% row = [55 200];
% col = [155 400];
K = 4;
row = [55 130 200 280];
col = [155 110 400 470];
% Convert (r,c) indexing to 1D linear indexing.
idx = sub2ind([size(f,1) size(f,2)], row, col);
% Vectorize starting coordinates
for k = 1:K
    mu(k,:) = ab(idx(k),:);
end

ab = double(im_lab(:,:,2:3)); % NOT im2double
m = size(ab,1);
n = size(ab,2);
ab = reshape(ab,m*n,2);

% Label each pixel according to k-means
pixel_labels = reshape(cluster_idx, m, n);
h = figure,imshow(pixel_labels, [])
title('Image labeled by cluster index');
colormap('jet')

=======
img = imread('peppers.png');
ycbcr = rgb2ycbcr(img);
y = ycbcr(:,:,1);
cb = ycbcr(:,:,2);
cr = ycbcr(:,:,3);


figure()
imshow(img)

figure()
imshow(y)

figure()
imshow(cb)

figure()
imshow(cr)

new_cb = imresize(imresize(cb, .5, 'bilinear'), 2, 'bilinear');
new_cr = imresize(imresize(cr, .5, 'bilinear'), 2, 'bilinear');

new_ycbcr = zeros(size(ycbcr));
new_ycbcr(:,:,1) = y;
new_ycbcr(:,:,2) = new_cb;
new_ycbcr(:,:,3) = new_cr;
new_ycbcr = uint8(new_ycbcr);

new_img = ycbcr2rgb(new_ycbcr);

figure()
imshow(new_img)

