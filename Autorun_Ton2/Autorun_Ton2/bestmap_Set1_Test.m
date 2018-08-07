%% USE DP to Find Predicted Contours for Set 1 of F2
% INPUT: TRAINING CONTOURS, TEST Contours, Fisher Matrix, DTW Matrix
% OUTPUT: MAPPED PREDICTED CONTOURS FOR DIFFERENT LAMBDA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function bestmap_Set1_Test(sub)

% sub = {'F1', 'F2', 'M1', 'M2'};
lambda = [0, 0.001, 0.002, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.5, 1, 5, 10];


for s = 1:size(sub, 2)
    for fold = 1:5

        load([sub{s} '/Fold' num2str(fold) '/Training.mat']); %Loading Training
        TR = Training;
        load([sub{s} '/Fold' num2str(fold) '/Test.mat']); % LOading Test
        TEST = Test;

        load(['./' sub{s} '/Fold' num2str(fold) '/DTW_Matrix.mat']);
        DM = DTW_Matrix;

        % Creating Fisher Matrix for All five Training Clips
        load(['./' sub{s} '/Fold' num2str(fold) '/Fisher_Matrix_Test.mat']);
        FM = Fisher_Matrix_Test;
        
        load(['./' sub{s} '/Fold' num2str(fold) '/Best_lambda_index.mat']);
        l_best = lambda(best_lambda_index);
        
        l = l_best;                              % For each lambda
        disp(l);
        OI = bestmap(FM, DM, l);

        predicted_contours_DP = struct;
        for i = 1:size(TEST, 2)

    %         if l == 0 && i == 426
    %             pause
    %         end

            predicted_contours_DP(i).Along = TR(OI(i)).Along;
            predicted_contours_DP(i).In = TR(OI(i)).In;
            predicted_contours_DP(i).Out = TR(OI(i)).Out;
            predicted_contours_DP(i).Frame = TEST(i).Frame;
            predicted_contours_DP(i).fval = FM(OI(i), i);

    %         imshow(predicted_contours_DP(i).Frame); hold on;
    %         plot(predicted_contours_DP(i).Along(:, 1), predicted_contours_DP(i).Along(:, 2), 'r.'); hold off;
    %         pause;
            
            save(['./' sub{s} '/Fold' num2str(fold) '/Test_Predicted_' sub{s} '_DP_lambda_' num2str(l) '.mat'], 'predicted_contours_DP');

        end
    end
end
