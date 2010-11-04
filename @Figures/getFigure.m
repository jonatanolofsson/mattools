%% Get figure
% Get a figure from a reference name. Create if name not previously defined
%
%%% Input arguments:
%	this            - The Figures object
%
%	figure_name     - The named used to reference the figure
%
%%% Output arguments:
%	fig             - The number (used by matlab) that represents the
%                       figure
%
%%% Credits and history
% By:	Jonatan Olofsson			2010-11
%
% Changelog:
%   [ none ]
%
function fig = getFigure(this, figure_name)
    if ~isfield(this.figuremap, figure_name)
        this.figuremap.(figure_name) = figure('Visible', plots_visible);
        orient landscape;
    end
    fig = this.figuremap.(figure_name);
end