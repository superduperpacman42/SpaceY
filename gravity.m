% function to give force of gravity on obj2 by obj1, returns force vector
function [f_x, f_y, f_z] = gravity(obj1, obj2)
    G = 6.67e-11;
    m1 = obj1.m;
    m2 = obj2.m;
    d_x = obj1.x(1) - obj2.x(1);
    d_y = obj1.x(2) - obj2.x(2);
    d_z = obj1.x(3) - obj2.x(3);
    d = [d_x, d_y, d_z];
    r = sqrt(sum(d.^2));
    f = G * m1 * m2 / (r^2);
    f_x = f * d_x / r;
    f_y = f * d_y / r;
    f_z = f * d_z / r;
end