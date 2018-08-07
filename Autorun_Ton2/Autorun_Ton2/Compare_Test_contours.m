%% DTW EVALUATION OF FISHER PREDICTED CONTOURS
% COMPARES PREDICTED CONTOURS AND RETURNS SCORE FOR EACH FRAME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear;
% clc;

function Compare_Test_contours(sub)

% sub = {'F1', 'F2', 'M1', 'M2'};
bad_score_thresh = 1.5;
% lambda = [0, 0.1, 0.5, 1, 5, 10];
lambda = [0, 0.001, 0.002, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.5, 1, 5, 10];

for s = 1:size(sub, 2)
    for fold = 1% :5
        
        load(['./' sub{s} '/Fold' num2str(fold) '/Best_lambda_index.mat']);
        l = best_lambda_index;
        
        disp(['Subject: ', sub{s}]);
        load(['./' sub{s} '/Fold' num2str(fold) '/Test_Predicted_' sub{s} '_DP_lambda_' num2str(lambda(l)) '.mat']);
        load(['./' sub{s} '/Fold' num2str(fold) '/Test.mat']);


        n_frames = length(predicted_contours_DP);
        score = zeros(n_frames, 1);
        fval = zeros(n_frames, 1);
        problem = struct;
        j = 1;
        for i = 1:n_frames
            score(i) = evaluate_dtw(predicted_contours_DP(i).Along, Test(i).Along);
            fval(i) = predicted_contours_DP(i).fval;
            disp(['Score of Frame: (lambda = ' num2str(lambda(l)) ')' num2str(i) ' out of ' num2str(length(predicted_contours_DP)) ' = ' num2str(score(i))]);

%             imagesc(Test(i).Frame); hold on; 
%             plot(predicted_contours_DP(i).Along(:, 1), predicted_contours_DP(i).Along(:, 2), 'r.');
%             plot(Test(i).Along(:, 1), Test(i).Along(:, 2), 'g.');
%             hold off;
%             pause(0.1);
%             close;

            if score(i) > bad_score_thresh
                problem(j).predicted = predicted_contours_DP.Along;
                problem(j).fval = fval(i);
                problem(j).score = score(i);
                problem(j).actual = Test(i).Along;
                problem(j).frame_number = i;
                j = j + 1;
            end


        end
        save(['./' sub{s} '/Fold' num2str(fold) '/Test_score_DP_lambda' num2str(lambda(l)) '.mat'], 'score');
        save(['./' sub{s} '/Fold' num2str(fold) '/Test_fval_DP_lambda' num2str(lambda(l)) '.mat'], 'fval');
        save(['./' sub{s} '/Fold' num2str(fold) '/Problem/Test_Problem_' sub{s} '_DP_lambda' num2str(lambda(l)) '.mat'], 'problem');
        clear problem;
    end
end