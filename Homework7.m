
im = imread('lena.bmp');
im = rgb2gray(im);

figure(1);
imshow(im);

[C, S] = wavedec2(im, 5, 'bior3.3');

Rindex = zeros(17, 1);
Rindex(1) = 1;
Rindex(2) = 1 + S(2, 1)*S(2, 1); 
Rindex(3) = Rindex(1) + S(2, 1)*S(2, 1); 
Rindex(4) = Rindex(2) + S(2, 1)*S(2, 1); 
Rindex(5) = Rindex(3) + S(2, 1)*S(2, 1); 
Rindex(6) = Rindex(4) + S(3, 1)*S(3, 1); 
Rindex(7) = Rindex(5) + S(3, 1)*S(3, 1);
Rindex(8) = Rindex(6) + S(3, 1)*S(3, 1); 
Rindex(9) = Rindex(7) + S(4, 1)*S(4, 1); 
Rindex(10) = Rindex(8) + S(4, 1)*S(4, 1);
Rindex(11) = Rindex(9) + S(4, 1)*S(4, 1); 
Rindex(12) = Rindex(10) + S(5, 1)*S(5, 1); 
Rindex(13) = Rindex(11) + S(5, 1)*S(5, 1); 
Rindex(14) = Rindex(12) + S(5, 1)*S(5, 1); 
Rindex(15) = Rindex(13) + S(6, 1)*S(6, 1); 
Rindex(16) = Rindex(14) + S(6, 1)*S(6, 1); 
Rindex(17) = 275278; 


limits = zeros(16, 1);
limits(1) = 0; 
limits(2) = 500; 
limits(3) = 40; 
limits(4) = 25; 
limits(5) = 10; 
limits(6) = 10; 
limits(7) = 20; 
limits(8) = 10; 
limits(9) = 10; 
limits(10) = 30; 
limits(11) = 10; 
limits(12) = 5; 
limits(13) = 15; 
limits(14) = 5; 
limits(15) = 7; 
limits(16) = 32; 


cLimit = zeros(1, 275278);


for i = 1:16
portion = C(Rindex(i):Rindex(i+1));
portion(abs(portion)<limits(i)) = 0;
cLimit(Rindex(i):Rindex(i+1)) = portion;
end

% Reconstruct Lena from the thresholded C
im1 = waverec2(cLimit, S, 'bior3.3');

figure(2);
imshow(uint8(im1));
disp(length(find(cLimit==0)));