% Flow function for ode45, returns acceleration vectors in m/s^2 given 
% [rocket, earth, mars, sun]
function [a_rocket, a_earth, a_mars] = getAcceleration(t, bodies)
    f_rocket = gravity(earth, rocket) + gravity(mars, rocket) + gravity...
        (sun, rocket); % + drag eventually
    a_rocket = f_rocket/rocket.m;
    f_earth = gravity(sun, earth);
    a_earth = f_earth/earth.m;
    f_mars = gravity(sun, mars);
    a_mars = f_mars/mars.m;
end