function result = dtw_spot(input_video, class_thresholds)

result = [];

frames_test = read_video_frames(input_video);
end_test = size(frames_test, 4);
test = training_hand_trajectory(input_video, 2, end_test-1);

frames_quan = [143, 165; 220, 300; 350, 445; 495, 544; 608, 701; 763, 850; 906, 961; 1035, 1150; 1206, 1277; 22, 91];

for index = 1:10
    start = frames_quan(index, 1);
    ending = frames_quan(index, 2);
    train = training_hand_trajectory('gesture_videos/digits_model_quan_ex3.avi', start, ending);
    
    M = size(train, 1);
    Q = size(test, 1);
    
    scores = zeros(M+1, Q+1);
    scores(:,1) = inf;
    
    for i = 1:M
        for j = 1:Q
            cost = distance_measure(train(i,:), test(j,:));
            prev = min([scores(i-1+1, j+1), scores(i+1,j-1+1), scores(i-1+1,j-1+1)]);
            scores(i+1,j+1) = cost + prev;
        end
    end
    
    low = min(scores(M+1, :));
    if (low > class_thresholds(index))
        continue;
    end
    
    [~, e] = find(scores(M+1, :) == low);
    
    maximum_length = -1;
    
    frame_start = inf;
    frame_end = inf;
    
    for current_end = e
        l = 0;
        i = M+1;
        j = current_end;
        
        while i>2
            prev = min([scores(i-1,j), scores(i,j-1), scores(i-1,j-1)]);
            
            if scores(i-1,j) == prev
                i = i-1;
            elseif scores(i-1,j-1) == prev
                i = i-1;
                j = j-1;
            else
                j = j-1;
            end
        end
        
        l = current_end - j;
        
        if l > maximum_length
            maximum_length = l;
            frame_start = j;
            frame_end = current_end;
        end
    end
    
    result = [result; frame_start(:), frame_end(:), mod(ones(size(frame_start,2),1)*index, 10)];
end        
end