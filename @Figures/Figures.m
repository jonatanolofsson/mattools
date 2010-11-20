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