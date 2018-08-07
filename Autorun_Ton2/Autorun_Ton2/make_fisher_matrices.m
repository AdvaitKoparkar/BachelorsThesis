%% FINDING FISHER MATRIX FOR EACH TEST CLIP AGAINST ALL FISHER VALUES
% INPUT: 5 TEST CLIPS OF SIZE Ni (i = 1:5)
%        TRAINING CONTOURS OF SIZE M
% OUTPUT: 5 MATRICES OF SIZE M x Ni (i = 1:5)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function make_fisher_matrices(sub)
% sub = {'F1', 'F2', 'M1', 'M2'};


for s = 1:size(sub, 2)
    for fold = 1:5

        load(['./' sub{s} '/Fold' num2str(fold) '/Training.mat']);
        disp('Loaded training contours');
        load(['./' sub{s} '/Fold' num2str(fold) '/Dev.mat']);
        disp('Loaded Dev images');
        load(['./' sub{s} '/Fold' num2str(fold) '/Test.mat']);
        disp('Loaded Test Images');
        
        
        disp('Finding Dev Fisher Matrix');
        Dev_len = length(Dev);
        Fisher_Matrix_Dev = zeros(length(Training), Dev_len);
        for f = 1:length(Dev) % For every Frame in Dev
            disp([sub{s} ': Fold ' num2str(fold) ' frame: ' num2str(f) ' out of ' num2str(Dev_len)]);
            frame = Dev(f).Frame;
            imagesc(frame);
            pause(0.001);
            for c = 1:length(Training) % For every contour in Training
                Fisher_Matrix_Dev(c, f) = getFisher(Training(c).In, Training(c).Out, Training(c).Along, frame, @interparc, @getVal);
            end
        end
        save(['./' sub{s} '/Fold' num2str(fold) '/Fisher_Matrix_Dev.mat'], 'Fisher_Matrix_Dev');
        
        disp('Finding Test Fisher Matrix');
        Test_len = length(Test);
        Fisher_Matrix_Test = zeros(length(Training), Test_len);
        for f = 1:Test_len % For every Frame in Test
            disp([sub{s} ': Fold ' num2str(fold) ' frame: ' num2str(f) ' out of ' num2str(Test_len)]);
            frame = Test(f).Frame;
            imagesc(frame);
            pause(0.001);
            for c = 1:length(Training) % For every contour in Training
                Fisher_Matrix_Test(c, f) = getFisher(Training(c).In, Training(c).Out, Training(c).Along, frame, @interparc, @getVal);
            end
        end
        save(['./' sub{s} '/Fold' num2str(fold) '/Fisher_Matrix_Test.mat'], 'Fisher_Matrix_Test');
        
    end
        
end
end