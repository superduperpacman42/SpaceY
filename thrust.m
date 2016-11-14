%funtion to return momentum change from burning fuel
function [p_x, p_y, p_z] = thrust(m_fuel, v_fuel, direction)
    d_fuel = -direction;
    p_fuel = m_fuel * v_fuel;
    d_mag = sqrt(sum(d_fuel.^2));
    p_x = p_fuel * d_fuel(1) / d_mag;
    p_y = p_fuel * d_fuel(2) / d_mag;
    p_z = p_fuel * d_fuel(3) / d_mag;
end