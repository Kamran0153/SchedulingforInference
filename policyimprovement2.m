
for delta=1:tdelta
    for d=1:B
        x=100000;
        for a=1:B
            T=ceil(alpha*a);
            for c=0:B-a
                for e=0:tdelta
                    %calculate the value y for all a, c, e
                    y=0;
                    for x1=0:e+T-1
                        if delta+x1>length(p(:,1))
                            y=y+max(p(:,d))-popt;
                        else
                            y=y+p(delta+x1,d)-popt;
                        end
                    end
                    if c+T>length(v(:,1))
                        y=y+v(end,a);
                    else
                        y=y+v(c+T,a);
                    end

                    %if x is greater than y, x=y and assign values
                    if x>y
                        x=y;
                        l(delta, d)=a;
                        b(delta, d)=c;
                        z(delta,d)=e;
                    end
                end
            end
        end
    end
end




