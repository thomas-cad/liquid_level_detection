clear all;
close all;

%Chargement et redimensionnement image
img = imread('img_test_accuracy.jpg');
subplot(2,4,1)
imshow(img);title('Image Originale');

img = imresize(img, [500 500]);
subplot(2,4,2)
imshow(img);title('Image Redimensionnée');

%Conversion NVG
img_nvg = rgb2gray(img);
subplot(2,4,3)
imshow(img_nvg);title('Image en NVG');

%Filtre Moyenneur
img_moy = filtreMoyenneur(img_nvg, 3);
subplot(2,4,4)
imshow(img_moy);title('Filtre Moyenneur');

%Seuillage
seuil=60;
img_seuil=255*(img_moy<seuil);
subplot(2,4,5)
imshow(img_seuil);title('Seuillage');

%Traitement = Ouverture (Erosion puis Dilatation)
%Erosion
img_ero1=filtreEro(img_seuil, 3);
img_ero2=filtreEro(img_ero1, 3);
img_ero3=filtreEro(img_ero2, 3);
subplot(2,4,6)
imshow(img_ero3);title('Errosion');

%Dilatation
img_reDilat1=filtreDilat(img_ero3, 3);
img_reDilat2=filtreDilat(img_reDilat1, 3);
subplot(2,4,7)
imshow(img_reDilat2);title('Dilatation (Fin Ouverture)');

%Segmentation
img_seg = segmentation(img_reDilat1);
%save('img_seg.mat', 'img_seg');
subplot(2,4,8)
imagesc(img_seg),title('Segmentation'),colorbar;

%Recupere les deux etiquettes des deux objets
obj = numerotation(img_seg);

%Recupere les etiquettes
liquide = FindLiquide(img_seg, obj(1), obj(2));
bouchon = FindBouchon(img_seg, obj(1), obj(2));

%Calcule hauteur moyenne liquide
hauteurLiquide = MoyenneHauteurLiquide(img_seg, liquide);

%Calcule la difference moyenne de hauteur entre le liquide et le bouchon
diffBouchonLiquide = DiffMoyenneBouchonLiquide (img_seg, liquide, bouchon);

%Pourcentage du remplissage
pourcentage = hauteurLiquide/diffBouchonLiquide;

pourcentage = pourcentage * 100;

%Message
message = sprintf('Le contenant est rempli à : %.2f%%.', pourcentage);
msgbox(message, 'Mesure');
