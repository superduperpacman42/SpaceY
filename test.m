function val = test(params)
    params
    theta = params(1);
    m_fuel1 = params(2);
    m_fuel2 = params(3);
    theta = deg2rad(theta);
    x = [[152.1e9, -35786e3, 0], [152.1e9, 0, 0], [249.23e9*cos(theta), 249.23e9*sin(theta), 0]];
    v = [[3337, 29.29e3, 0], [0, 29.29e3, 0], [-21.97e3*sin(theta), 21.97e3*cos(theta), 0]];
    m = [27000, 5.972e24, 6.39e23, 1.989e30];
    [T, S, closestApproach] = simulate(x, v, m, 348*9.81, m_fuel1, m_fuel2);
    val = min(closestApproach)
    clf;
    subplot(2,1,1);
    plot(S(:,1), S(:,2), 'go');
    hold on;
    plot(S(:,4), S(:,5), 'b');
    plot(S(:,7), S(:,8), 'r');
    plot(0,0,'k.');
    xlabel('x (meters)');
    ylabel('y (meters)');
    legend('Rocket', 'Earth', 'Mars', 'Sun');
    title('Earth to Mars Transfer');
    axis equal;
    subplot(2,1,2);
    plot(closestApproach);
    drawnow;
end