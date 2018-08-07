%% Store Result Matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function store_result(sub)

% sub = {'F1', 'F2', 'M1', 'M2'};
n_folds = 5;
lambda = [0, 0.001, 0.002, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.5, 1, 5, 10];

mkdir('./Results');

res_struct = [];
av_score_matrix = [];
av_score_subwise = zeros(size(sub, 2), 1);
for s = 1:size(sub, 2)
    
    for fold = 1:n_folds
        load(['./' sub{s} '/Fold' num2str(fold) '/Best_lambda_index.mat'])
        load(['./' sub{s} '/Fold' num2str(fold) '/Test_score_DP_lambda' num2str(lambda(best_lambda_index)) '.mat']);
        load(['./' sub{s} '/Fold' num2str(fold) '/Test_fval_DP_lambda' num2str(lambda(best_lambda_index)) '.mat']);
        
        av_score_matrix(s, fold) = mean(score);
        av_score_subwise(s) = av_score_subwise(s) + mean(score);
        
        res_struct(s, fold).best_lambda = lambda(best_lambda_index);
        res_struct(s, fold).av_score = mean(score);
        res_struct(s, fold).av_fisher = mean(fval);
        
        figure;
        histogram(score);
        title([sub{s} ': Fold' num2str(fold) ' lambda = ' num2str(res_struct(s, fold).best_lambda) '(Av Score = ' num2str(res_struct(s, fold).av_score) ')']);
        xlabel('DTW Score');
        xlim([0 4]);
        ylabel('Number of Frames');
        savefig(['./Results/Hist_' sub{s} '_Fold_' num2str(fold) '.fig']);
        close;
        
        figure;
        scatter(score, fval, 'filled');
        title([sub{s} ': Fold' num2str(fold) ' lambda = ' num2str(res_struct(s, fold).best_lambda) '(Av Score = ' num2str(res_struct(s, fold).av_score) ')']);
        xlabel('DTW Score');
        xlim([0 4]);
        ylabel('Fisher Value');
        savefig(['./Results/Scatter_' sub{s} '_Fold_' num2str(fold) '.fig']);
        close;
        
        
    end
    av_score_subwise(s) = av_score_subwise(s) / n_folds;
    
end
save(['./Results/Av_Score_Subwise.mat'], 'av_score_subwise');
save('./Results/Av_Score_Matrix.mat', 'av_score_matrix');
save('./Results/Result.mat', 'res_struct');