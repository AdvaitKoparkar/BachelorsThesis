%% Show Result
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function show_result(sub)

lambda = [0, 0.001, 0.002, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.5, 1, 5, 10];
% sub = {'F1', 'F2', 'M1', 'M2'};

for s = 1:size(sub, 2)
    for fold = 1:5
        fold = 3;
        load(['./' sub{s} '/Fold' num2str(fold) '/Best_lambda_index.mat']);
        load(['./' sub{s} '/Fold' num2str(fold) '/Test_score_DP_lambda' num2str(lambda(best_lambda_index)) '.mat']);
        load(['./' sub{s} '/Fold' num2str(fold) '/Test_Predicted_' sub{s} '_DP_lambda_' num2str(lambda(best_lambda_index)) '.mat']);
        load(['./' sub{s} '/Fold' num2str(fold) '/Test.mat']);
        for i = 1:size(predicted_contours_DP, 2)    
            imagesc(predicted_contours_DP(i).Frame); hold on; 
            plot(predicted_contours_DP(i).Along(:, 1), predicted_contours_DP(i).Along(:, 2), 'r.');
            plot(Test(i).Along(:, 1), Test(i).Along(:, 2), 'g.');
            hold off;
            pause(0.05);
        end
    end
end