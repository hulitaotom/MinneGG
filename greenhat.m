% Greenhat
close all; clear all; clc;
%%
%To detect Face
FDetect = vision.CascadeObjectDetector;

%Read the input image
I = imread('lenna.jpeg');
hat = imread('greenhat.png');
%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);

hat = imresize(hat, [BB(3) BB(3)*2]);
hatmask = I.*0;
hatmask(BB(1):(BB(1)+BB(3)-1), (BB(2)-BB(3)):(BB(2)+BB(3)-1), :) = hat;
Ihat = I + hatmask.*2;
imshow(Ihat)

%%


figure
imshow(I); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
end
title('Face Detection');
hold off;