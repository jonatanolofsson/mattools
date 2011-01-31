%% Run all chapters m-files and generate all figures
function generate_report(show_plots, rdir)
    if nargin < 1, show_plots = 'off'; end;
    if nargin < 2, rdir = pwd; end;
    kvars.show_plots = show_plots;

    kvars.listing = dir(rdir);
    for f = 1:length(kvars.listing)
        if strcmp(kvars.listing(f).name(1), '.'), continue; end;
        if kvars.listing(f).isdir
            kvars.mdir = [kvars.listing(f).name '/matlab'];
            if exist(kvars.mdir, 'dir')
                kvars.mfile = [kvars.mdir '/' kvars.listing(f).name '.m'];
                if exist(kvars.mfile, 'file')
                    figures = Figures();
                    figures.plots_visible = kvars.show_plots;
                    disp(kvars.mfile);
                    run(kvars.mfile);
                    figures.save([kvars.listing(f).name '/figures']);
                    if strcmp(kvars.show_plots, 'off')
                        figures.closeAll();
                    end
                end
            end
        end
    end
end