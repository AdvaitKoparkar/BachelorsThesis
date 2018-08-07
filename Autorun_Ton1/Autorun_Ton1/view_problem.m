%% View Problem Test

function view_problem(sub)

% sub = {'F1', 'F2', 'M1', 'M2'};
lambda = [0, 0.001, 0.002, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.5, 1, 5, 10];
n_folds = 5;

for s = 1:size(sub, 2)
    for fold = 1:n_folds
        load(['./' sub{s} '/Fold' num2str(fold) '/Best_lambda_index.mat']);
        load(['./' sub{s} '/Fold' num2str(fold) '/Test.mat']);
        
        l = best_lambda_index;
        load(['./' sub{s} '/Fold' num2str(fold) '/Problem/Test_Problem_' sub{s} '_DP_lambda' num2str(lambda(l)) '.mat']);
        
        
        
        for f = size(problem, 2)
                
%             figure;
%             title(['Score: ' num2str(problem(f).score) ' Fval = ' num2str(problem(f).fval) ' Frame No: ' num2str(problem(f).frame_number)])
            imagesc(Test(problem(f).frame_number).Frame); hold on;
            plot(problem(f).actual(:, 1), problem(f).actual(:, 2), 'g*');
            plot(problem(f).predicted(:, 1), problem(f).predicted(:, 2), 'r*');
            disp(['Score: ' num2str(problem(f).score) ' Fval = ' num2str(problem(f).fval) ' Frame No: ' num2str(problem(f).frame_number)]);
            pause;
            close;
            hold off;
        end
    end
end
close all;