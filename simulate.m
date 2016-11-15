% Runs a simulation using ode45 with the given initial conditions
% rocket/planets/sun are structs with x, v, and m
% dtheta is around z axis, dphi is inclination from plane of solar system
% units are meters, kg, m/s, and degrees, time in seconds
function simulate(rocket, earth, mars, sun, m_fuel, v_fuel, dtheta, dphi)
    dtheta = deg2rad(dtheta);
    dphi = deg2rad(dphi);
    rocket.v = rocket.v + thrust(m_fuel, v_fuel, rocket.v)/rocket.m;
    ode45(@getAcceleration, [0,10000000], v_earth);
end