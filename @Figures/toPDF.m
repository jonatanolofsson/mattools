%% Export figure to pdf
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

% Creates a pdf with the plots from the figure handles in the first
% argument.
%
%%% Input arguments:
%	figures			- Figures to export to pdf, as a cell array
%
%	filename		- Name of the pdf output file
%
%%% Output arguments:
%	[ none ]
%
%%% Credits and history
% By:	Jonatan Olofsson			2010-07
%
% Changelog:
%	2010-11     Implemented function in the Figures class
%
function toPDF(this, filename, figs)
    mdir = [regexprep(fileparts(mfilename('fullpath')), '/\\$', '') '/'];
    gs = 'gs';
	
    files = cell(3, length(figs));
    
    if nargin < 3, figs = struct2cell(this.figuremap); end;

    for f=1:length(figs)
        files(:,f) = {'"'; [mdir 'work/fig2pdftmp__' num2str(f) '__.ps']; '" '};
        if is_integer(figs{f})
            cfigure = figs{f};
        elseif isfield(this.figuremap, figs{f})
            cfigure = this.figuremap.(figs{f});
        else
            continue;
        end
        saveas(cfigure, files{2,f}, 'psc2');
    end

    args = ['-q -dNOPAUSE -dSAFER -sOutputFile="' filename '" -sDEVICE=pdfwrite -sPAPERSIZE=a4 -dBATCH'];
	
    dos([gs ' ' args ' -f ' files{:}]);
    delete([mdir 'work/fig2pdftmp__*__.ps']);
end