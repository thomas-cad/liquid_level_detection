clear all
close all

img = imread('IMG_2521.jpg');
img_nvg = rgb2gray(img);
figure(1)
imshow(img_nvg);

dilat = im2double(img); % Convert image to double precision
dilat = imresize(dilat, [500 500]); % Resize image to 50% of its original size

taillexy = size(dilat);
taillex = taillexy(1) - 1;
tailley = taillexy(2) - 1;
dilat = 255 * dilat;


%segmentation �  partir de l'image dilatée, 1ere étape
segmented=dilat;
etiquette=0;
for i=2:taillex
    for j=2:tailley
        if (dilat(i,j)==255)
            if ((segmented(i-1,j)==0)&&(segmented(i,j-1)==0))
                etiquette=etiquette+1
                segmented(i,j)=etiquette;
                else
                if (min([segmented(i-1,j),segmented(i,j-1)])==0)
                segmented(i,j)=max([segmented(i-1,j),segmented(i,j-1)]);
                else
                segmented(i,j)=min([segmented(i-1,j),segmented(i,j-1)]);
                end
            end
        end
    end
end
figure(10)
imagesc(segmented),title('segmented 1st step'),colorbar;colormap('jet');

% 2eme étape de segmentation
segmented_final=segmented;
for j=2:tailley
j=tailley-j+1;
for i=2:taillex
    i=taillex-i+1;
        if (dilat(i,j)==255)
            if ((segmented_final(i+1,j)==0)&&(segmented_final(i,j+1)==0))
            segmented_final(i,j)=segmented_final(i,j);
            elseif (segmented_final(i+1,j)==0)
            segmented_final(i,j)=min([segmented_final(i,j),segmented_final(i,j+1)]);
            elseif (segmented_final(i,j+1)==0)
            segmented_final(i,j)=min([segmented_final(i,j),segmented_final(i+1,j)]);
            else
            segmented_final(i,j)=min([segmented_final(i,j),segmented_final(i+1,j),segmented_final(i,j+1)]);
            end
        end
    end
end
figure(11)
imagesc(segmented_final),title('segmented 2nd step'),colorbar;colormap('jet');

%3eme étape de segmentation, comme l'étape précedente mais le balayage est cette fois ci du haut vers le bas et toujours de droite �  gauche
for i=2:taillex
    for j=2:tailley
        j=tailley-j+1;
            if (dilat(i,j)==255)
            if ((segmented_final(i-1,j)==0)&&(segmented_final(i,j+1)==0))
            segmented_final(i,j)=segmented_final(i,j);
            elseif (segmented_final(i-1,j)==0)
            segmented_final(i,j)=min([segmented_final(i,j),segmented_final(i,j+1)]);
            elseif (segmented_final(i,j+1)==0)
            segmented_final(i,j)=min([segmented_final(i,j),segmented_final(i-1,j)]);
            else
            segmented_final(i,j)=min([segmented_final(i,j),segmented_final(i-1,j),segmented_final(i,j+1)]);
            end
        end
    end
end
figure(12)
imagesc(segmented_final),title('segmented final'),colorbar;

% on utilise l'histogrammme pour avoir le nombre d'objets et leur étiquette
for k=1:255
f(k)=sum(sum(segmented_final == k));
end
disp('il y a ')
disp(nnz(f))
disp('objet(s)')
disp('voici leur etiquette')
etiquettes=(find(f))

%il faut maintenant trouver la position de objets. Pour chaque étiquette, on parcourt l'image en faisant la moyenne des coordonnées y et la moyenne des coordonnées x des pixels portant l'étiquette. On tombe donc sur le barycentre de l'objet!
object_position=zeros(length(etiquettes),2);
for m=1:length(etiquettes)
sumi=0;sumj=0;effectif=0;
    for i=2:taillex
        for j=2:tailley
            if (segmented_final(i,j) == etiquettes(m))
                sumi=sumi+i;sumj=sumj+j;
                effectif=effectif+1;
                %etiquettes(m)
            end
        end
    end
    object_position(m,:)=[sumi/effectif,sumj/effectif];
end

disp('voici les coordonnees des objets')
object_position

 hold on
 for m=1:length(object_position(:,1))
 coord=object_position(m,:);
 text(coord(2),coord(1), ['objet num.',num2str(m)])
 end

