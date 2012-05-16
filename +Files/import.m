function data = import(fileToRead)
newData = importdata(fileToRead);

data = struct();
for i = 1:size(newData.colheaders, 2)
    data.(genvarname(newData.colheaders{i})) = newData.data(:,i);
end
data.colheaders = newData.colheaders;