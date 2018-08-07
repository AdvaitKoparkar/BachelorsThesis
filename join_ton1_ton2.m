%% View TON1 and TON2 together

function join_ton1_ton2(sub)

    lambda = [0, 0.001, 0.002, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.5, 1, 5, 10];

    for s = 1:size(sub, 2)
        for fold = 1:5
            load(['./Lower_contours/' sub{s} '/Fold' num2str(fold) '/Lower_' sub{s} '_fold' num2str(fold) '.mat']);

            load(['./Autorun_Ton2/' sub{s} '/Fold' num2str(fold) '/Best_lambda_index.mat']);
            load(['./Autorun_Ton2/' sub{s} '/Fold' num2str(fold) '/Test_Predicted_' sub{s} '_DP_lambda_' num2str(lambda(best_lambda_index)) '.mat']);
            TON2 = predicted_contours_DP;

            for f = 1:size(TON2, 2)
%                 intersection = InterX(lower_contour(f).contour', TON2(f).Along');
%                 if ~isempty(intersection)
%                     j = length(lower_contour(f).contour);
%                     while find_distance(lower_contour(f).contour(j, :), intersection') > find_distance(lower_contour(f).contour(j-1, :), intersection')
%                         j = j - 1;
%                     end
%                     lower_contour(f).contour = [lower_contour(f).contour(1:j-1, :); intersection'];
%                     
%                     j = 1;
%                     while find_distance(TON2(f).Along(j, :), intersection') > find_distance(TON2(f).Along(j+1, :), intersection')
%                         j = j + 1;
%                     end
%                     TON2(f).Along = [intersection'; TON2(f).Along(j+1:end, :)];
%                 end
                
                while lower_contour(f).contour(end, 2) > TON2(f).Along(1, 2)
                    lower_contour(f).contour = lower_contour(f).contour(1:end-1, :);
                end
                
                lower_contour(f).contour = remDuplicates([lower_contour(f).contour; TON2(f).Along]);
                
                
%                 imagesc(lower_contour(f).Frame); hold on;
%                 plot(lower_contour(f).contour(:, 1), lower_contour(f).contour(:, 2), 'c-');
%                 % plot(TON2(f).Along(:, 1), TON2(f).Along(:, 2), 'r-');
%                 hold off;
%                 pause(0.05);
                
                
            end
            save(['./Lower_contours/' sub{s} '/Fold' num2str(fold) '/Lower_' sub{s} '_fold' num2str(fold) '.mat'], 'lower_contour');
        end
    end
end

function d_val = find_distance(p1, p2)
    d_val = sqrt(sum((p1 - p2).^2));
end