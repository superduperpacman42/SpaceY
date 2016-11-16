% Flow function for ode45: returns velocity, accleration, and mass vectors 
% in m/s, m/s^2, and kg given position, velocity, and mass vectors in m,
% m/s, and kg
function [v_rocket, v_earth, v_mars, a_rocket, a_earth, a_mars, ...
    m_rocket, m_earth, m_mars, m_sun] = getAcceleration(t, S)
    rocket = S(1);
    earth = S(2);
    mars = S(3);
    v_rocket = S(4);
    v_earth = S(5);
    v_mars = S(6);
    m_rocket = S(7);
    m_earth = S(8);
    m_mars = S(9);
    m_sun = S(10);
    sun = [0,0,0]; % sun is reference point
    a_rocket = (gravity(earth, rocket, m_earth, m_rocket)...
              + gravity(mars, rocket, m_mars, m_rocket)...
              + gravity(sun, rocket, m_sun, m_rocket)...
              + drag(rocket, v_rocket, earth, mars))/m_rocket;
    a_earth = gravity(sun, earth, m_sun, m_earth)/m_earth;
    a_mars = gravity(sun, mars, m_sun, m_mars)/m_mars;
    dS = [v_rocket; v_earth; v_mars; a_rocket; a_earth; a_mars; 0;0;0;0];
end