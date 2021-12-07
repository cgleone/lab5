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

new_y = imresize(imresize(y, .5, 'bilinear'), 2, 'bilinear');

new_ycbcr = zeros(size(ycbcr));
new_ycbcr(:,:,1) = new_y;
new_ycbcr(:,:,2) = cb;
new_ycbcr(:,:,3) = cr;
new_ycbcr = uint8(new_ycbcr);

new_img = ycbcr2rgb(new_ycbcr);

figure()
imshow(new_img)
