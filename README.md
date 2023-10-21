# SchedulingforInference
Run Fig5Main.m to get Fig. 5 of the paper titled “Learning and Communications Co-Design for Remote Inference Systems: Feature Length Selection and Transmission Scheduling”. 

CSIInferenceError.m contains the inference error function. To generate the inference error function for each pair of AoI and Feature length, please see the python code in an open source GitHub repository https://github.com/Kamran0153/Channel-State-Information-Prediction

Fig5Main.m mainly contains the procedure to get average inference error under optimal policy with TIFL and optimal policy with TVFL. 

For Generate-at-Will, Zero Wait, feature length l=1, the average inference error is err_inference(1,1). 

For periodic updating with time period=4 time slots, the average inference error is 
= (err_inference(1,1)+ err_inference(2,1)+ err_inference(3,1)+ err_inference(4,1))/4. 

Run OptimalPolicyFixedLength.m to get optimal average inference given a feature length l.
