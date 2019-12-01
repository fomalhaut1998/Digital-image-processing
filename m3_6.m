%created by liang
%2019.11.28
%*********
%***

%*///*///
%³ý·¨ÔËËã

moon = imread('H:/coin.jpg');
I = double(moon);
J = I*0.43+90;
k = I*0.1+90;
L = I*0.01+90;
moon2 = uint8(J);
moon3 = uint8(K);
moon4 = uint8(L);
J = imdivide(moon,moon2);
K = imdivide(moon, moon3);
L = imdivide(moon, moon4);
subplot(1,4,1),imshow(moon);
subplot(1,4,2),imshow(J,[]);
subplot(1,4,3),imshow(K,[]);
subplot(1,4,4),imshow(L,[]);