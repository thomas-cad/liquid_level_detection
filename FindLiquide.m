function nb = FindLiquide(img, obj1, obj2)

% Parcourir la matrice à l'envers pour trouver le nombre le plus en bas à droite parmi les obj 1 et 2 qui sera l'étiquette du liquide
for i = size(img, 1):-1:1
    for j = size(img, 2):-1:1
        if img(i, j) == obj1 || img(i, j) == obj1
            nb = img(i, j);
            %sort de la fonction
            return;
        end
    end
end

end
