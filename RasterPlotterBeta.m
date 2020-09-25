clear all;
close all;
%Gets the directory
myDir = uigetdir;
myFiles = dir(fullfile(myDir, 'membrane.*'));
strCell = {};
%**********************************************************
%Raster plot
clear title xlabel ylabel;
numSample = 25;
figure(1);
for (i=1:1:length(myFiles))
strCell{i}=myFiles(i).name; % Creates names for the legend.
filename = myFiles(i).name;
fullFileName = fullfile(myDir, filename);
disp(fullFileName);
hold all;
delimiterIn = '\t';
A = importdata(fullFileName);
time = A(:,1);
LFP = A(:,2:end);
MeanLFP = mean(LFP,2);
smoothLFP = smoothdata(MeanLFP,'gaussian',50);
[peak, locs, width, prom] = findpeaks(smoothLFP, time);
[peak1, loc1] = findpeaks(smoothLFP, time, 'MinPeakProminence', 0.25*max(prom));
spikes = i*ones(size(loc1));
plot(loc1, spikes, '^', 'MarkerSize', 5)
end
set(gca, 'ytick', [1:length(strCell)], 'yticklabel', strCell);
saveas(gca, fullfile(myDir, 'Raster'), 'jpeg');