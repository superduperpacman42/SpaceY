% Flow function for ode45: returns velocity, accleration, and mass vectors 
% in m/s, m/s^2, and kg given position, velocity, and mass vectors in m,
% m/s, and kg
function dS = getAcceleration(~, S)
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
    a_earth = gravity(sun, earth, m_sun, m_earth)/m_earth;
    a_mars = gravity(sun, mars, m_sun, m_mars)/m_mars;
    dS = [v_rocket'; v_earth'; v_mars'; a_rocket'; a_earth'; a_mars'; 0; 0; 0; 0];
end