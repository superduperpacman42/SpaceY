% function to give force of gravity on obj2 by obj1, returns force vector
function f = gravity(obj1, obj2, m1, m2)
    G = 6.673e-11;
    d_x = obj1(1) - obj2(1);
    d_y = obj1(2) - obj2(2);
    d_z = obj1(3) - obj2(3);
    d = [d_x, d_y, d_z];
    r = sqrt(sum(d.^2));
    f = G * m1 * m2 / (r^2);
    f_x = f * d_x / r;
    f_y = f * d_y / r;
    f_z = f * d_z / r;
    f = [f_x, f_y, f_z];
end