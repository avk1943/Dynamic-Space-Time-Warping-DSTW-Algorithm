function accuracy = spot_accuracy(ground_frame_num, pred_frame_num, P)
accuracy = 0;
for index = 1:P
    if pred_frame_num(index, 3) == mod(index, 10)
        p_start = pred_frame_num(index, 1);
        g_start = ground_frame_num(index, 1);
        p_end = pred_frame_num(index, 2);
        g_end = ground_frame_num(index, 2);
        
        if (p_start > g_start - 10) && (p_start < g_start + 10) && (p_end > g_end - 10) && (p_end < g_end + 10)
            accuracy = accuracy + 0.1;
        end
    end 
end