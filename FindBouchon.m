function nb = FindBouchon(img, obj1, obj2)

% Parcourir la matrice pour trouver le nombre le plus en haut à gauche parmi les obj 1 et 2 qui sera l'etiquette du bouchon
    for j = 1:size(img, 1)
      for i = 1:size(img, 2)
          if img(j, i) == obj1 || img(j, i) == obj1
              nb = img(j, i);
              %sort de la fonction
              return;
          end
      end
    end
end
