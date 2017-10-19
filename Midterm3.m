clc;
clear all;

im1=im2double(imread('xray.jpg'));
im1=rgb2gray(im1);
imshow(im1,[min(min(im1)),max(max(im1))]);

s=[1 1 1; 1 1 1; 1 1 1]/9;
a=imfilter(im1, s);




figure(2);
imshow(a,[min(min(a)),max(max(a))]);

figure(3);
Final=histeq(a);
imshow(Final,[min(min(Final)),max(max(Final))]);