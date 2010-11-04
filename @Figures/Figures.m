classdef Figures < handle
    properties
        figuremap = struct;
        plots_visible = 'on';
    end
    methods
        fig = getFigure(this, figure_name);
        toPDF(this, figures, filename);
        save(this, destination, format);
    end
end