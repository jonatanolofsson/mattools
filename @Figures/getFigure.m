%% Get figure
% 
% #~ Copyright (C) 2011  Jonatan Olofsson
% #~ This program is free software: you can redistribute it and/or modify
% #~ it under the terms of the GNU General Public License as published by
% #~ the Free Software Foundation, either version 3 of the License, or
% #~ (at your option) any later version.
% #~
% #~ This program is distributed in the hope that it will be useful,
% #~ but WITHOUT ANY WARRANTY; without even the implied warranty of
% #~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% #~ GNU General Public License for more details.
% #~
% #~ You should have received a copy of the GNU General Public License
% #~ along with this program.  If not, see <http://www.gnu.org/licenses/>.
% 
% #~ This software is provided by Jonatan Olofsson [jonatan.olofsson, gmail]
%
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
        this.registerFigure(figure('Visible', this.plots_visible, 'NumberTitle', 'Off', 'Name', figure_name), figure_name);
    end
    fig = this.figuremap.(figure_name);
    figure(fig);
end