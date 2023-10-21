function E=epenalty(k, T, f)
maxf=max(f);
for i=1:length(T)
    if k+T(i)<=length(f)-1
        penalty(i)=f(k+T(i)+1);
    else
        penalty(i)=maxf;
    end
end
E=mean(penalty);