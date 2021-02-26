% See http://nibot-lab.livejournal.com/73290.html for more info

function save2pdf(name)

% Get the correct size of the figure
fig       = gcf;
fig.Units = 'inches';
w         = fig.OuterPosition(3);
h         = fig.OuterPosition(4);

% Set the page properties
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperSize', [w h]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 w h]);
set(gcf, 'renderer', 'painters');

% Save to the pdf file
print(gcf, '-dpdf', [name, '.pdf'])

end
