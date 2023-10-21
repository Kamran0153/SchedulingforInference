
v=zeros(tdelta+1, B);
popt=0;
tau=0.8;

%fixed state
delta1=1;
d1=B;

for k=1:100
    % old value function
    oldv=v;

    % optimal value
    x=0;
    T=ceil(l(delta1,d1)*alpha);
   for j=0:z(delta1,d1)+T-1
       if delta+j<=tdelta
           x=x+p(delta+j, d);
       else
          x=x+p(end, d);
       end 
   end
   if T+b(delta1,d1)<=tdelta+1
     x=x+tau*oldv(T+b(delta1,d1), l(delta1,d1));
   else
     x=x+tau*oldv(end, l(delta1, d1));
   end
     
     
for delta=1:tdelta+1
    for d=1:B
        
        if delta==tdelta+1
            v(delta, d)=v(tdelta,d);
        else
            v(delta, d)=0;
        
            T=ceil(alpha*l(delta,d));
            for j=0:z(delta, d)+T-1
                if delta+j<=tdelta
                    v(delta,d)=v(delta,d)+p(delta+j, d);
                else
                    v(delta, d)=v(delta,d)+p(end, d);
                end
            end
            
            if T+b(delta,d)<=tdelta+1
                v(delta, d)=(1-tau)*oldv(delta, d)+v(delta, d)+tau*oldv(T+b(delta,d), l(delta, d))-x;
            else
                v(delta, d)=(1-tau)*oldv(delta, d)+v(delta, d)+tau*oldv(tdelta, d)-x;
            end
        end
     end
end
T=ceil(alpha*l(delta1,d1));
popt=x/(z(delta1,d1)+T);
end

