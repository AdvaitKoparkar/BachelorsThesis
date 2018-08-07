function autorun(sub)

% % % % make_dtw_matrix(sub)
% % % make_fisher_matrices(sub)
% % % bestmap_Set1(sub)
% % % CompareTon1contour_DP(sub)

make_dtw_matrix(sub);
make_fisher_matrices(sub);
bestmap_Set1_Dev(sub);
Compare_Dev_contours(sub);
best_lambda(sub);

bestmap_Set1_Test(sub);
Compare_Test_contours(sub);
% show_result(sub);