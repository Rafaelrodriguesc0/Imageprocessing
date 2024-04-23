fosforos=imread('fosforos','tif');
figure(1),imshow(fosforos)
title('Original')
fosfruido=imnoise(fosforos,'salt & pepper',0.04);
figure(2),imshow(fosfruido)
title('Salt and Pepper')
fav=fspecial('average',3)
fosfav=imfilter(fosfruido,fav)
figure(3),imshow(fosfav)
title('Media')
fmed=medfilt2(fosfruido,[3 3])
%fosfmed=imfilter(fosfruido,fmed)
figure(4),imshow(fmed)
title('Mediana')
for i=1:558
    for j=1:558
        if(fosforos(i,j)>195)
            deteccao(i,j)=255;
        if(fosforos(i,j)<=194);
               deteccao(i,j)=0;
        end
        end
    end
end
figure(5),imshow(deteccao)
se=strel('square',4);
dilatado=imdilate(fosforos,se);
erodido=imerode(fosforos,se);
figure(6),subplot(1,2,1)
imshow(dilatado)
subplot(1,2,2)
imshow(erodido)
edge1=dilatado-erodido;
figure(7)
imshow(edge1)

edgefosforos1=edge(fosforos,'canny');
figure(8)
imshow(edgefosforos1)
edgefosforos2=edge(fosforos,'sobel');
figure(9)
imshow(edgefosforos2)
transicao=0;
for j=1:557
        if((deteccao(279,j)>123) && (deteccao(279,j+1)<123))
            transicao=transicao+1;
            
        end
                if((deteccao(279,j)<123) && (deteccao(279,j+1)>123))
                    transicao=transicao+1;
                end
    
end

objectos= transicao/2
transicao

