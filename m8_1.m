%created by liang
%2019.11.30
%*********
%***

%*///*///
%¿˝8.1 ”¶”√Ã›∂»À„◊”∫ÕLoGÀ„◊”Ω¯––±ﬂ‘µºÏ≤‚
a = imread('H:/coins.jpg');             %∂¡»°ÕºœÒ
a = rgb2gray(a);                        %◊™ªª≥…ª“∂»ÕºœÒ
bw1 = edge(a,'sobel');                  %sobel±ﬂ‘µºÏ≤‚
bw2 = edge(a,'prewitt');                %prewitt±ﬂ‘µºÏ≤‚
bw3 = edge(a,'roberts');                %roberts±ﬂ‘µºÏ≤‚
bw4 = edge(a,'log');                    %log±ﬂ‘µºÏ≤‚
figure,imshow(a);                       %œ‘ æ‘≠Õº
subplot(221),imshow(bw1);               %œ‘ æsobel±ﬂ‘µÕº
xlabel('sobel');
subplot(222),imshow(bw2);               %œ‘ æprewitt±ﬂ‘µÕº
xlabel('prewitt');
subplot(223),imshow(bw3);               %œ‘ æroberts±ﬂ‘µÕº
xlabel('roberts');
subplot(224),imshow(bw4);               %œ‘ ælog±ﬂ‘µÕº
xlabel('log');