%created by liang
%2019.12.1
%*********
%***

%*///*///
%例9.14向量梯度边缘检测

rgb = imread('H:/coin.jpg');            %读取图像
sob = fspecial('sobel');                %得到sobel算子模板
Rx = imfilter(double(rgb(:,:,1)),sob,'replicate');
                                        %对红色分量进行x方向sobel算子滤波
Ry = imfilter(double(rgb(:,:,1)),sob,'replicate');
                                        %对红色分量进行y方向sobel算子滤波
Gx = imfilter(double(rgb(:,:,2)),sob,'replicate');
                                        %对绿色分量进行x方向sobel算子滤波
Gy = imfilter(double(rgb(:,:,2)),sob,'replicate');
                                        %对绿色分量进行y方向sobel算子滤波
Bx = imfilter(double(rgb(:,:,3)),sob,'replicate');
                                        %对蓝色分量进行x方向sobel算子滤波
By = imfilter(double(rgb(:,:,3)),sob,'replicate');
                                        %对蓝色分量进行y方向sobel算子滤波
r_gradiant = mat2gray(max(Rx,Ry));      %得到红色分量的最大梯度值图像
g_gradiant = mat2gray(max(Gx,Gy));      %得到绿色分量的最大梯度值图像
b_gradiant = mat2gray(max(Bx,By));      %得到蓝色分量的最大梯度值图像
rgb_gradiant = rgb2gray(cat(3,r_gradiant,g_gradiant,b_gradiant));
                                        %将3个分量梯度图像合成
gxx = Rx.^2+Gx.^2+Bx.^2;                %计算u的模
gyy = Ry.^2+Gy.^2+By.^2;                %计算v的模
gxy = Rx.*Ry+Gx.*Gy+Bx.*By;             %计算u与v的点积
theta = 0.5*(atan(2*gxy./(gxx-gyy+eps)));%计算变化率最大的方向
G1 = 0.5*((gxx+gyy)+(gxx-gyy).*cos(2*theta)+2*gxy.*sin(2*theta));
                                         %计算变化率最大方向上的梯度的幅值
theta = theta+pi/2;                     %由于tan函数的周期性，旋转90度再次计算
G2 = 0.5*((gxx+gyy)+(gxx-gyy).*cos(2*theta)+2*gxy.*sin(2*theta));
                                         %计算变化率最大方向上的梯度的幅值
G1 = G1.^0.5;
G2 = G2.^0.5;
rgb_vectorgradiant = mat2gray(max(G1,G2));%取二个幅值的最大值
diff = abs(rgb_vectorgradiant-rgb_gradiant);%计算二种方法得到的梯度值之差
figure,imshow(rgb);                         %显示原图像
figure,imshow(r_gradiant);                  %显示红色分量边缘图像
figure,imshow(g_gradiant);                  %显示绿色分量边缘图像
figure,imshow(b_gradiant);                  %显示蓝色分量边缘图像
figure,imshow(rgb_gradiant);                %显示三分量边缘合成的边缘图像
figure,imshow(rgb_vectorgradiant);          %显示向量方法计算得到的边缘图像
figure,imshow(diff);                        %显示二种边缘图之差
