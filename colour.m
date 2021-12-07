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

