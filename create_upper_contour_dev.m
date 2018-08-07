%% Create Complete Upper Contour
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function create_upper_contour_dev(sub)

hard_palate = {[24, 26; 25, 26; 26, 26; 27, 26; 28, 25; 29, 25; 30, 25; 31, 25; 32, 25; 33, 25], ...
                [24, 27; 25, 27; 26, 26; 27, 26; 28, 25; 29, 25; 30, 24; 31, 24; 32, 24; 33, 23; 34, 23; 35, 23], ...
                [24, 23; 25, 23; 26, 23; 27, 22; 28, 22; 29, 22; 30, 21; 31, 21; 32, 20; 33, 20; 34, 20; 35, 20; 36, 20; 37, 20; 38, 20], ...
                [24, 28; 25, 28; 26, 28; 27, 27; 28, 26; 29, 26; 30, 25; 31, 24; 32, 23; 33, 23; 34, 23; 35, 23; 36, 23; 37, 23]};

lambda = [0, 0.001, 0.002, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.5, 1, 5, 10];
            
            
% sub = {'F1', 'F2', 'M1', 'M2'};

for s = 1:size(sub, 2)
    
    if strcmp(sub{s}, 'F1'), hard_palate_sub = hard_palate{1}; 
    elseif strcmp(sub{s}, 'F2'), hard_palate_sub = hard_palate{2}; 
    elseif strcmp(sub{s}, 'M1'), hard_palate_sub = hard_palate{3}; 
    elseif strcmp(sub{s}, 'M2'), hard_palate_sub = hard_palate{4}; end
    
    % hard_palate_sub = hard_palate{s};
    for fold = 1:5
        load(['./Autorun_UL/' sub{s} '/Fold' num2str(fold) '/Best_lambda_index.mat'])
        load(['./Autorun_UL/' sub{s} '/Fold' num2str(fold) '/Dev_Predicted_' sub{s} ...
              '_DP_lambda_' num2str(lambda(best_lambda_index)) '.mat'])
         % a = best_lambda_index;
         UL = predicted_contours_DP;
         
         load(['./Autorun_Vel/' sub{s} '/Fold' num2str(fold) '/Best_lambda_index.mat'])
         load(['./Autorun_Vel/' sub{s} '/Fold' num2str(fold) '/Dev_Predicted_' sub{s} ...
              '_DP_lambda_' num2str(lambda(best_lambda_index)) '.mat'])
         % b = best_lambda_index;
         VEL = predicted_contours_DP;
         
         clear predicted_contours_DP;
         clear best_lambda_index;
         
         mkdir Upper_contours
         mkdir(['./Upper_contours/' sub{s} '/Fold' num2str(fold)]);
         
         upper_contour = struct;
         for f = 1:size(VEL, 2)
             upper_contour(f).contour = [UL(f).Along; hard_palate_sub; VEL(f).Along];
             remDuplicates(upper_contour(f).contour);
             upper_contour(f).Frame = UL(f).Frame;
             
             imagesc(upper_contour(f).Frame); hold on;
             plot(upper_contour(f).contour(:, 1), upper_contour(f).contour(:, 2), 'r-');
             hold off;
             pause(0.05);
             
         end
         save(['./Upper_contours/' sub{s} '/Fold' num2str(fold) '/Upper_lip_' sub{s} '_fold' num2str(fold) '_dev.mat'], 'upper_contour');
    end
end