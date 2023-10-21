function delta=optimal(TransmissionTimes, Gittins, beta, b)
delta=3;
Busy=1; % if channel is busy, Busy=1;
t=0;
transmit_time=t;
i=1;
while i<length(TransmissionTimes)
t=t+1;
if Busy==1 && t-transmit_time==TransmissionTimes(i)
delta=[delta  b+TransmissionTimes(i)];
Busy=0;
else
delta=[delta delta(end)+1];
end
if Busy==0
if delta(end)<=length(Gittins)-1
G=Gittins(delta(end)+1);
else
G=max(Gittins);
end

if G >= beta
Busy=1;
transmit_time=t;
i=i+1;
end
end
end


    
