% Runs a simulation using ode45 with the given initial conditions
% x = [rocket, earth, mars], v = [v_rocket, v_earth, v_mars], m =
% [m_rocket, m_earth, m_mars, m_sun], dtheta is around z axis, dphi is 
% inclination from plane of solar system, all units are in meters, m/s, kg,
% degrees, and seconds
function [T, S, error, deccelPoint] = simulate(x, v, m, v_fuel, m_fuel1, m_fuel2)
    v_rocket = [v(1), v(2), v(3)];
    v_earth = [v(4), v(5), v(6)];
    m_rocket = m(1);
%     v_rocket = v_rocket + thrust(v_fuel, m_fuel1, m_rocket+0.081e5, v_rocket-v_earth);
    v_rocket = v_rocket + thrust(v_fuel, m_fuel1, m_rocket+m_fuel2, v_rocket-v_earth);
    v(1) = v_rocket(1);
    v(2) = v_rocket(2);
    v(3) = v_rocket(3);
    options = odeset('MaxStep', 1e4, 'RelTol', 1e7);%, 'Event', @events);
    decceleration = [0,0,0];
    deccelPoint = [0,0,0,0,0,0];
    mindist = 1e100;
    [T, S] = ode45(@getAcceleration, [0,1*pi*1e7], [x, v, m], options);
    error = mindist;
%     if isequal(deccelPoint, [0,0,0,0,0,0])
%         error = mindist;
%     else
%         S2 = orbitData(T, S, deccelPoint);
%         error = orbitingMars(S2);
%         if error < 200
%             error = (m_fuel1 + m_fuel2)/10000;
%         end
%     end
    
    % Flow function for ode45: returns velocity, accleration, and mass vectors 
    % in m/s, m/s^2, and kg given position, velocity, and mass vectors in m,
    % m/s, and kg
    function dS = getAcceleration(T, S)
        rocket = [S(1), S(2), S(3)];
        earth = [S(4), S(5), S(6)];
        mars = [S(7), S(8), S(9)];
        sun = [0,0,0]; % sun is reference point
        v_rocket = [S(10), S(11), S(12)];
        v_earth = [S(13), S(14), S(15)];
        v_mars = [S(16), S(17), S(18)];
        m_rocket = S(19);
        m_earth = S(20);
        m_mars = S(21);
        m_sun = S(22);
        a_rocket = (gravity(earth, rocket, m_earth, m_rocket)...
                  + gravity(mars, rocket, m_mars, m_rocket)...
                  + gravity(sun, rocket, m_sun, m_rocket)...
                  + drag(rocket, v_rocket, earth, mars))/m_rocket;
        a_earth = (gravity(sun, earth, m_sun, m_earth) + gravity(rocket, earth, m_rocket, m_earth))/m_earth;
        a_mars = (gravity(sun, mars, m_sun, m_mars) + gravity(rocket, mars, m_rocket, m_mars))/m_mars;
        if norm(rocket - mars) < mindist
            mindist = norm(rocket - mars);
        end
%         if isequal(decceleration, [0,0,0]) && norm(rocket - mars) < 0.56e9
%             deccelPoint = [rocket, mars, T];
%             decceleration = thrust(v_fuel, m_fuel2, m_rocket, v_mars-v_rocket);
%         end
        v_rocket = v_rocket + decceleration;
        dS = [v_rocket'; v_earth'; v_mars'; a_rocket'; a_earth'; a_mars'; 0; 0; 0; 0];
    end
end