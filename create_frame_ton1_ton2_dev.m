%% Creates Frame by deleting pixels to the right of Ton1 - Dev

function create_frame_ton1_ton2_dev(sub)
% sub = {'F1'}; % , 'F2', 'M1', 'M2'};

lambda = [0, 0.001, 0.002, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.5, 1, 5, 10];

for s = 1:size(sub, 2)
    for fold = 1:5
        load(['./Autorun_Ton1/' sub{s} '/Fold' num2str(fold) '/Best_lambda_index.mat'])
        load(['./Autorun_Ton1/' sub{s} '/Fold' num2str(fold) '/Dev_Predicted_' sub{s} '_DP_lambda_' num2str(lambda(best_lambda_index)) '.mat'])
        
        right_cut = struct;
        
        for i = 1:length(predicted_contours_DP)

            for j = 1:length(predicted_contours_DP(i).Along)    
                x = ceil(predicted_contours_DP(i).Along(j, 1));
                y1 = floor(predicted_contours_DP(i).Along(j, 2));
                y2 = ceil(predicted_contours_DP(i).Along(j, 2));
                while x < size(predicted_contours_DP(i).Frame, 1)
                    predicted_contours_DP(i).Frame(y1, x) = 0;
                    predicted_contours_DP(i).Frame(y2, x) = 0;
                    x = x + 1;
                end
            end
            
            right_cut(i).Frame = predicted_contours_DP(i).Frame;
            right_cut(i).contour = predicted_contours_DP(i).Along;
        
%             imagesc(right_cut(i).Frame); hold on;
%             plot(right_cut(i).contour(:, 1), right_cut(i).contour(:, 2), 'r-');
%             hold off;
%             pause;
            
        end
        
        save(['./Lower_contours/' sub{s} '/Fold' num2str(fold) '/Lower_' sub{s} '_fold' num2str(fold) '_right_cut_dev.mat'], 'right_cut');
    end
end