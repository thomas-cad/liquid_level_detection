clear all;
close all;

%Segmentation
load('img_seg.mat');
%Recupere les deux etiquettes des deux objets

obj = numerotation(img_seg);

%Recupere les etiquettes
liquide = FindLiquide(img_seg, obj(1), obj(2))
bouchon = FindBouchon(img_seg, obj(1), obj(2))

%Calcule la difference moyenne de hauteur entre le liquide et le bouchon
diffBouchonLiquide = DiffMoyenneBouchonLiquide (img_seg, liquide, bouchon)

%Calcule hauteur moyenne liquide
hauteurLiquide = MoyenneHauteurLiquide(img_seg, liquide)

%Pourcentage du remplissage
pourcentage = hauteurLiquide/diffBouchonLiquide
