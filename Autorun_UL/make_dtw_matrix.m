%% MAKE A MATRIX OF PAIR-WISE DTW SCORES FOR TRAINING CONTOURS
%  INPUT: TRAINING SET CONTOURS (N x 1)
%  OUTPUT: DTW SCORE MATRIX (N x N)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function make_dtw_matrix(sub)

% sub = {'F1', 'F2', 'M1', 'M2'};
for s = 1:size(sub, 2)
    for fold = 1:5
    
        load(['./' sub{s} '/Fold' num2str(fold) '/Training.mat']);
        % load([path '/Master_' sub{s} '_training.mat']);

        N = size(Training, 2);
        DTW_Matrix = zeros(N, N);


        for i = 1:N
            disp(num2str(i));
            for j = i:N
                DTW_Matrix(i, j) = evaluate_dtw(Training(i).Along, Training(j).Along);
            end
        end
        DTW_Matrix = DTW_Matrix + DTW_Matrix';
        save(['./' sub{s} '/Fold' num2str(fold) '/DTW_Matrix.mat'], 'DTW_Matrix');
        clear DTW_Matrix;
    end
end