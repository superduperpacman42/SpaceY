% Runs a simulation using ode45 with the given initial conditions
% x = [rocket, earth, mars], v = [v_rocket, v_earth, v_mars], m =
% [m_rocket, m_earth, m_mars, m_sun], dtheta is around z axis, dphi is 
% inclination from plane of solar system, all units are in meters, m/s, kg,
% degrees, and seconds
function [T, S, closestApproach] = simulate(x, v, m, v_fuel, m_fuel)
    v_rocket = [v(1), v(2), v(3)];
    v_earth = [v(4), v(5), v(6)];
    v_rocket = v_rocket + (v_rocket-v_earth) *1.9;%+ thrust(v_fuel, m_fuel, v_rocket)/m(1);
    v(1) = v_rocket(1);
    v(2) = v_rocket(2);
    v(3) = v_rocket(3);
    closestApproach = 1e100;
    options = odeset('MaxStep', 1e3, 'RelTol', 1e7, 'Event', @events);
    [T, S] = ode45(@getAcceleration, [0,pi*1e7], [x, v, m], options);
    
    function [value,isterminal,direction] = events(~,S)
        rocket = [S(1), S(2), S(3)];
        vrocket = [S(10), S(11), S(12)];
        mars = [S(7), S(8), S(9)];
        vmars = [S(16), S(17), S(18)];
        mmars = S(21);
        value = orbitingMars(rocket, vrocket, mars, vmars, mmars);
        if(value < closestApproach)
            closestApproach = value;
        end
        isterminal = 0;
        direction = 0;
    end
end