%created by liang
%2019.11.30
%*********
%***

%*///*///
%��8.1 Ӧ���ݶ����Ӻ�LoG���ӽ��б�Ե���
a = imread('H:/coins.jpg');             %��ȡͼ��
a = rgb2gray(a);                        %ת���ɻҶ�ͼ��
bw1 = edge(a,'sobel');                  %sobel��Ե���
bw2 = edge(a,'prewitt');                %prewitt��Ե���
bw3 = edge(a,'roberts');                %roberts��Ե���
bw4 = edge(a,'log');                    %log��Ե���
figure,imshow(a);                       %��ʾԭͼ
subplot(221),imshow(bw1);               %��ʾsobel��Եͼ
xlabel('sobel');
subplot(222),imshow(bw2);               %��ʾprewitt��Եͼ
xlabel('prewitt');
subplot(223),imshow(bw3);               %��ʾroberts��Եͼ
xlabel('roberts');
subplot(224),imshow(bw4);               %��ʾlog��Եͼ
xlabel('log');