function [scores, result, centers] = detect_hands(previous, current, next, hand_size, suppression_factor, number)

% function [scores, result, centers] = ...
%    detect_hands(previous, current, next, ...
%                 hand_size, suppression_factor, number)

% Code provided by Dr. Vassilis Athitsos

negative_histogram = read_double_image('negatives.bin');
positive_histogram = read_double_image('positives.bin');
skin_scores = detect_skin(current, positive_histogram, negative_histogram);

previous_gray = double_gray(previous);
current_gray = double_gray(current);
next_gray = double_gray(next);
frame_diff = min(abs(current_gray-previous_gray), abs(current_gray-next_gray));

skin_motion_scores = skin_scores .* frame_diff;
scores = imfilter(skin_motion_scores, ones(hand_size), 'same', 'symmetric');
[result, centers] = top_detection_results(current, scores, hand_size, suppression_factor, number);

