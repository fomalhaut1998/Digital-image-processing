%created by liang
%2019.11.30
%*********
%***

%*///*///
%例8.7 二值图像的4连通和8连通区域标记

BW = [1 1 1 0 0 0 1 0 1 0 1 1
      1 0 1 0 1 1 0 1 0 1 0 1
      0 1 0 1 0 1 0 1 1 1 1 1
      1 1 0 1 0 1 1 0 0 1 1 1 
      0 0 0 1 0 0 1 0 1 0 1 1 ];            %一幅二值图像
L4 = bwlabel(BW,4);                        %按4连通标记出各个连通区域
L8 = bwlabel(BW,8);                        %按8连通标记出各个连通区域
L4,L8