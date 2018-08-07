%% Creates Frame by deleting pixels above upper_contour

function create_frame_upper_contour_dev(sub)
% sub = {'F1'}; % , 'F2', 'M1', 'M2'};

for s = 1:size(sub, 2)
    for fold = 1:5
        load(['./Upper_contours/' sub{s} '/Fold' num2str(fold) '/Upper_lip_' sub{s} '_fold' num2str(fold) '_dev.mat'])
        for i = 1:length(upper_contour)
            for j = 1:length(upper_contour(i).contour)    
                y = ceil(upper_contour(i).contour(j, 2));
                x1 = floor(upper_contour(i).contour(j, 1));
                x2 = ceil(upper_contour(i).contour(j, 1));
                while y > 1
                    upper_contour(i).Frame(y, x1) = 0;
                    upper_contour(i).Frame(y, x2) = 0;
                    y = y - 1;
                end
            end
        
            imagesc(upper_contour(i).Frame);
            pause(0.05);
            
        end
        save(['./Upper_contours/' sub{s} '/Fold' num2str(fold) '/Upper_lip_' sub{s} '_fold' num2str(fold) '_cut_dev.mat'], 'upper_contour');
    end
end