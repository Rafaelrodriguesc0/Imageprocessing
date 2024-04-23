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
%figure(2)
%title('camadas rgb')
%subplot(1,3,1)
%imshow(vermelho)
%subplot(1,3,2)
%imshow(verde)
%subplot(1,3,3)
%imshow(azul)
%alinea b 
%convers~ão para tons de cinza
bwimagem=rgb2gray(imagem);
figure(3)
title('imagem preto e branco')

imshow(bwimagem)
resizedbw= imresize(bwimagem,[914 800]);
figure (4) 
title('imagem novo tamanho')
imshow(resizedbw)

N=[3 5];

h1=ones(N(1),N(1))/(N(1)*N(1));
h2=ones(N(2),N(2))/(N(2)*N(2));
h3=1.-h1;
h4=1.-h2;

l1=imfilter(resizedbw,h1);
l2=imfilter(resizedbw,h2);

figure(5)
subplot(1,2,1)
imshow(l1)
subplot(1,2,2)
imshow(l2)