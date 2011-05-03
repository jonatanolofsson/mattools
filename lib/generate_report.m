%% Run all chapters m-files and generate all figures
% Todo: Move show_plots to an option structure
function generate_report(dirs, show_plots)
    if nargin < 1 || isempty(dirs)
        dirs = {};
        dirs_ = dir(pwd);
        for f = 1:length(dirs_);
            dirs{f} = dirs_(f).name
        end
    elseif ischar(dirs)
        dirs = {dirs};
    end
    if nargin < 2, show_plots = 'off'; end;
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