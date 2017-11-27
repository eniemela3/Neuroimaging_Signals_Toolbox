function plotSignals()

global signal1 signal2 Fs;

len = length(signal1);
if length(signal2) > len
    len = length(signal2);
end

yyaxis left;
cla;
yyaxis right;
cla;

xaxis = 0 : 1 / Fs : (len - 1) / Fs;

if signal1
    yyaxis left;
    plot(xaxis, signal1);
    ylabel('Signal 1');
    xlabel('Time (s)');
end

if signal2
    yyaxis right;
    plot(xaxis, signal2);
    ylabel('Signal 2');
    xlabel('Time (s)');
end

end