function cv = CV(data)

avg = mean(data);
sd = std(data);
if avg ~= 0
    cv = abs(sd / avg * 100);
else
    cv = Inf;
end

end