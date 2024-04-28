%Main de test
%Executer le main principal avant pour recuperer l'image segmentée
%Permet de tester les algo de lecture de l'image
%
%[Decommenter ligne 45 du main}]
%
%

clear all;
close all;

%Segmentation
load('img_seg.mat');
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
