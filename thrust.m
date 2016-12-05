%funtion to return momentum change from burning fuel
function dv = thrust(v_fuel, m_fuel, m_rocket, direction)
    d_fuel = direction/norm(direction);
    dv = v_fuel*log((m_fuel+m_rocket)/m_rocket)*d_fuel;
end