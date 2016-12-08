function data = orbitData(T, S, deccelPoint)
    minimum = 1e100;
    i = 0;
    for t = 1:length(T)
        if abs(T(t)-deccelPoint(7)) < minimum
            i = t;
            minimum = abs(T(t)-deccelPoint(7));
        end
    end
    data = S(i:end, :);
end