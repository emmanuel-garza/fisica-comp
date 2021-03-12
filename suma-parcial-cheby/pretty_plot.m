function pretty_plot( fig_handle, fsize )

figure( fig_handle )

set(gca,'fontsize',fsize);
set(gcf, 'units','points','position',[100,100,550,400] )
% grid minor;

%
% Ticks
%
% set(gca, 'YTick', 10.^(-12:2:0) )
% set(gca, 'XTick', [0,5,10,15,20] )

%
% Tick Labels
%
% set(gca, 'YTickLabels', {'','10^{-14}','','10^{-12}','','10^{-10}','','10^{-8}','','10^{-6}', ...
%     '','10^{-4}','','10^{-2}','','10^{0}',''} );
%
% set(gca,'ticklabelinterpreter','latex')

% 
% Inner plot position
%
% pos = get( gca, 'InnerPosition' );
% pos = [ 0.1753    0.1560    0.7297    0.7690 ];
% set( gca, 'InnerPosition', pos );

end