%% View TON1 and TON3 together

function join_ton1_ton3(sub)
    
if ~exist('Lower_contour', 'dir'), mkdir ./Lower_contours; end
    lambda = [0, 0.001, 0.002, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.5, 1, 5, 10];

    for s = 1:size(sub, 2)
        if ~exist(['Lower_contour/' sub{s}], 'dir'), mkdir(['./Lower_contours/' sub{s}]); end
        for fold = 1:5
            if ~exist(['./Lower_contours/' sub{s} '/Fold' num2str(fold)], 'dir'), mkdir(['./Lower_contours/' sub{s} '/Fold' num2str(fold)]); end
            
            load(['./Autorun_Ton1/' sub{s} '/Fold' num2str(fold) '/Best_lambda_index.mat']);
            load(['./Autorun_Ton1/' sub{s} '/Fold' num2str(fold) '/Test_Predicted_' sub{s} '_DP_lambda_' num2str(lambda(best_lambda_index)) '.mat']);
            TON1 = predicted_contours_DP;

            load(['./Autorun_Ton3/' sub{s} '/Fold' num2str(fold) '/Best_lambda_index.mat']);
            load(['./Autorun_Ton3/' sub{s} '/Fold' num2str(fold) '/Test_Predicted_' sub{s} '_DP_lambda_' num2str(lambda(best_lambda_index)) '.mat']);
            TON3 = predicted_contours_DP;
            
            lower_contour = struct;
            for f = 1:size(TON3, 2)
                while TON3(f).Along(end, 2) < TON3(f).Along(end - 1, 2)
                    TON3(f).Along = TON3(f).Along(1:end-1, :);
                end

                while TON1(f).Along(1, 2) < TON1(f).Along(2, 2)
                    TON1(f).Along = TON1(f).Along(2:end, :);
                end

                intersection = InterX(TON1(f).Along', TON3(f).Along');

                if ~isempty(intersection)

                    j = length(TON3(f).Along);
                    while find_distance(TON3(f).Along(j, :), intersection') > find_distance(TON3(f).Along(j-1, :), intersection')
                        j = j - 1;
                    end
                    TON3(f).Along = [TON3(f).Along(1:j-1, :); intersection'];
                    
                    j = 1;
                    while find_distance(TON1(f).Along(j, :), intersection') > find_distance(TON1(f).Along(j+1, :), intersection')
                        j = j + 1;
                    end
                    TON1(f).Along = [intersection'; TON1(f).Along(j+1:end, :)];
                end

                if TON3(f).Along(end, 2) > TON1(f).Along(1, 2) % If contour 3 is lower trim it
                    j = length(TON3(f).Along);
                    while TON3(f).Along(j, 2) > TON1(f).Along(1, 2)
                        j = j - 1;
                        TON3(f).Along = TON3(f).Along(1:j, :);
                    end
                elseif TON1(f).Along(1, 2) > TON3(f).Along(end, 2) % If contour 1 is lower trim it
                    j = 1;
                    while TON1(f).Along(j, 2) > TON3(f).Along(end, 2)
                        j = j + 1;
                        TON1(f).Along = TON1(f).Along(j:end, :);
                    end
                end
                
                lower_contour(f).contour = remDuplicates([TON3(f).Along; intersection'; TON1(f).Along]);
                lower_contour(f).Frame = TON1(f).Frame;

%                 imagesc(lower_contour(f).Frame); hold on;
%                 plot(lower_contour(f).contour(:, 1), lower_contour(f).contour(:, 2), 'r-');
% %                 plot(TON1(f).Along(1:end, 1), TON1(f).Along(1:end, 2), 'r.')
% %                 plot(TON3(f).Along(1:end, 1), TON3(f).Along(1:end, 2), 'c.')
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