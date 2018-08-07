%% Create Full Data Files
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


sub = {'F1', 'F2', 'M1', 'M2'};

for s = 1:size(sub, 2)
    load(['./' sub{s} '/Sets/Set1/Master_' sub{s} '_test.mat']);
    TEST = Master;
    load(['./' sub{s} '/Sets/Set1/Master_' sub{s} '_training.mat']);
    TR = Master;
    
    FullData = [TR, TEST];
    save(['./' sub{s} '/FullData.mat'], 'FullData');
end