function trajectory = detect_hand_trajectory(filename, start_frame, end_frame, k_value)

trajectory = zeros(end_frame - start_frame + 1, 2, k_value);
frames = read_video_frames(filename);
% disp(size(frames));

for i = start_frame:end_frame
    if i == end_frame
        [~, ~, result] = detect_hands(frames(:,:,:,i-1), frames(:,:,:,i), frames(:,:,:,i), [40,30], 1, k_value);
        trajectory(i-start_frame + 1, :,:) = result';
    elseif i == start_frame
        [~, ~, result] = detect_hands(frames(:,:,:,i), frames(:,:,:,i), frames(:,:,:,i+1), [40,30], 1, k_value);
        trajectory(i-start_frame + 1, :,:) = result';
    else
        [~, ~, result] = detect_hands(frames(:,:,:,i-1), frames(:,:,:,i), frames(:,:,:,i+1), [40,30], 1, k_value);
        trajectory(i-start_frame + 1, :,:) = result';
    end
end


end