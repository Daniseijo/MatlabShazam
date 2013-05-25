function [time] = sec2mins(seconds)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

minutes=floor(seconds/60);
secs= seconds -(minutes*60);

time = sprintf('%d:%.2d', minutes, floor(secs));

end

