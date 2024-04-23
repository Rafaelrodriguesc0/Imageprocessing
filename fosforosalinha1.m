fosforos=imread('fosforos_alinhados.tif','tif');
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

