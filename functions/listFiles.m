function files = listFiles()

% being in an incorrect dir creates problems, make moving to 'data' somehow
% more dynamic?
if ~(endsWith(pwd, 'data'))
    if  ~(endsWith(pwd, 'Neuroimaging_Signals_Toolbox'))
        cd 'Neuroimaging_Signals_Toolbox';
    end
    cd 'data';
end

files = ls('*txt');
spaces = length(files);
filler(1:spaces) = ' ';
files = cat(1, [filler], files); % 1 concatenates vertically

end