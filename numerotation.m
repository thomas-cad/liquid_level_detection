% Numérotation des objets à partir des étiquettes
function etiquettes = numerotation(img)
% on utilise l'histogrammme pour avoir le nombre d'objets et leur étiquette
for k=1:255
f(k)=sum(sum(img == k));
end
etiquettes=(find(f));
endfunction
