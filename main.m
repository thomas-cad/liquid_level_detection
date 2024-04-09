clear all;
close all;

img = imread('img_test.jpg');
img = imresize(img, [700 500]);
figure(1)
imshow(img); title('Image origniale');

img_nvg = rgb2gray(img);
figure(2)
imshow(img_nvg); title('Image en nuances de gris');

img_moy = filtreMoyenneur(img_nvg, 3);
figure(3)
imshow(img_moy); title('Image avec filtrage moyenneur');

seuil=90
img_seuil=255*(img_moy<seuil);
figure(4)
imshow(img_seuil); title('Image filtrée');
