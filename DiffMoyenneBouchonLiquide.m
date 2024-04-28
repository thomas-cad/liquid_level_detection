function value = DiffMoyenneBouchonLiquide (img, liquide, bouchon)
  i = 1 ;
  j = 1 ;
  n = 0 ;
  m = 0 ;

  %Parcourt l'image
   while i < size(img)(1)
     while j < size(img)(2)

       %On rencontre le bouchon
       if img(i,j) == bouchon
         m = m + 1; %On ajoute '1' à la largeur du bouchon

         %On avance dans la colonne jusqu'a la fin du bouchon ou de l'image
         while img(i,j) != 0 && j < size(img)(2)
           j = j + 1;
         endwhile

         %On avance entre la fin du bouchon jusqu'au liquide ou de l'image
         while img(i,j)!= liquide && j < size(img)(2)
           n = n + 1; %On ajout '1' à la longueur entre le bouchon et le liquide
           j = j + 1;
         endwhile

         %On avance jusqu'a la fin du liquide ou de l'image
         while img(i,j)!= 0 && j < size(img)(2)
           n = n + 1; %On ajout '1' à la longueur entre le bouchon et le liquide
           j = j + 1;
         endwhile
       endif

       j = j + 1; %On avance jusqu'a la fin de la colonne
     endwhile
     j = 1; %Reset j
     i = i + 1; %On change de colonne
   endwhile

   %on divise la longueur totale entre le bouchon et le liquide par le nombre de colonnes = Valeur moyenne entre bouchon et liquide
   value = n/m ;
end
