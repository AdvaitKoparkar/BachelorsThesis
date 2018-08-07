%% Extract ith clip data from FullData
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function clip_data = extract_clip(FullData, VideoLengths_forSub, i1)

    clip_data = [];
    if i1 == 1
        clip_data = FullData(1:VideoLengths_forSub(i1));
    else
        ind = sum(VideoLengths_forSub(1:i1-1)) + 1;
        clip_data = FullData(ind:ind+VideoLengths_forSub(i1)-1);
    end
end