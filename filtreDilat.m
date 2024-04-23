

% Filtre erosion taille x taille sur image nvg
function imgresult = filtreDilat(img,taille)
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
    maxi = 0;
    for i=lig-dec:lig+dec
      for j=col-dec:col+dec
        maxi = max(maxi,img(i,j));
      endfor
    endfor
    imgresult(lig,col) = maxi;
  endfor
endfor

endfunction
