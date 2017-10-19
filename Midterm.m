clc;
clear all;

im1=im2double(imread('spiderman.jpg'));
im1=rgb2gray(im1);


figure(1);
imshow(im1,[min(min(im1)),max(max(im1))]);

blurfilt=fspecial('motion',21,11);
imblur=imfilter(im1,blurfilt,'conv','circular');

figure(2);
imshow(imblur,[min(min(imblur)),max(max(imblur))]);

%vert=500;
%horz=500;
%gauss_stdev = 25;
%imGaussBlur=(gauss_stdev.*randn(vert,horz)) + imblur;
imGaussBlur=imnoise(imblur, 'gaussian', 0, .0001);
%imGaussBlur=imfilter(imblur, imGaussfilt);

figure(3);
imshow(imGaussBlur,[min(min(imGaussBlur)),max(max(imGaussBlur))]);

%imGaussBlur1 = fft2(imGaussBlur);

%unblurfilt = psf2otf(blurfilt, size(imblur));
%for i = 1:size(unblurfilt, 1)
  % for j = 1:size(unblurfilt, 2)
  %      if unblurfilt(i, j) == 0
   %         unblurfilt(i, j) = 0.0000001;
  %      end
 %   end
%end
%unblurfilt=uint8(255 * unblurfilt);
imRestored= deconvlucy(imGaussBlur, blurfilt);
%imRestored= ifft2(imRestored);
figure(4);

imshow(imRestored,[min(min(imRestored)),max(max(imRestored))]);

%estimated_nsr= .01 / var(im1(:));
WienerRestore=deconvwnr(imGaussBlur, blurfilt, .0001);
figure(5);
imshow(WienerRestore,[min(min(WienerRestore)),max(max(WienerRestore))]);

regRestore=deconvreg(imGaussBlur, blurfilt, .0001);
figure(6);
imshow(double(regRestore),[min(min(regRestore)),max(max(regRestore))]);


