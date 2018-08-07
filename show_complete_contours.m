%% Show completed contours

function show_complete_contours(sub)

for s = 1:size(sub, 2)
    for fold = 1:5
        load(['./Upper_contours/' sub{s} '/Fold' num2str(fold) '/Upper_lip_' sub{s} '_fold' num2str(fold) '.mat']);
        load(['./Lower_contours/' sub{s} '/Fold' num2str(fold) '/Lower_' sub{s} '_fold' num2str(fold) '.mat']);
        
        for f = 1:size(lower_contour, 2)
            imagesc(lower_contour(f).Frame); hold on;
            plot(upper_contour(f).contour(:, 1), upper_contour(f).contour(:, 2), 'r-');
            plot(lower_contour(f).contour(:, 1), lower_contour(f).contour(:, 2), 'c-');
            hold off;
            pause;
        end
    end
end
