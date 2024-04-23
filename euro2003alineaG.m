imagem = imread('euro2003.png','png');
figure(1)
imshow(imagem);
redchannel=imagem(:,:,1);
greenchannel=imagem(:,:,2); 
bluechannel=imagem(:,:,3);

canaldois=zeros(914,1601);
canaldois=uint8(canaldois);
canaltres=zeros(914,1601);
canaltres=uint8(canaltres);
verde=zeros(914,1601);
verde=uint8(verde);
azul=zeros(914,1601);
azul=uint8(azul);
vermelho=zeros(914,1601);
vermelho=uint8(vermelho);
vermelho(:,:,2)=zeros(914,1601);
vermelho(:,:,3)=zeros(914,1601);
verde(:,:,1)=zeros(914,1601);
verde(:,:,3)=zeros(914,1601);
azul(:,:,2)=zeros(914,1601);
azul(:,:,3)=zeros(914,1601);

for j=1:1601
for i=1:914
vermelho(i,j,1)= redchannel(i,j);
verde(i,j,2)=greenchannel(i,j);
azul(i,j,3)=bluechannel(i,j);
end
end
figure(2)
title('camadas rgb')
subplot(1,3,1)
imshow(vermelho)
subplot(1,3,2)
imshow(verde)
subplot(1,3,3)
imshow(azul)
%alinea b 
%convers~�o para tons de cinza
bwimagem=rgb2gray(imagem);
figure(3)
title('imagem preto e branco')

imshow(bwimagem)
resizedbw= imresize(bwimagem,[457 800]);
figure (4) 

title('imagem novo tamanho')
subplot(1,2,1)
imshow(resizedbw)
subplot(1,2,2)
imshow(imagem)
%
N=[3 5];

h1=ones(N(1),N(1))/(N(1)*N(1));
h2=ones(N(2),N(2))/(N(2)*N(2));
h3=(-1)*h1;
h4=(-1)*h2;
n1=((N(1)+1)/2);
n2=((N(2)+1)/2);
%filtros complementares
h3(n1,n1)=h3(n1,n1)+1
h4(n2,n2)=h4(n2,n2)+1
l1=imfilter(resizedbw,h1);
l2=imfilter(resizedbw,h2);
% as duas linhas seguintes fazem parte da alinea d
l3=imfilter(resizedbw,h3);
l4=imfilter(resizedbw,h4);
% prints da alinea c

figure(5)
%sgtitle('Imagens Filtradas')
subplot(2,2,1)
imshow(l1)
title('N=3 Filtro M�dia')
subplot(2,2,2)
imshow(l2)
title('N=5 Filtro M�dia')
%prints da alinea d
subplot(2,2,3)
imshow(l3)
title('N=3 Filtro Complementar')
subplot(2,2,4)
imshow(l4)
title('N=5 Filtro Complementar')

b = firpm(6,[0 0.3 0.7 1],[1 1 0 0]);
h = ftrans2(b);
[H,w] = freqz(b,1,64,'whole');

himage=imfilter(resizedbw,h);
%{
figure(6)
subplot(1,3,1)
imshow(himage)
title('Heatmap Filtragem Parks-McClellan')
subplot(1,3,2)
imshow(l3)
title('Heatmap Filtro complementar N=3')
subplot(1,3,3)
imshow(l4)
title('Heatmap Filtro complementar N=5')
colormap(jet(64))
figure(7)
subplot(1,2,1)
plot(w/pi-1,fftshift(abs(H)))
title('FFT da resposta em Magnitude')
subplot(1,2,2)
freqz2(h,[32 32]);
title('Resposta em Frequencia de h')
%}

filtroaverage = fspecial('average');
filtrolaplacian=fspecial('laplacian');
filtromotion=fspecial('motion');
filtroprewitt=fspecial('prewitt');
filtrosobel=fspecial('sobel');
filtrounsharp=fspecial('unsharp');
filtrogauss=fspecial('gaussian');
filtrolog=fspecial('log');
filtrodisk=fspecial('disk');
imaveragee=imfilter(resizedbw,filtroaverage);
imlaplacian=imfilter(resizedbw,filtrolaplacian);
immotion=imfilter(resizedbw,filtromotion);
imprewitt=imfilter(resizedbw,filtroprewitt);
imsobel=imfilter(resizedbw,filtrosobel);
imgauss=imfilter(resizedbw,filtrogauss);
imunsharp=imfilter(resizedbw,filtrounsharp);
imlog=imfilter(resizedbw,filtrolog);
imdisk=imfilter(resizedbw,filtrodisk);
figure(7)
subplot(3,3,1)
imshow(imaveragee)
title('Filtro Special Average')
subplot(3,3,2)
imshow(imlaplacian)
title('Filtro Special Laplacian')
subplot(3,3,3)
imshow(immotion)
title('Filtro Special Motion')
subplot(3,3,4)
imshow(imprewitt)
title('Filtro Special Prewitt')
subplot(3,3,5)
imshow(imsobel)
title('Filtro Special Sobel')
subplot(3,3,6)
imshow(imgauss)
title('Filtro Special Gauss')
subplot(3,3,7)
imshow(imunsharp)
title('Filtro Special Unsharp')
subplot(3,3,8)
imshow(imlog)
title('Filtro Special Log')
subplot(3,3,9)
imshow(imdisk)
title('Filtro Special Disk')
