function nb = FindLiquide(img, obj1, obj2)

% Parcourir la matrice à l'envers pour trouver le nombre le plus en bas à droite parmi les obj 1 et 2 qui sera l'étiquette du liquide
  for j = size(img, 1):-1:1 % Parcours des lignes de la dernière à la première
    for i = size(img, 2):-1:1 % Parcours des colonnes de droite à gauche
        if img(j, i) == obj1 || img(j, i) == obj2 % Vérifie si la valeur de pixel correspond à obj1 ou obj2
            nb = img(j, i); % Stocke la valeur du pixel
            % Sort de la fonction
            return;
        end
    end
  end
end
