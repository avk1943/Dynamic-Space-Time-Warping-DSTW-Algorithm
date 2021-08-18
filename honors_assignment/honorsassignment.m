%% HONORS ASSIGNMENT

%% Matlab file to call the task functions

frames_quan = [143, 165; 220, 300; 350, 445; 495, 544; 608, 701; 763, 850; 906, 961; 1035, 1150; 1206, 1277; 22, 91];
frames_joni = [183, 212; 270, 338; 399, 467; 532, 578; 650, 738; 789, 857; 915, 964; 1022, 1137; 1200, 1277; 47, 105];
frames_michalis = [148, 190; 268, 328; 385, 466; 509, 551; 631, 704; 753, 849; 876, 911; 984, 1070; 1119, 1175; 29, 94];
frames_tian = [150, 170; 211, 292; 334, 427; 471, 515; 562, 641; 687, 767; 814, 866; 912, 1026; 1058, 1139; 17, 109];
%% TASK 1

% start = frames_joni(3, 1);
% ending = frames_joni(3, 2);
% test = dstw_classifier('gesture_videos/digits_model_joni_ex3.avi',start, ending);
% disp(test);

% q_classes = zeros(10, 1);
% 
% for i = 1:10
%     start = frames_joni(i, 1);
%     eding = frames_joni(i, 2);
% 
%     q_classes(i) = dstw_classifier('gesture_videos/digits_model_joni_ex3.avi',start, ending);
% end
% disp(q_classes);

%% TASK 2

% p_classes = zeros(10, 1);
% accuracy = 0;
% for i = 1:10
%     start = frames_michalis(i, 1);
%     ending = frames_michalis(i, 2);
% 
%     p_classes(i) = dstw_classifier('gesture_videos/digits_short_sleeves_michalis_ex4.avi', st, ending);
%     
%     if p_classes(i) == mod(i, 10)
%         accuracy = accuracy + 0.05;
%     end
%                        
% end
% disp('test set 1: michalis');
% disp(p_classes);

% p_classes_two = zeros(10, 1);
% for i = 1:10
%     start = frames_tian(i, 1);
%     ending = frames_tian(i, 2);
% 
%     p_classes_two(i) = dstw_classifier( 'gesture_videos/digits_short_sleeves_tian_ex3.avi',start, ending);
%                            
%     if p_classes_two(i) == mod(i, 10)
%         accuracy = accuracy + 0.05;
%     end
% end
% % disp('test set 2: tian');
% % disp(p_classes_two);
% fprintf('Accuracy: %1.2f\n', accuracy);

%% TASK 3

% test_two = dstw_spot('gesture_videos/digits_short_sleeves_tian_ex3.avi');
% disp(test_two);

%% TASK 4

% class_t = ones(10,1)*5000;
%  
% test = dtw_spot('gesture_videos/digits_model_quan_ex3.avi', class_t);
% % disp(test);
% accuracy = spot_accuracy(frames_quan, test, 10);
% disp(accuracy);

% test_two = dstw_spot('gesture_videos/digits_short_sleeves_tian_ex3.avi');
% % disp(test_two);
% accuracy = spot_accuracy(frames_tian, test_two, 10);
% disp(accuracy);

% test_two = dstw_spot('gesture_videos/digits_short_sleeves_michalis_ex4.avi');
% % disp(test_two);
% accuracy = spot_accuracy(frames_michalis, test_two, 10);
% disp(accuracy);