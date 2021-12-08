Q = [16 11 10 16 24 40 51 61;
12 12 14 19 26 58 60 55;
14 13 16 24 40 57 69 56;
14 17 22 29 51 87 80 62;
18 22 37 56 68 109 103 77;
24 35 55 64 81 104 113 92;
49 64 78 87 103 121 120 101;
72 92 95 98 112 100 103 99];

Q = Q * 10;

T = dctmtx(8);

img_og = double(im2gray(imread('lena.tiff')));

trans_img = blkproc(img_og-128,[8 8],'P1*x*P2',T,T');
trans_img_scaled = floor(blkproc(trans_img, [8 8], 'x./P1', Q));
img = blkproc(trans_img_scaled, [8 8], 'x.*P1', Q);
img = blkproc(img, [8 8], 'P1*x*P2', T', T) + 128;

imshow(uint8(img))

