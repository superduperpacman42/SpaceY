function success = orbitingMars(S)
    G = 6.673e-11;
    dx = [S(:,1)-S(:,7), S(:,2)-S(:,8), S(:,3)-S(:,9)];
    dist = (dx(:,1).^2 + dx(:,2).^2 + dx(:,3).^2).^.5;
    v = [S(end, 10)-S(end, 13), S(end, 11)-S(end, 14), S(end, 12)-S(end, 15)];
    r = dist(end);
    vtarget = sqrt(6.39e23*G/r);
    e = abs(min(dist)-max(dist))/abs(min(dist)+max(dist));
    success = max(e, abs((norm(v) - vtarget)/vtarget));
    if abs((norm(v) - vtarget)/vtarget) < 100
        success = e;
    end
%     end
%     success = abs(norm(v) - vtarget);
% %     success = abs(min(dist)-max(dist))/abs(min(dist)+max(dist));
end