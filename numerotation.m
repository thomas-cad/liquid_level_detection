% Numérotation des objets à partir des étiquettes
function imgresult = numerotation(img)
imgresult = img;
% on utilise l'histogrammme pour avoir le nombre d'objets et leur étiquette
for k=1:255
f(k)=sum(sum(imgresult == k));
end
disp('il y a ')
disp(nnz(f))
disp('objet(s)')
disp('voici leur etiquette')
etiquettes=(find(f))

endfunction
