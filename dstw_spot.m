function result = dstw_spot(input_video)
% Name: Ashwitha Kassetty
% UTA ID: 1001551943
% CSE 4310 - Honors Contract Assignment

result = [];
k_value = 15;
class_t = ones(10,1)*5000;
frames_test = read_video_frames(input_video);
end_test = size(frames_test, 4);
test = detect_hand_trajectory(input_video, 2, end_test-1, k_value);

frames_quan = [143, 165; 220, 300; 350, 445; 495, 544; 608, 701; 763, 850; 906, 961; 1035, 1150; 1206, 1277; 22, 91];
frames_joni = [183, 212; 270, 338; 399, 467; 532, 578; 650, 738; 789, 857; 915, 964; 1022, 1137; 1200, 1277; 47, 105];

for index = 1:10
    start = frames_quan(index, 1);
    ending = frames_quan(index, 2);
    train = training_hand_trajectory('gesture_videos/digits_model_quan_ex3.avi', start, ending);
    
    M = size(train, 1);
    Q = size(test, 1, 3);
    
    scores = zeros(M+1, Q(1)+1, Q(2));
    
    for k = 1:k_value
        scores(:,1,k) = inf;
    end
    
    for i = 1:M
        for j = 1:Q(1)
            for k = 1:k_value
                cost = distance_measure(train(i,:), test(j,:,k));
                prev = min([scores(i-1+1,j+1,k), scores(i+1,j-1+1,k), scores(i-1+1,j-1+1,k)]);
                scores(i+1,j+1,k) = cost + prev;
            end
        end
    end
    
    low = min(min(scores(M+1,:,:)));
    if (low > class_t(index))
        continue;
    end
    
    [~, e] = find(scores(M+1,:,:) == low);
    
    maximum_length = -1;
    
    frame_start = inf;
    frame_end = inf;
    
    for current_end = e
        l = 0;
        i = M+1;
        j = current_end;
        
        while i > 2
            prev = min([min(scores(i-1,j,:)), min(scores(i,j-1,:)), min(scores(i-1,j-1,:))]);
            if min(scores(i-1,j,:)) == prev
                i = i - 1;
            elseif min(scores(i-1,j-1,:)) == prev
                i = i - 1;
                j = j - 1;
            else
                j = j - 1;
            end 
        end
        
        l = current_end - j;
        
        if l > maximum_length
            maximum_length = l;
            frame_start = j;
            frame_end = current_end;
        end
    end
    
    gesture = mod(ones(size(frame_start,2),1)*index, 10);
    result = [result; frame_start(:), frame_end(:), gesture];
    % disp(1);
end
end
