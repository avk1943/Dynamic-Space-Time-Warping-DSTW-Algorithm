function class_label = dstw_classifier(filename, start_frame, end_frame)
% Name: Ashwitha Kassetty
% UTA ID: 1001551943
% CSE 4310 - Honors Contract Assignment

frames_quan = [143, 165; 220, 300; 350, 445; 495, 544; 608, 701; 763, 850; 906, 961; 1035, 1150; 1206, 1277; 22, 91];
frames_joni = [183, 212; 270, 338; 399, 467; 532, 578; 650, 738; 789, 857; 915, 964; 1022, 1137; 1200, 1277; 47, 105];
min_score = -1;
k_value = 10;
class_label1 = 0;
class_label2 = 0;

test = detect_hand_trajectory(filename, start_frame, end_frame, k_value);

for index = 1:10
    start = frames_quan(index, 1);
    ending = frames_quan(index, 2);
    
    train = training_hand_trajectory('gesture_videos/digits_model_quan_ex3.avi', start, ending);
    
    
    M = size(train, 1);
    Q = size(test, 1, 3);
    % disp(Q);
    % disp(size(Q));
    % disp(size(M));
    
    scores = zeros(M, Q(1), Q(2));
    % disp(size(scores));
    
    for k = 1:k_value
        scores(1,1,k) = distance_measure(train(1,:), test(1,:,k));
    end
    
    for i = 2:M
        for k = 1:k_value
            scores(i,1,k) = scores(i-1, 1, k) + distance_measure(train(i,:), test(1,:,k));
        end
    end
    
    for j = 2:Q(1)
        for k = 1:k_value
            scores(1,j,k) = scores(1, j-1, k) + distance_measure(train(1,:), test(j,:,k));
        end
    end
            
    
    for i = 2:M
        for j = 2:Q(1)
            for k = 1:k_value
                cost = distance_measure(train(i,:), test(j,:,k));
                prev = min([scores(i-1,j,k), scores(i,j-1,k), scores(i-1,j-1,k)]);
                scores(i,j,k) = cost + prev;
            end
        end
    end
    
    %disp(size(scores));
    f_scores = min(scores(M,Q(1),:));
    %disp(size(f_scores));
    
    if (f_scores < min_score) || (min_score == -1)
        min_score = f_scores;
        class_label1 = index;
    end  
end
class_label1 = mod(class_label1, 10);

for index = 1:10
    start = frames_joni(index, 1);
    ending = frames_joni(index, 2);
    
    train = training_hand_trajectory('gesture_videos/digits_model_joni_ex3.avi', start, ending);
    
    
    M = size(train, 1);
    Q = size(test, 1, 3);
    % disp(Q);
    % disp(size(Q));
    % disp(size(M));
    
    scores = zeros(M, Q(1), Q(2));
    % disp(size(scores));
    
    for k = 1:k_value
        scores(1,1,k) = distance_measure(train(1,:), test(1,:,k));
    end
    
    for i = 2:M
        for k = 1:k_value
            scores(i,1,k) = scores(i-1, 1, k) + distance_measure(train(i,:), test(1,:,k));
        end
    end
    
    for j = 2:Q(1)
        for k = 1:k_value
            scores(1,j,k) = scores(1, j-1, k) + distance_measure(train(1,:), test(j,:,k));
        end
    end
            
    
    for i = 2:M
        for j = 2:Q(1)
            for k = 1:k_value
                cost = distance_measure(train(i,:), test(j,:,k));
                prev = min([scores(i-1,j,k), scores(i,j-1,k), scores(i-1,j-1,k)]);
                scores(i,j,k) = cost + prev;
            end
        end
    end
    
    %disp(size(scores));
    f_scores = min(scores(M,Q(1),:));
    %disp(size(f_scores));
    
    if (f_scores < min_score) || (min_score == -1)
        min_score = f_scores;
        class_label2 = index;
    end  
end
class_label2 = mod(class_label2, 10);

%disp(class_label1);
%disp(class_label2);

if class_label1 == class_label2
    class_label = class_label1;
else
    class_label = max([class_label1,class_label2]);
end
%class_label = mod(class_label, 10);
end