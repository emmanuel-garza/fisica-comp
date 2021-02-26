% See http://nibot-lab.livejournal.com/73290.html for more info

function save2png(name,resolution)


if strcmpi(resolution,'low')
    res = '90';
elseif strcmpi(resolution,'medium')
    res = '230';
elseif strcmpi(resolution,'high')
    res = '300';
else
    error('Incorrect resolution');
end
% Save to the pdf file
print(gcf,['-r',res], '-dpng', [name, '.png']);

end
