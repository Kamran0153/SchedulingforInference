clear all;
close all;
clc;
clf;
%Feature length
l=1;
%Inference Error function
CSIInferenceError
%Sample Number
%Transmission Time Generations: Here, we are generating constant
%transmission times
SampleNumber=10^3;
X=ones(1, SampleNumber);
TransmissionTimes=X;
Buffer=10;
%length=1
f=p(:,l);
 % Computing Index Function \gamma(\delta)
AveragePenalty=zeros(1,length(f));
Index=zeros(1, length(f));
for k=1:length(f)
 AveragePenalty(k)=epenalty(k-1, TransmissionTimes, f);
end
for delta=1:length(f)
    Index(delta)=Gittins_Index(AveragePenalty,delta);
end
  MSE_optimal_b=zeros(1, Buffer);
 parfor b=1:Buffer
    b
 % Bisection Search for solving equation (22)
    u=max(f);
    l=min(f);
    beta=(u+l)/2;
    MSE_optimal_b(b)=1000;
    epsilon=MSE_optimal_b(b)-beta;
    iteration=0;
    while abs(epsilon)>10e-9 && iteration<=30
        iteration=iteration+1;
        AoIO=optimal(TransmissionTimes, Index, beta, b-1);
        MSE_optimal_b(b)=MSE_calculate(AoIO, f);
        epsilon=MSE_optimal_b(b)-beta;
        if epsilon >=0
            l=beta;
        else
            u=beta;
        end
        beta=(l+u)/2;
     end
 end
 [OptimalMSE, position]=min(MSE_optimal_b);
    