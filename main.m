clear all;
close all;

img = imread('img_test.jpg');
img = imresize(img, [500 500]);
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
imshow(img_seuil); title('Image seuillée');

img_dilat1=filtreDilat(img_seuil, 3);
img_dilat2=filtreDilat(img_dilat1, 3);
img_dilat3=filtreDilat(img_dilat2, 3);
img_dilat4=filtreDilat(img_dilat3, 3);
figure(5)
imshow(img_dilat4); title('Image Dilatée');

img_ero1=filtreEro(img_dilat4, 3);
img_ero2=filtreEro(img_ero1, 3);
img_ero3=filtreEro(img_ero2, 3);
img_ero4=filtreEro(img_ero3, 3);
img_ero5=filtreEro(img_ero4, 3);
img_ero6=filtreEro(img_ero5, 3);
img_ero7=filtreEro(img_ero6, 3);
img_ero8=filtreEro(img_ero7, 3);
img_ero9=filtreEro(img_ero8, 3);
img_ero10=filtreEro(img_ero9, 3);
figure(6)
imshow(img_ero10); title('Image Erodée');

img_reDilat1=filtreDilat(img_ero10, 3);
img_reDilat2=filtreDilat(img_reDilat1, 3);
img_reDilat3=filtreDilat(img_reDilat2, 3);
img_reDilat3=filtreDilat(img_reDilat2, 3);
img_reDilat4=filtreDilat(img_reDilat3, 3);
figure(7)
imshow(img_reDilat4); title('Image re-dilatée');

img_seg = segmentation(img_reDilat4);
figure(8)
imagesc(img_seg),title('Image segmentée'),colorbar;

img_num = numerotation(img_seg);
