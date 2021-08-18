function [scores, result, center] = ...
    green_hands(video_frames, frame, hand_size)

% [scores, result, center] = green_hands(video_frames, frame, hand_size)
% Code provided by Dr. Vassilis Athitsos

current = double(video_frames(:,:,:,frame));
green_scores = 2 * current(:, :, 2) - current(:, :, 1) - current(:, :, 3);
%green_scores = (current(:, :, 2) > current(:, :, 1)) & (current(:, :, 2) > current(:, :, 3));

previous = video_frames(:,:,:, frame-1);
previous_gray = double_gray(previous);
current_gray = double_gray(current);
next = video_frames(:,:,:, frame+1);
next_gray = double_gray(next);

frame_diff = min(abs(current_gray-previous_gray), abs(current_gray-next_gray));
green_motion_scores = green_scores .* frame_diff;

scores = imfilter(green_motion_scores, ones(hand_size), 'same', 'symmetric');
[result, center] = top_detection_results(current, scores, hand_size, ...
                                          1, 1);