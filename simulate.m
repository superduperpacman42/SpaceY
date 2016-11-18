% Runs a simulation using ode45 with the given initial conditions
% x = [rocket, earth, mars], v = [v_rocket, v_earth, v_mars], m =
% [m_rocket, m_earth, m_mars, m_sun], dtheta is around z axis, dphi is 
% inclination from plane of solar system, all units are in meters, m/s, kg,
% degrees, and seconds
function [T, S] = simulate(x, v, m, v_fuel, m_fuel, dtheta, dphi)
    dtheta = deg2rad(dtheta);
    dphi = deg2rad(dphi);
    direction = [v(1), v(2), v(3)]; % incorporate dtheta and dphi
    v(1) = v(1) + thrust(v_fuel, m_fuel, direction)/m(1);
    options = odeset('MaxStep', 1e5);
    [T, S] = ode45(@getAcceleration, [0,10*pi*1e7], [x, v, m], options);
end