function trajectory = training_hand_trajectory(filename, start_frame, end_frame)

trajectory = zeros(end_frame - start_frame + 1, 2);
frames = read_video_frames(filename);

for i = start_frame:end_frame    
    [~,~,trajectory(i-start_frame+1,:)] = green_hands(frames,i,[40,30]);
    %disp(trajectory(i-start_frame+1,:));
    %disp(size(trajectory(i-start_frame+1,:)));
end