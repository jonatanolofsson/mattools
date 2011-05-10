%% Run all chapters m-files and generate all figures
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
% Todo: Move show_plots to an option structure
%
%%% Input arguments:
%	this            - The Figures object
%
%	dirs            - The name of the directory to generate (or a cell of names)
%
%	show_plots      - Whether to continue to show the plots after the
%                       script has finished
%
%%% Credits and history
% By:	Jonatan Olofsson			2010-11
%
% Changelog:
%   [ none ]
function generate_report(dirs, show_plots)
    if nargin < 1 || isempty(dirs)
        dirs = {};
        dirs_ = dir(pwd);
        for f = 1:length(dirs_);
            dirs{f} = dirs_(f).name;
        end
    elseif ischar(dirs)
        dirs = {dirs};
    end
    if nargin < 2 || strcmpi(show_plots, 'On')~=0, show_plots = 'off'; end;
    kvars.show_plots = show_plots;
    kvars.dirs = dirs;
    
    for f = 1:length(kvars.dirs)
        if strcmp(kvars.dirs{f}(1), '.'), continue; end;
        if exist(kvars.dirs{f}, 'dir')
            kvars.mdir = [kvars.dirs{f} '/matlab'];
            if exist(kvars.mdir, 'dir')
                kvars.mfile = [kvars.mdir '/' kvars.dirs{f} '.m'];
                if exist(kvars.mfile, 'file')
                    figures = Figures();
                    figures.plots_visible = kvars.show_plots;
                    disp(kvars.mfile);
                    run(kvars.mfile);
                    figures.save([kvars.dirs{f} '/figures']);
                    if strcmp(kvars.show_plots, 'off')
                        figures.closeAll();
                    end
                end
            end
        end
    end
end