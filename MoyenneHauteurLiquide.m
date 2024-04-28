function value = MoyenneHauteurLiquide (img, liquide)
  i = 1 ;
  j = 1 ;
  n = 0 ;
  m = 0 ;

  %Parcourt l'image
   while i < size(img)(1)
     while j < size(img)(2)
       %On rencontre le liquide
       if img(i,j) == liquide
         m = m + 1; %On ajoute '1' à la largeur du liquide
         %On avance dans la colonne jusqu'a la fin du liquide ou de l'image
         while img(i,j) != 0 & j < size(img)(2)
           n = n + 1; %On ajout '1' à la hauteur du liquide
           j = j + 1;
         endwhile
       endif
       j = j + 1; %On avance jusqu'a la fin de la colonne
     endwhile
     j = 1; %Reset j
     i = i + 1; %On change de colonne
   endwhile

   %on divise la longueur totale de la huateur du liquide par le nombre de colonnes = Valeur moyenne entre bouchon et liquide
   value = n/m ;
end
