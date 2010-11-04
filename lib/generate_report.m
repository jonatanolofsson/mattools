%% Run all chapters m-files and generate all figures
function generate_report()
    listing = dir;
    for f = 1:length(listing)
        if listing(f).isdir
            mdir = [listing(f).name '/matlab'];
            if exist(mdir, 'dir')
                mfile = [mdir '/plot.m'];
                if exist(mfile, 'file')
                    figures = Figures();
                    run(mfile);
                    figures.save([mdir '/figures']);
                end
            end
        end
    end
end