%% Register figure
% Associate a figure with a reference name
%
%%% Input arguments:
%	this            - The Figures object
%
%	name            - The named used to reference the figure
%
%	fig             - The number (used by matlab) that represents the
%                       figure
%
%%% Credits and history
% By:	Jonatan Olofsson			2010-11
%
% Changelog:
%   [ none ]
%
function registerFigure(this, fig, name)
    this.figuremap.(name) = fig;
end