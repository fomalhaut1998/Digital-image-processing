%created by liang
%2019.11.28
%*********
%***

%*///*///
%Í¼ÏñµÄÂß¼­ÔËËã

A = zeros(128);
A(40:67, 60:100) = 1;
figure(1);imshow(A);
B = zeros(128);B(50:80,40:70) = 1;
figure(2);imshow(B);
C = and(A,B);figure(3);imshow(C);
D = or(A,B);figure(4);imshow(D);
E = not(A);figure(5);imshow(E);
