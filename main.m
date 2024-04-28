clear all;
close all;

%Chargement et redimensionnement image
img = imread('img_test.jpg');
img = imresize(img, [500 500]);

%Conversion NVG
img_nvg = rgb2gray(img);

%Filtre Moyenneur
img_moy = filtreMoyenneur(img_nvg, 3);

%Seuillage
seuil=60;
img_seuil=255*(img_moy<seuil);

%Dilatation Step 1
img_dilat1=filtreDilat(img_seuil, 3);
img_dilat2=filtreDilat(img_dilat1, 3);
img_dilat3=filtreDilat(img_dilat2, 3);
img_dilat4=filtreDilat(img_dilat3, 3);

%Erosion
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

%Dilatation Step 2
img_reDilat1=filtreDilat(img_ero10, 3);
img_reDilat2=filtreDilat(img_reDilat1, 3);
img_reDilat3=filtreDilat(img_reDilat2, 3);
img_reDilat3=filtreDilat(img_reDilat2, 3);
img_reDilat4=filtreDilat(img_reDilat3, 3);

%Segmentation
img_seg = segmentation(img_reDilat4);
%save('img_seg.mat', 'img_seg');

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
