%% Save all figures
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
function closeAll(this)
    a = struct2array(this.figuremap);
    for i = a
        try
            close(i)
        end
    end
    this.figuremap = struct();
end