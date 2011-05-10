%% Figure class definition
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
classdef Figures < handle
    properties(Access=public)
        plots_visible = 'on';
    end
    properties(GetAccess=public,SetAccess=private)
        figuremap = struct;
    end
    methods
        fig = getFigure(this, figure_name);
        registerFigure(this, name, fig);
        toPDF(this, figures, filename);
        save(this, destination, format);
        closeAll(this);
    end
end