%% Run all chapters m-files and generate all figures
function generate_report(show_plots, rdir)
    if nargin < 1, show_plots = 'off'; end;
    if nargin < 2, rdir = pwd; end;

    listing = dir(rdir);
    for f = 1:length(listing)
        if strcmp(listing(f).name(1), '.'), continue; end;
        if listing(f).isdir
            mdir = [listing(f).name '/matlab'];
            if exist(mdir, 'dir')
                mfile = [mdir '/' listing(f).name '.m'];
                if exist(mfile, 'file')
                    figures = Figures();
                    figures.plots_visible = show_plots;
                    disp(mfile);
                    run(mfile);
                    figures.save([listing(f).name '/figures']);
                end
            end
        end
    end
end