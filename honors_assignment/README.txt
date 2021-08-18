Name: Ashwitha Kassetty
UTA ID: 1001551943
CSE 4310 - Honors Contract Assignment

Task 1:

I have not saved the pre-computations in a separate .mat file due to time constraints, but below I have explained my design choices for dstw_classifier.

(i) The test data utilizes detect_hands.m to compute the trajectory.
(ii) Since the training datasets use a green glove, the training data utilizes green_hands.m to compute the trajectory.
(iii) The k value (space dimension) is hardcoded. To change the value, the variable 'k_value' needs to be changed.
(iv) The classifier predicts a label for each of the training dataset ("model" datasets), and chooses the higher value label if the predicted labels are not the same.
(v) A suppresion factor of 1 was chosen for the top_detection_results function.
(vi) Hand size was assumed to be [40,30].

NOTE: Because of not being able to create a .mat file, the code does take 10 minutes to run.

Task 2: 

Accuracy for DSTW classifier;

k value = 1, Accuracy = 0.65
k value = 2, Accuracy = 0.65
k value = 3, Accuracy = 0.65
k value = 4, Accuracy = 0.65
k value = 5, Accuracy = 0.65
k value = 6, Accuracy = 0.65
k value = 7, Accuracy = 0.65
k value = 8, Accuracy = 0.65
k value = 9, Accuracy = 0.65
k value = 10, Accuracy = 0.65
k value = 11, Accuracy = 0.65
k value = 12, Accuracy = 0.65
k value = 13, Accuracy = 0.65
k value = 14, Accuracy = 0.65
k value = 15, Accuracy = 0.65 

Task 3:

I have not saved the pre-computations in a separate .mat file due to time constraints, but below I have explained my design choices for dstw_spot.
(i) I used 'gesture_videos/digits_model_quan_ex3.avi' for training.
(ii) The following error was prpoduced when i tried to train using 'gesture_videos/digits_model_joni_ex3.avi' video:
		
	Index in position 2 exceeds array bounds (must not exceed 1153).

	Error in dstw_spot (line 55)
            prev = min([min(scores(i-1,j,:)), min(scores(i,j-1,:)), min(scores(i-1,j-1,:))]);

	Error in honorsassignment (line 61)
	    test_two = dstw_spot('gesture_videos/digits_short_sleeves_tian_ex3.avi');
My initial idea was to create a 20 x 3 predicted results matrix by using both the "model" videos for training to suit task 4. As I was not able to solve the above error, so I had to stick with using only 'gesture_videos/digits_model_quan_ex3.avi' for training for task 3 and 4.
(iv) The result produced is a 10 x 3 matrix with the structure mentioned in the assignment. 
(v) The subgesture problem was answered by finding the gesture with the lowest score. The longest node length was taken into consideration if a tie occured. The largest amount of test nodes corresponding to the largest amount of training nodes is calculated as the longest path.

NOTE: Because of not being able to create a .mat file, the code does take 1 minute to run.

Task 4:

The accuracy was computed by checking if both the start and end frames fall in a range of +10 and -10 of the ground truth. The frame values given in the text files of gesture videos were used as ground truths. 

	Part a: DTW Accuracy for 'gesture_videos/digits_model_joni_ex3.avi' using gesture_videos/digits_model_quan_ex3.avi' for training:
			Accuracy = 0.8
		DTW Accuracy for 'gesture_videos/digits_model_quan_ex3.avi' using gesture_videos/digits_model_quan_ex3.avi' for training:
			Accuracy = 1.0
	Part b: DSTW Accuracy for 'gesture_videos/digits_short_sleeves_tian_ex3.avi' using gesture_videos/digits_model_quan_ex3.avi' for training with different k values:
			k value = 1, Accuracy = 0.7
			k value = 2, Accuracy = 0.7
			k value = 3, Accuracy = 0.8
			k value = 4, Accuracy = 0.8
			k value = 5, Accuracy = 0.8
			k value = 6, Accuracy = 0.8
			k value = 7, Accuracy = 0.8
			k value = 8, Accuracy = 0.8
			k value = 9, Accuracy = 0.8
			k value = 10, Accuracy = 0.8
			k value = 11, Accuracy = 0.8
			k value = 12, Accuracy = 0.8
			k value = 13, Accuracy = 0.8
			k value = 14, Accuracy = 0.8
			k value = 15, Accuracy = 0.8
		DSTW Accuracy for 'gesture_videos/digits_short_sleeves_michalis_ex4.avi' using gesture_videos/digits_model_quan_ex3.avi' for training with different k values:
			k value = 1, Accuracy = 0.1
			for k values 2-15, the code outputs the same error mentioned in task 3
