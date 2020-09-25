filename = "LFP5.central.column00";
delimiterIn = '\t';
A = importdata(filename);
time = A(:,1);
LFP = A(:,2:end);
figure(2)
plot(time, LFP)
xlabel('Time')
ylabel('Central LFP')
stimStart = find(time==2.0);
stimeEnd = find (time==2.5);
stimTime= time(stimStart:stimeEnd);
stimVector = LFP(stimStart:stimeEnd);
Max = max(findpeaks(stimVector,stimTime));
exp = floor(log10(Max));
prom = 10^exp;

figure(3)
x = length(findpeaks(stimVector,stimTime,'MinPeakProminence',prom));
findpeaks(stimVector,stimTime,'MinPeakProminence',prom);
xlabel('Time');
ylabel('Central LFP');
title = "spikes times where t=[2.5, 3.0]. number of spikes = " + x;