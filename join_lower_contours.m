%% JOIN LOWER CONTOURS

function join_lower_contours(sub)
    %  sub = {'F1', 'F2', 'M1', 'M2'};
    for s = 1:size(sub, 2)
        join_ton1_ton3(sub);
        join_ton1_ton2(sub);
    end
end