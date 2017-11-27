function files = listFiles()

if ~(endsWith(pwd, 'data'))
    cd 'data';
end

files = ls('*txt');
spaces = length(files);
filler(1:spaces) = ' ';
files = cat(1, [filler], files); % 1 concatenates vertically

end