clc;
clear all;

im1=im2double(imread('spiderman.jpg'));
im1=rgb2gray(im1);
Seasoned=imnoise(im1, 'salt & pepper', .1);
imshow(Seasoned,[min(min(Seasoned)),max(max(Seasoned))]);
%imhist(Seasoned);

J = Seasoned;
% 2-D Adaptive Median Filter
% This filter ignores edge effects and boundary conditions, as such, the
% output is a cropped version of the original image, where the amount
% cropped is equal to the maximum window size vertically and horizontally.

% Define smax as a constant
smax = 11;

% Initialize Output Image (J)


% Calculate valid region limits for filter
[nrows, ncols] = size(Seasoned);
ll = ceil(smax/2);
ul = floor(smax/2);

% Loop over the entire image ignoring edge effects
for rows = ll:nrows-ul
    for cols = ll:ncols-ul
        
        window_ind = -ul:ul;        
        region = Seasoned(rows+window_ind,cols+window_ind);
        centerpixel = region(ll,ll);

        for s = 3:2:smax
            
            % We can collapse the ROI calculations into a single function
            [rmin,rmax,rmed] = roi_stats(region,smax,s);

            % adapt region size
            if rmed > rmin && rmed < rmax
                if centerpixel <= rmin || centerpixel >= rmax
                    J(rows,cols) = rmed;
                end

                % stop adapting
                break;
            end
        end
    end
end
figure(2);
imshow(J,[min(min(J)),max(max(J))]);

