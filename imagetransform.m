T = dctmtx(8);
figure()
imshow(T, 'InitialMagnification', 8000)

img = double(im2gray(imread('lena.tiff')));
figure()
imshow(img, [])

trans_img = floor(blkproc(img-128,[8 8],'P1*x*P2',T,T'));

figure()
imshow(abs(trans_img(1:8, 1:8)), [], 'InitialMagnification', 8000)

figure()
imshow(abs(trans_img(81:88, 297:304)), [], 'InitialMagnification', 8000)

mask = zeros(8, 8);
mask ( 1 , 1 ) = 1;
mask ( 1 , 2 ) = 1;
mask ( 1 , 3 ) = 1;
mask ( 2 , 1 ) = 1;
mask ( 3 , 1 ) = 1;
mask ( 2 , 2 ) = 1;
thres_trans_img = blkproc(trans_img, [8 8], 'P1.*x', mask);
thres_img = floor(blkproc(thres_trans_img,[8 8],'P1*x*P2',T',T));

figure()
imshow(thres_img, [])




