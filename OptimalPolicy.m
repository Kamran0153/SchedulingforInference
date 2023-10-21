p=p(1:end,:);
tdelta=length(p(:,1));

% Buffer Size
B=10;

 
% Initialization
for delta=1:tdelta
    for d=1:B
    z(delta, d)=0;
    l(delta,d)=1;
    b(delta, d)=0;
    end
end

for n=1:10
    n
    PolicyEvaluation2
    policyimprovement2
end
mse_opt=popt;