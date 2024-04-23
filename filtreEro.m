

% Filtre erosion taille x taille sur image nvg
function imgresult = filtreEro(img,taille)
% copier img dans imgresult
imgresult = img;
% calcul nblig et nbcol de l'image
nblig = size(img,1);
nbcol = size(img,2);

% calcul du decalage pour se déplacer dans le filtre
dec = (taille-1)/2;

% je me déplace dans toute l'image pour filtrer
for lig=dec+1 : nblig-dec
  for col=dec+1:nbcol-dec
    mini = 255;
    for i=lig-dec:lig+dec
      for j=col-dec:col+dec
        mini = min(mini,img(i,j));
      endfor
    endfor
    imgresult(lig,col) = mini;
  endfor
endfor

endfunction
