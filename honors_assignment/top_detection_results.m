function [result, centers] = top_detection_results(frame, scores, hand_size, suppression_factor, number)

% function [result, centers] = ...
%     top_detection_results(frame, scores, hand_size, ...
%                           suppression_factor, number)

% Code provided by Dr. Vassilis Athitsos

half_rows = floor(hand_size(1) / 2);
half_cols = floor(hand_size(2)/ 2);

result = frame;
centers = zeros(number, 2);
rows = size(frame, 1);
cols = size(frame, 2);

for i = 1:number
    max_score = max(max(scores));
    [max_rows, max_cols] = find(scores == max_score);
    max_location = [max_rows(1), max_cols(1)];
    centers(i, :) = max_location;
    
    current_top = max_location(1) - half_rows;
    current_bottom = max_location(1) + half_rows;
    current_left = max_location(2) - half_cols;
    current_right = max_location(2) + half_cols;

    result = draw_rectangle1(result, current_top, current_bottom, ...
                             current_left, current_right);
    
    top = max(1, round(max_location(1) - half_rows * suppression_factor));
    bottom = min(rows, round(max_location(1) + half_rows * suppression_factor));
    left = max(1, round(max_location(2) - half_cols * suppression_factor));
    right = min(cols, round(max_location(2) + half_cols * suppression_factor));

    scores(top:bottom, left:right) = 0;
end