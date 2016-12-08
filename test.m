function error = test(params)
    params
    theta = params(1);
    m_fuel1 = params(2);
    m_fuel2 = 0.274011747614610e5;
%     m_fuel2 = params(3);
    theta = deg2rad(theta);
    x = [[152.1e9, -35786e3, 0], [152.1e9, 0, 0], [249.23e9*cos(theta), 249.23e9*sin(theta), 0]];
    v = [[3337, 29.29e3, 0], [0, 29.29e3, 0], [-21.97e3*sin(theta), 21.97e3*cos(theta), 0]];
    m = [3900, 5.972e24, 6.39e23, 1.989e30];
    [T, S, error, deccelPoint] = simulate(x, v, m, 348*9.81, m_fuel1, m_fuel2);
    clf;
    subplot(2,1,1);
    plot(S(:,7), S(:,8), 'r', 'LineWidth', 2);
    hold on;
    plot(S(:,4), S(:,5), 'b', 'LineWidth', 2);
    plot(S(:,1), S(:,2), 'g', 'LineWidth', 2);
    plot(0,0,'k.');
    if ~isequal(deccelPoint, [0,0,0,0,0,0])
%         plot(deccelPoint(1), deccelPoint(2),'g.', 'LineWidth', 4);
%         plot(deccelPoint(4), deccelPoint(5),'r.', 'LineWidth', 4);
    end
    xlabel('x (meters)');
    ylabel('y (meters)');
    legend('Mars', 'Earth', 'Rocket', 'Sun');
    title('Earth to Mars Transfer');
    axis equal;
    
    subplot(2,1,2);
    if ~isequal(deccelPoint, [0,0,0,0,0,0])
        S2 = orbitData(T, S, deccelPoint);
        plot(S2(:,1)-S2(:,7), S2(:,2)-S2(:,8), 'g', 'LineWidth', 2);
    end
    hold on;
    plot(0, 0, 'r.', 'LineWidth', 4);
    xlabel('x (meters)');
    ylabel('y (meters)');
    legend('Rocket', 'Mars');
    title('Mars Orbit');
    axis equal;
    drawnow;
    error
%      deccelPoint(7)
end