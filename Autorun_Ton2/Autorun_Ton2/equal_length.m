%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MAKE GIVEN CONTOURS HAVE SAME NUMBER OF POINTS
%  INPUT:  Two arrays containing coordinates which may have different
%          lengths, optinal - number of points of output array
%  OUTPUT: Two contours corresponding to the input which are equal in the
%          number of points they have
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [c1, c2] = equal_length(contour1, contour2, n) 
    if ~exist('n', 'var'), n = 20; end
    % interpolate using interparc
    c1 = interparc(n, contour1(:, 1), contour1(:, 2));
    c2 = interparc(n, contour2(:, 1), contour2(:, 2)); 
    return;
end