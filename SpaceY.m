% params = 1.0e+05 * [0.000176075811029, 3.098592734707340, 0.274011747614610];
% solution = fminsearch(@test, params)

% ACTUAL BEST DATA: 1.0e+05 *
%    0.000176075811029   3.098592734707340   0.274011747614610

xtarget = 0.000176075811029e5;
ytarget = 3.098592734707340e5;
dx = xtarget / 5;
dy = ytarget / 5;
xres = 30; % number of data points
yres = 30; % number of data points
xmin = xtarget - dx;
xmax = xtarget + dx;
ymin = ytarget - dy;
ymax = ytarget + dy;

data = zeros(xres, yres);
angles = zeros(1, xres);
fuels = zeros(1, yres);

for x = 1:xres
    theta = x*(xmax-xmin)/xres+xmin;
    angles(x) = theta;
    for y = 1:yres
        fuel = y*(ymax-ymin)/yres+ymin;
        fuels(y) = fuel;
        a = test([theta, fuel]);
        data(x, y) = a;
    end
end
data
clf;
hold on;
pcolor(angles, fuels, data');
contour(angles, fuels, data', [0.56e9,0.56e9], 'r.');
xlabel('Angle (degrees)');
ylabel('Fuel (kg)');
title('Closest Approach to Mars');
plot(0.000176075811029e5,3.098592734707340e5,'r.', 'MarkerSize',20);
