%% Create Folds
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load VideoLengths.mat; load Folds.mat

sub = {'F1', 'F2', 'M1', 'M2'};
clips = {'354', '355', '357', '358', '359', '361', '382', '386', '387', '389'};

for s = 1:size(sub, 2)
    
    load(['./' sub{s} '/FullData.mat']);
    for fold = 1:length(Folds)
        Training = []; Test = []; Dev = [];
        for i = Folds(fold).Training
            Training = [Training, extract_clip(FullData, VideoLengths(:, s), i)];
        end
        for i = Folds(fold).Test
            Test = [Test, extract_clip(FullData, VideoLengths(:, s), i)];
        end
        for i = Folds(fold).Dev
            Dev = [Dev, extract_clip(FullData, VideoLengths(:, s), i)];
        end
        save(['./' sub{s} '/Fold' num2str(fold) '/Training.mat'], 'Training');
        save(['./' sub{s} '/Fold' num2str(fold) '/Test.mat'], 'Test');
        save(['./' sub{s} '/Fold' num2str(fold) '/Dev.mat'], 'Dev');
            
    end
end