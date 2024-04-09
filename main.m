clear all;
close all;

img = imread('img_test.jpg');
figure(1)
imshow(img);
img_nvg = rgb2gray(img);
figure(2)
imshow(img_nvg);

img_moy = filtreMoyenneur(img_nvg, 3)
figure(3)
imshow(img_moy);
