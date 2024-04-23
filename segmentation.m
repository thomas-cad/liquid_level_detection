function imgresult = segmentation(img)

imgresult = img;

taillexy = size(imgresult);
taillex = taillexy(1) - 1;
tailley = taillexy(2) - 1;
imgresult =  imgresult;


%segmentation �  partir de l'image dilatée, 1ere étape
img_seg1 = img;
etiquette=30;
for i=2:taillex
    for j=2:tailley
        if (img_seg1(i,j)==255)
            if ((img_seg1(i-1,j)==0)&&(img_seg1(i,j-1)==0))
                etiquette=etiquette+1
                img_seg1(i,j)=etiquette;
                else
                if (min([img_seg1(i-1,j),img_seg1(i,j-1)])==0)
                img_seg1(i,j)=max([img_seg1(i-1,j),img_seg1(i,j-1)]);
                else
                img_seg1(i,j)=min([img_seg1(i-1,j),img_seg1(i,j-1)]);
                end
            end
        end
    end
end

figure(10)
imagesc(img_seg1),title('segmented 1st step'),colorbar;colormap('jet');


% 2eme étape de segmentation
imgresult = img_seg1;
for j=2:tailley
j=tailley-j+1;
for i=2:taillex
    i=taillex-i+1;
        if (img(i,j)==255)
            if ((imgresult(i+1,j)==0)&&(imgresult(i,j+1)==0))
            imgresult(i,j)=imgresult(i,j);
            elseif (imgresult(i+1,j)==0)
            imgresult(i,j)=min([imgresult(i,j),imgresult(i,j+1)]);
            elseif (imgresult(i,j+1)==0)
            imgresult(i,j)=min([imgresult(i,j),imgresult(i+1,j)]);
            else
            imgresult(i,j)=min([imgresult(i,j),imgresult(i+1,j),imgresult(i,j+1)]);
            end
        end
    end
end

figure(11)
imagesc(imgresult),title('segmented 2nd step'),colorbar;colormap('jet');


%3eme étape de segmentation, comme l'étape précedente mais le balayage est cette fois ci du haut vers le bas et toujours de droite �  gauche
for i=2:taillex
    for j=2:tailley
        j=tailley-j+1;
            if (img(i,j)==255)
            if ((imgresult(i-1,j)==0)&&(imgresult(i,j+1)==0))
            imgresult(i,j)=imgresult(i,j);
            elseif (imgresult(i-1,j)==0)
            imgresult(i,j)=min([imgresult(i,j),imgresult(i,j+1)]);
            elseif (imgresult(i,j+1)==0)
            imgresult(i,j)=min([imgresult(i,j),imgresult(i-1,j)]);
            else
            imgresult(i,j)=min([imgresult(i,j),imgresult(i-1,j),imgresult(i,j+1)]);
            end
        end
    end
end

figure(12)
imagesc(imgresult),title('segmented final'),colorbar;

endfunction

