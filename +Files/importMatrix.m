function data = importMatrix(fileToRead)
data = importdata(fileToRead);
sz = size(data);
data = data(1:(end-mod(sz(2), sz(2))),:);
data = permute(reshape(data',sz(2),sz(2),[]), [2 1 3]);