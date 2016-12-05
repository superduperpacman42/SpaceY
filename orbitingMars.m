function success = orbitingMars(rocket, v_rocket, mars, v_mars, m_mars, ...
    sun, m_sun)
    G = 6.673e-11;
    r = norm(rocket - mars);
    v = norm(v_rocket - v_mars);
    e_gravity = -m_mars*G/r;
    e_kinetic = 0.5*v^2;
%     r_sun_rocket = norm(rocket-sun);
%     r_sun_mars = norm(mars-sun);
%     e_sun = -m_sun*G/r_sun_mars - -m_sun*G/r_sun_rocket;
    success = e_kinetic + e_gravity; % negative = orbiting
    if r>0.56e9
       success = r; 
    end
end

% mars = zero energy
% closer to sun = negative energy (has to escape)
% further from sun = positive energy
% energy for rocket to escape - energy needed for mars to escape (reference)
% eg rocket - eg mars