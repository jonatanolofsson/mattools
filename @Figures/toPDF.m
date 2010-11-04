%% Export figure to pdf
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