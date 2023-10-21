clc;
clf;
%Inference Error: err_inference(\delta, d)
CSIInferenceError
%Sample Number
SampleNumber=10^3;
X=ones(1, SampleNumber);
%Buffer Size
Buffer=10;
% Range of alpha value in T_i(l)=ceil(alpha*l)
alpharange=[0.01 0.1:0.1:1];
% Optimal Policy with TIFL
MSE_fixed_optimal=zeros(1, length(alpharange));
for i=1:length(alpharange)
    alpha=alpharange(i);    
    %% Optimal Policy with TIFL
    for j=1:Buffer
    T=ceil(alpha*j);
    TransmissionTimes=X*T;
    f=p(:,j);
    f=[p(1,j); f];
    % Computing Index Function \gamma_l(\delta, d)
    AveragePenalty=zeros(1,length(f));
    Index=zeros(1, length(f));
    for k=1:length(f)
    AveragePenalty(k)=epenalty(k-1, TransmissionTimes, f);
    end
    for delta=1:length(f)
        Index(delta)=Gittins_Index(AveragePenalty,delta);
    end
    MSE_optimal_b=zeros(1, Buffer-j+1);
    parfor b=1:Buffer-j+1
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
   [MSE(j), position(j)]=min(MSE_optimal_b);
    MSE_1(j)=MSE_optimal_b(1);
    end
    MSE_fixed_optimal(i)=min(MSE);
    %MSE_G(i)=MSE_1(1);
    %MSE_G10(i)=MSE_1(end);

    %Optimal Policy with TVFL
    OptimalPolicy
    MSE_opt(i)=mse_opt;
end
%Generate-at-will, zero wait
MSE_zero1=p(1,1)*ones(1, length(alpharange)); % Since feature transmission time of l=1 is 1.
% Periodic Updating with period 4
MSE_uniform1=mean(p(1:4, 1))*ones(1, length(alpharange));

figure(1)
semilogy(alpharange, MSE_uniform1, 'g-', alpharange, MSE_zero1, 'ko-', alpharange,  MSE_fixed_optimal, 'bs-', alpharange, MSE_opt, 'k--');
legend('Periodic Updating, l=1',  'Generate-at-Will, Zero Wait, l=1','Optimal Policy with TIFL', 'Optimal Policy with TVFL')
xlabel('\alpha'), ylabel('Average Inference Error')