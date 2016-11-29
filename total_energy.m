% function energy = total_energy(S)
% Calculates total energy in the system

function energy = total_energy(S)
    
    % takes apart S
    rocket = [S(1), S(2), S(3)];
    earth = [S(4), S(5), S(6)];
    mars = [S(7), S(8), S(9)];
    v_rocket = [S(10), S(11), S(12)];
    v_earth = [S(13), S(14), S(15)];
    v_mars = [S(16), S(17), S(18)];
    m_rocket = S(19);
    m_earth = S(20);
    m_mars = S(21);
    m_sun = S(22);
    
    % gravitational constant
    G = 6.673e-11;
    
    % distances
    r_earth_sun = sqrt(sum(earth.^2));
    r_mars_sun = sqrt(sum(mars.^2));
    r_rocket_sun = sqrt(sum(rocket.^2));
    r_earth_mars = sqrt(sum((earth-mars).^2));
    r_rocket_earth = sqrt(sum((rocket - earth).^2));  
    r_rocket_mars = sqrt(sum((rocket - mars).^2));
    
    % kenetic energies
    ke_earth = .5 * m_earth * sum(v_earth.^2);
    ke_mars = .5 * m_mars * sum(v_mars.^2);
    ke_rocket = .5 * m_rocket * sum(v_rocket.^2);
    
    % potential energies
    pe_earth_sun = G * m_earth * m_sun / r_earth_sun;
    pe_mars_sun = G * m_mars * m_sun / r_mars_sun;
    pe_rocket_sun = G * m_rocket * m_sun / r_rocket_sun;
    pe_rocket_earth = G * m_rocket * m_earth / r_rocket_earth;
    pe_rocket_mars = G * m_rocket * m_mars / r_rocket_mars;
    pe_earth_mars = G * m_earth * m_mars / r_earth_mars;
    
    ke = ke_earth + ke_mars + ke_rocket; % kinetic energy
    pe = pe_earth_sun + pe_mars_sun + pe_rocket_sun + pe_rocket_earth + ...
        pe_rocket_mars + pe_earth_mars; % potential energy
    
    energy = ke + pe; % total energy
end