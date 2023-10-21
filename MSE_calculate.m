function avg_penalty=MSE_calculate(delta, f)
maxf=max(f);
penalty=zeros(1, length(delta));
for i=1:length(delta)
    if delta(i)<=length(f)-1
        penalty(i)=f(delta(i)+1);
    else
        penalty(i)=maxf;
    end
end
%penalty
avg_penalty=mean(penalty);
    