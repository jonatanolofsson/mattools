%% Save all figures
% Saves all figures to a specified destination directory
%
%%% Input arguments:
%	this            - The Figures object
%
%	destination     - The path to the destination directory
%
%	format          - Which format to be used when saving. See saveas()
%                       for further information on available formats.
%                       Default format is 'psc2', i.e. PostScript2
%
%%% Output arguments:
%	[ none ]
%
%%% Credits and history
% By:	Jonatan Olofsson			2010-11
%
% Changelog:
%   [ none ]
%
function closeall(this)
    close(struct2array(this.figuremap))
end