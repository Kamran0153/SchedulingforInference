function gittins=Gittins_Index(epenalty, delta)
maxe=max(epenalty);
gittinsk=zeros(1, length(epenalty));
for k=1:length(gittinsk)
    sum_penalty=0;
    for j=0:k-1
        if delta+j<=length(epenalty)-1
            sum_penalty=sum_penalty+epenalty(delta+j);
        else 
            sum_penalty=sum_penalty+maxe;
        end
    end
    gittinsk(k)=sum_penalty/k;
end
gittins=min(gittinsk);