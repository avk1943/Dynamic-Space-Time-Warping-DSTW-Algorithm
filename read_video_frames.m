function result = read_video_frames(filename)

% Code provided by Dr. Vassilis Athitsos

video_object = VideoReader(filename);
duration = video_object.Duration;
frame_rate = video_object.FrameRate;
rows = video_object.Height;
cols = video_object.Width;
frames = round(duration * frame_rate);
result = zeros(rows, cols, 3, frames, 'uint8');

frame = 0;
while hasFrame(video_object)
    frame_image = readFrame(video_object);
    frame = frame + 1;
    result(:,:,:,frame) = frame_image;
end
