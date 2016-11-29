function success = orbitingMars(rocket, v_rocket, mars, v_mars, m_mars)
    G = 6.673e-11;
    dx = rocket - mars;
    r = sqrt(dx(1)^2+dx(2)^2+dx(3)^2);
    dv = v_rocket - v_mars;
    v = sqrt(dv(1)^2+dv(2)^2+dv(3)^2);
    e_gravity = -m_mars*G/r;
    e_kinetic = 0.5*v^2;
    success = e_kinetic + e_gravity; % negative = orbiting
end