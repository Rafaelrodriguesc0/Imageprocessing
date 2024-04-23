imagem = imread('euro2003.png','png');
figure(1)
imshow(imagem);
redchannel=imagem(:,:,1);
greenchannel=imagem(:,:,2); 
bluechannel=imagem(:,:,3);
figure(2)
for j=1:1601
for i=1:914
canaldois(i,j)=0;
canaltres(i,j)=0;
vermelho(i,j,1)= redchannel(i,j);
vermelho(i,j,2)=canaldois(i,j);
vermelho(i,j,3)=canaltres(i,j);

verde(i,j,1)= canaldois(i,j);
verde(i,j,2)=greenchannel(i,j);
verde(i,j,3)=canaltres(i,j);

azul(i,j,1)= canaldois(i,j);
azul(i,j,2)=canaltres(i,j);
azul(i,j,3)=bluechannel(i,j);
end
end

subplot(1,3,1)
imshow(vermelho)
subplot(1,3,2)
imshow(azul)
subplot(1,3,3)
imshow(verde)
