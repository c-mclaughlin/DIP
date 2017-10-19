function [rmin,rmax,rmed] = roi_stats(region,smax,s)
% Limits for ROI
ll = ceil(smax/2)-floor(s/2);
ul = ceil(smax/2)+floor(s/2);

v = ones(smax*smax,1);
count = 1;

for i = ll:ul
    for j = ll:ul
        v(count) = region(i,j);
        count = count+1;
    end
end

v = visort(v,s*s);
rmed = v(ceil(s*s/2));
rmin = v(1);
rmax = v(s*s);